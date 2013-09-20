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
        # Find the part root in case we have dont have it selected.
        # NOTE:  Keep an eye on this.
        nodes = cmds.listRelatives(sel, ad=True, ap=True, type='transform')
        relativeNodes = []

        if sel[0].startswith('PartRoot_'):
            relativeNodes.append(sel[0])

        for each in nodes:
            if each.startswith('PartRoot_'):
                relativeNodes.append(each)
            if each.startswith('PartRoot_Grp'):
                relativeNodes.remove(each)
                
        sel = relativeNodes
  
        lytObs = part_utils.collectLayoutInfo(sel)

        twist = True
        
        # Create an ik joint chain
        self.jnt_info['ikJnts'] = part_utils.createJoints('ikj_', lytObs)
        # Create an fk joint chain
        self.jnt_info['fkJnts'] = part_utils.createJoints('fkj_', lytObs)
        # NOTE: I need the end joint to get orientation for wrist controls but
        # Then I can get rid of it.
        lytObs.pop()
        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_', lytObs)
        # Handle twist joint creation

      
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
        # NOTE Setting orientation here.  Do this in setupControlObject?
        ctrlRot = cmds.xform(self.jnt_info['ikJnts'][2], q=True, ws=True, ro=True)
        cmds.xform(armControl[0], ws=True, ro=ctrlRot)

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
        ctrlAttrs = (['stretch'])
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

        # Setup FK stretch
        part_utils.createStretchyFk(fkControls, '.tx')

        # Setup the arm settings control 
        ctrlPos = cmds.xform(self.jnt_info['rigJnts'][2], q=True, ws=True, t=True)
        ctrlAttrs = (['ik_fk'])
        ctrlName = userDefinedName + '_settings_ctrl'
        settingsControl = part_utils.setupControlObject("SettingsControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
        # NOTE:  I need a temp fix to make IK_FK attr an Enum.

        # Hookup ik fk switch
        for i in range(len(self.jnt_info['bcNodes'])):
            for node in self.jnt_info['bcNodes'][i]:
                cmds.connectAttr(settingsControl[1] +'.ik_fk', node + '.blender' )
        # NOTE: Deleting unused joints MESSY
        cmds.delete(self.jnt_info['ikJnts'][3])
        cmds.delete(self.jnt_info['fkJnts'][3])
        cmds.delete(fkControls[3][0])

        # Add all control objects to self.foot_info = {'controls'}
        fkControls.append(armControl)
        fkControls.append(settingsControl)
        self.hand_info['controls'] = fkControls
       
        # Add the arm rig to a container.
        # NOTE: This should be a function
        rigContainerName = ('Rig_Container_' + userDefinedName)
        rigContainer = cmds.container(n=rigContainerName)
        cmds.addAttr(rigContainer, shortName='Link', longName='Link', dt='string')

        # Group the arm under a master transform
        partLinkGrpName = ('Part_Link_' + userDefinedName)
        plGrp = cmds.group(n=partLinkGrpName, em=True)
        plGrpPos = cmds.xform(self.jnt_info['rigJnts'][0], q=True, ws=True, t=True)
        cmds.xform(plGrp, ws=True, t=plGrpPos)
        cmds.makeIdentity( plGrp, apply=True )
        cmds.parent(self.jnt_info['rigJnts'][0], plGrp)
        cmds.parent(self.jnt_info['ikJnts'][0], plGrp)
        cmds.parent(self.jnt_info['fkJnts'][0], plGrp)
        cmds.parent(settingsControl[0], plGrp)
        cmds.parent(armControl[0], plGrp)
        cmds.parent(fkControls[0][0], plGrp)
        for i in range(len(ikInfo)):
            if i != 0:
                cmds.parent(ikInfo[i], plGrp)

        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)

        """
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
        """



