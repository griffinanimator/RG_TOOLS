import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Head"
TITLE = "Create Head"
DESCRIPTION = "Create a neck and head"


class Create_Head:
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.tmpRigElements = []
        self.rig_info = {}


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

        tmpVar = sel[0].partition('PartRoot_')[2]
        userDefinedName = tmpVar.partition('_')[2]
  
        lytObs = part_utils.collectLayoutInfo(sel)

        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_', lytObs)
        for each in self.jnt_info['rigJnts']:
            self.tmpRigElements.append(each)
        # Create an ik joint chain
        self.jnt_info['fkJnts'] = part_utils.createJoints('fkj_', lytObs)
        for each in self.jnt_info['fkJnts']:
            self.tmpRigElements.append(each)

        ctrlAttrs = (['follow'])

        # Create controls for the neck and head.
        ctrlName = userDefinedName + '_head_ctrl'
        ctrlPos = cmds.xform(self.jnt_info['fkJnts'][1], q=True, ws=True, t=True)
        headControl = part_utils.setupControlObject("HeadControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
        self.tmpRigElements.append(headControl)

        ctrlName = userDefinedName + '_neck_ctrl'
        ctrlPos = cmds.xform(self.jnt_info['fkJnts'][0], q=True, ws=True, t=True)
        neckControl = part_utils.setupControlObject("FkSpineControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
        self.tmpRigElements.append(neckControl)

        pconA = cmds.parentConstraint(neckControl[1], self.jnt_info['rigJnts'][0], mo=True)
        pconB = cmds.parentConstraint(headControl[1], self.jnt_info['rigJnts'][1], mo=True)

        pconC = cmds.parentConstraint(neckControl[1], headControl[0], mo=True)

        # Setup the neck follow
        cmds.connectAttr(headControl[1] + '.follow', pconC[0] + '.' + neckControl[1]+'W0')
        #grp_Head__c0_head_ctrl_parentConstraint1.Head__c0_neck_ctrlW0" 0;


        # Add the head rig to a container.
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
        cmds.parent(self.jnt_info['fkJnts'][0], plGrp)
        cmds.parent(headControl[0], plGrp)
        cmds.parent(neckControl[0], plGrp)   


        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)


        """
        self.rig_info['rig_info'] = self.tmpRigElements
        for element in self.rig_info['rig_info']:
            try:
                cmds.container(rigContainer, edit=True, addNode=element, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        """

        # Head lookat