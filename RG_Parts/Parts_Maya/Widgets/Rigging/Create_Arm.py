import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Arm"

TITLE = "Arm"
DESCRIPTION = "Create an arm rig"

class Create_Arm:
  
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.hand_info = {}

    def install(self, part_data, namespace, instance, partData, *args):
        print part_data
        # Collect the first joint from each pjoint key
        jntInfo = []
        for j in range(len(part_data['pjntnames'])):
            pos = cmds.xform(namespace+part_data['pjntnames'][j][0], q=True, ws=True, t=True)
            rot = cmds.xform(namespace+part_data['pjntnames'][j][0], q=True, ws=True, ro=True)
            jntInfo.append([part_data['names'][j], pos, rot])

        twist = True
        
        # Create an ik joint chain

        self.jnt_info['ikJnts'] = part_utils.createJoints('ikj_' + instance, jntInfo )
        # Create an fk joint chain
        self.jnt_info['fkJnts'] = part_utils.createJoints('fkj_' + instance, jntInfo)
        # Create rig joints
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_' + instance, jntInfo)
        # Create the bind skeleton
        #self.jnt_info['bindJnts'] = part_utils.createJoints('Bone_' + instance, jntInfo)
        # Handle twist joint creation

        # Connect the ik and fk joints to the rig joints
        constraints = part_utils.connectThroughBC(self.jnt_info['fkJnts'], self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], instance)
        self.jnt_info['bcNodes'] = constraints

        ikHandleName = 'ikh_'+ instance + 'arm'
   
        ctrlName = partData['ikcontrol'][0].replace('s_', instance)
        
        pvName = partData['ikcontrol'][1].replace('s_', instance)

        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'stretch_bend', 'twist_offset')
        
        # NOTE: Dynamically generate the control objects
        armControl = part_utils.setupControlObject("ArmControl.ma", ctrlName, ctrlAttrs, jntInfo[2][1], jntInfo[2][2], os.environ['Parts_Maya_Controls'])
        # NOTE Setting orientation here.  Do this in setupControlObject?
        
        # Create the stretchy ik chain
        ikInfo = part_utils.createStretchyIk(self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], armControl, ikHandleName, pvName, instance)
        self.hand_info['ikNodes'] = ikInfo
        
        # Parent the ik to the control
        cmds.parent(ikInfo[0], armControl[1])
        
        # Setup the FK controls
        ctrlAttrs = (['stretch'])
        fkControls = []
        for i in range(len(self.jnt_info['fkJnts'])):
            ctrlName = self.jnt_info['fkJnts'][i].replace('fkj_', 'ctrl_')

            fkControl = part_utils.setupControlObject("SphereControl.ma", ctrlName, ctrlAttrs, jntInfo[i][1], jntInfo[i][2], os.environ['Parts_Maya_Controls'])
            fkControls.append(fkControl)

            cmds.parentConstraint(fkControl[1], self.jnt_info['fkJnts'][i], mo=True)
        
        for i in range(len(fkControls)):
            if i !=0:
                cmds.parent(fkControls[i][0], fkControls[i-1][1])
        
        # Setup FK stretch
        part_utils.createStretchyFk(fkControls, '.tx')

        # Setup the arm settings control 
        ctrlAttrs = (['ik_fk'])
        ctrlName = partData['setcontrol'][0].replace('s_', instance)
        settingsControl = part_utils.setupControlObject("SettingsControl.ma", ctrlName, ctrlAttrs, jntInfo[2][1], jntInfo[2][2], os.environ['Parts_Maya_Controls'])
        # NOTE:  I need a temp fix to make IK_FK attr an Enum.

        # Hookup ik fk switch
        for i in range(len(self.jnt_info['bcNodes'])):
            for node in self.jnt_info['bcNodes'][i]:
                cmds.connectAttr(settingsControl[1] +'.ik_fk', node + '.blender' )

        
        # Add all control objects to self.foot_info = {'controls'}
        fkControls.append(armControl)
        fkControls.append(settingsControl)
        self.hand_info['controls'] = fkControls
       
        # Add the rig to a container.
        rigContainer = part_utils.createRigContainer(instance, partData['rootname']) 

        # Group the arm under a master transform
        partLinkGrpName = ('Part_Link_' + instance + partData['rootname'])
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