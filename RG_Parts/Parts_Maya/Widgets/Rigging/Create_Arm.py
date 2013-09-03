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
        #del lytObs[-1]

        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_', lytObs)
        # Create an ik joint chain
        self.jnt_info['ikJnts'] = part_utils.createJoints('ikj_', lytObs)
        # Create an fk joint chain
        self.jnt_info['fkJnts'] = part_utils.createJoints('fkj_', lytObs)
      
        # Define names for components involved in ik setup
        tmpVar = sel[0].partition('PartRoot_')[2]
        userDefinedName = tmpVar.partition('_')[2]

        #ikHandleName = "ikHandle_%s_leg" % (side)
        ikHandleName = userDefinedName + '_ikh'
        
        #ctrlName = "ctrl_%s_leg" % (side)
        ctrlName = userDefinedName + '_ctrl'
        
        #pvName = "pv_%s_leg" % (side)
        pvName = userDefinedName + '_pv_ctrl'
        #suffix = "%s_leg" % (side)
        suffix = userDefinedName 

        # Connect the ik and fk joints to the rig joints
        constraints = part_utils.connectThroughBC(self.jnt_info['fkJnts'], self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], suffix)
        self.jnt_info['bcNodes'] = constraints

        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'stretch_bend', 'twist_offset')
        
        # NOTE: Dynamically generate the control objects
        armControl = part_utils.setupControlObject("ArmControl.ma", ctrlName, ctrlAttrs, lytObs[2][1], os.environ['Parts_Maya_Controls'])


        # Create the stretchy ik chain
        ikInfo = part_utils.createStretchyIk(self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], armControl, ikHandleName, pvName, suffix)
        self.hand_info['ikNodes'] = ikInfo

        # Parent the ik to the control
        cmds.parent(ikInfo[0], armControl[1])
        ikJntPos = []
        for jnt in self.jnt_info['ikJnts']:
            pos = cmds.xform(jnt, q=True, t=True, ws=True)
            ikJntPos.append(pos)


        # Setup the FK controls
        ctrlAttrs = ('stretch', 'size')
        fkControls = []
        for i in range(len(self.jnt_info['fkJnts'])):
            ctrlName = self.jnt_info['fkJnts'][i].replace('fkj_', 'ctrl_')
            ctrlPos = cmds.xform(self.jnt_info['fkJnts'][i], q=True, ws=True, t=True)
            ctrlRot = cmds.xform(self.jnt_info['fkJnts'][i], q=True, ws=True, ro=True)

            fkControl = part_utils.setupControlObject("SphereControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
            fkControls.append(fkControl)

            cmds.xform(fkControl[0], ws=True, t=ctrlPos)
            cmds.xform(fkControl[0], ws=True, ro=ctrlRot)
            cmds.parentConstraint(fkControl[1], self.jnt_info['fkJnts'][i], mo=True)

        for i in range(len(fkControls)):
            if i !=0:
                cmds.parent(fkControls[i][0], fkControls[i-1][1])
                cmds.setAttr(fkControls[i][1]+'.size', 1)
                cmds.connectAttr(fkControls[i][1]+'.size', fkControls[i][0]+'.scaleX')
                cmds.connectAttr(fkControls[i][1]+'.size', fkControls[i][0]+'.scaleY')
                cmds.connectAttr(fkControls[i][1]+'.size', fkControls[i][0]+'.scaleZ')
        """
        # Setup FK stretch
        stretchAxis = '.tx'
        for i in range(len(fkControls)):
            if i != len(fkControls)-1:
                print fkControls[i][1]
                pmaFKStretchName = fkControls[i][1].replace('ctrl', 'pmaNode')
                pmaFKStretch = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaFKStretchName)   
                cmds.connectAttr(fkControls[i][1] + '.stretch', pmaFKStretch + '.input1D[0]')
                cmds.connectAttr(pmaFKStretch + '.output1D', fkControls[i+1][0] + stretchAxis)
        """

        # Setup the arm settings control 
        ctrlPos = cmds.xform(self.jnt_info['rigJnts'][3], q=True, ws=True, t=True)
        ctrlAttrs = (['ik_fk'])
        ctrlName = userDefinedName + '_settings_ctrl'
        settingsControl = part_utils.setupControlObject("SettingsControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
        # NOTE:  I need a temp fix to make IK_FK attr an Enum.

        # Hookup ik fk switch
        for i in range(len(self.jnt_info['bcNodes'])):
            for node in self.jnt_info['bcNodes'][i]:
                cmds.connectAttr(settingsControl[1] +'.ik_fk', node + '.blender' )

        # Add all control objects to self.foot_info = {'controls'}
        fkControls.append(armControl)
        fkControls.append(settingsControl)
        self.hand_info['controls'] = fkControls
       
        # Add the arm rig to a container.
        rigContainerName = ('Rig_Container_' + userDefinedName)
        rigContainer = cmds.container(n=rigContainerName)
        cmds.addAttr(rigContainer, shortName='Link', longName='Link', dt='string')

        for each in self.jnt_info['rigJnts']:
            try:
                cmds.container(rigContainer, edit=True, addNode=each, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        for each in self.hand_info['ikNodes']:
            try:
                cmds.container(rigContainer, edit=True, addNode=each, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        for each in self.hand_info['controls']:
            try:
                cmds.container(rigContainer, edit=True, addNode=each, inc=True, ish=True, ihb=True, iha=True)
            except: pass