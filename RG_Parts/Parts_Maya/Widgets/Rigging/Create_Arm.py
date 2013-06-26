import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Arm"

TITLE = "Arm"
DESCRIPTION = "Create an arm rig"
#ICON = os.environ["GEPPETTO"] + "/Icons/singleChain_button.bmp"

class Create_Arm:
  
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.hand_info = {}

    def install(self, *args):
        # Collect layout info
        sel = cmds.ls(sl=True)
  
        lytObs = part_utils.collectLayoutInfo(sel)

        # Find the side we are on
        #side = part_utils.getSide(self.lyt_info['layoutRoot'])
        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_', lytObs)
        # Create an ik joint chain
        self.jnt_info['ikJnts'] = part_utils.createJoints('ikj_', lytObs)
        
        # Define names for components involved in ik setup
        userDefinedName = sel[0].partition('PartRoot_')[0]

        #ikHandleName = "ikHandle_%s_leg" % (side)
        ikHandleName = userDefinedName + 'ikh'
        #ctrlName = "ctrl_%s_leg" % (side)
        ctrlName = userDefinedName + 'ctrl'
        
        #pvName = "pv_%s_leg" % (side)
        pvName = userDefinedName + 'pv_ctrl'
        #suffix = "%s_leg" % (side)
        suffix = userDefinedName 

        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'foot_roll', 'roll_break', 'foot_twist', 'foot_bank', 'pivot_posX', 'pivot_posZ', 'toe_flap', 'twist_offset')
        
        # NOTE: Dynamically generate the control objects
        armControl = part_utils.setupControlObject("ArmControl.ma", ctrlName, ctrlAttrs, lytObs[2][1], os.environ['Parts_Maya_Controls'])
        # NOTE: Try deleting the stupid lyt so the disDim node builds with locators
        f = cmds.container('Test_container', q=True, nl=True)
        for i in f:
            try:
                cmds.delete(i)
            except: pass


        # Create the stretchy ik chain
        ikInfo = part_utils.createStretchyIk(self.jnt_info['ikJnts'], armControl, ikHandleName, pvName, suffix)
        
        # Setup the ik foot
        ikJntPos = []
        for jnt in self.jnt_info['ikJnts']:
            pos = cmds.xform(jnt, q=True, t=True, ws=True)
            ikJntPos.append(pos)
        #self.foot_info['footInfo'] = self.setupRGFoot(suffix, footControl[1], ikJntPos, ikHandleName)
        


    def setupFoot(self, suffix, footControl, ikJntPos, ikHandleName, *args):
        print 'In Setup Arm'