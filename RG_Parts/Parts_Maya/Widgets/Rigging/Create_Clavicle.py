import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Clavicle"
TITLE = "Create Clavicle"
DESCRIPTION = "Create a clavicle"


class Create_Clavicle:
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

        ctrlAttrs = (['None'])

        # Create controls for the clavicle.
        ctrlName = userDefinedName + '_clavicle_ctrl'
        ctrlPos = cmds.xform(self.jnt_info['rigJnts'][0], q=True, ws=True, t=True)
        clavicleControl = part_utils.setupControlObject("HeadControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
        self.tmpRigElements.append(clavicleControl)

        # Constrain the rig joint to the control
        pCon = cmds.parentConstraint(clavicleControl[0], self.jnt_info['rigJnts'][0], mo=True)

        # Add the rig to a container.
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
        cmds.parent(clavicleControl[0], plGrp)

        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)
