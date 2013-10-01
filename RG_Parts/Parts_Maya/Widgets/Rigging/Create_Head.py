import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Head"
TITLE = "Head"
DESCRIPTION = "Create a neck and head"


class Create_Head:
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.tmpRigElements = []
        self.rig_info = {}


    def install(self, part_data, namespace, instance, partData, *args):
        # Collect the first joint from each pjoint key
        jntInfo = []
        for j in range(len(part_data['pjntnames'])):
            pos = cmds.xform(namespace+part_data['pjntnames'][j][0], q=True, ws=True, t=True)
            rot = cmds.xform(namespace+part_data['pjntnames'][j][0], q=True, ws=True, ro=True)
            jntInfo.append([part_data['names'][j], pos, rot])

        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_' + instance, jntInfo)
        for each in self.jnt_info['rigJnts']:
            self.tmpRigElements.append(each)

        ctrlAttrs = ('follow', 'stretch')

        fkControls = []
        # Create controls for the neck and head.
        ctrlName = partData['fkcontrols'][0].replace('s_', instance)
        ctrlPos = cmds.xform(self.jnt_info['rigJnts'][1], q=True, ws=True, t=True)
        headControl = part_utils.setupControlObject("HeadControl.ma", ctrlName, ctrlAttrs, jntInfo[1][1], jntInfo[1][2], os.environ['Parts_Maya_Controls'])
        self.tmpRigElements.append(headControl)
        fkControls.append(headControl)
        ctrlName = partData['fkcontrols'][1].replace('s_', instance)
        neckControl = part_utils.setupControlObject("FkSpineControl.ma", ctrlName, ctrlAttrs, jntInfo[0][1], jntInfo[0][2], os.environ['Parts_Maya_Controls'])
        self.tmpRigElements.append(neckControl)
        fkControls.append(neckControl)

        pconA = cmds.parentConstraint(neckControl[1], self.jnt_info['rigJnts'][0], mo=True)
        pconB = cmds.parentConstraint(headControl[1], self.jnt_info['rigJnts'][1], mo=True)

        pconC = cmds.parentConstraint(neckControl[1], headControl[0], mo=True)

        # Setup the neck follow
        cmds.connectAttr(headControl[1] + '.follow', pconC[0] + '.' + neckControl[1]+'W0')
        #grp_Head__c0_head_ctrl_parentConstraint1.Head__c0_neck_ctrlW0" 0;

        # Setup FK stretch
        part_utils.createStretchyFk(fkControls, '.tx')


        # Add the rig to a container.
        rigContainer = part_utils.createRigContainer(instance, partData['rootname']) 

         # Group the arm under a master transform
        partLinkGrpName = ('Part_Link_' + instance + partData['rootname'])
        plGrp = cmds.group(n=partLinkGrpName, em=True)
        plGrpPos = cmds.xform(self.jnt_info['rigJnts'][0], q=True, ws=True, t=True)
        cmds.xform(plGrp, ws=True, t=plGrpPos)
        cmds.makeIdentity( plGrp, apply=True )

        cmds.parent(self.jnt_info['rigJnts'][0], plGrp)
        cmds.parent(headControl[0], plGrp)
        cmds.parent(neckControl[0], plGrp)   


        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)


        # Head lookat