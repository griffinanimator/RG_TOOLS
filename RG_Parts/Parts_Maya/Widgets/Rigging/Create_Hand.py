import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Hand"
TITLE = "Create Hand"
DESCRIPTION = "Create an optional hand rig"


class Create_Hand:
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

         # Setup the FK controls
        ctrlAttrs = []
        fkControls = []
        for i in range(len(self.jnt_info['rigJnts'])):
            ctrlName = self.jnt_info['rigJnts'][i].replace('rigj_', 'ctrl_')
            ctrlPos = cmds.xform(self.jnt_info['rigJnts'][i], q=True, ws=True, t=True)
            ctrlRot = cmds.xform(self.jnt_info['rigJnts'][i], q=True, ws=True, ro=True)

            fkControl = part_utils.setupControlObject("SphereControl.ma", ctrlName, ctrlAttrs, ctrlPos, os.environ['Parts_Maya_Controls'])
            fkControls.append(fkControl)

            cmds.xform(fkControl[0], ws=True, t=ctrlPos)
            cmds.xform(fkControl[0], ws=True, ro=ctrlRot)
            cmds.parentConstraint(fkControl[1], self.jnt_info['rigJnts'][i], mo=True)

        for i in range(len(fkControls)):
            if i !=0:
                cmds.parent(fkControls[i][0], fkControls[i-1][1])

        # Add the rig to a container.
        rigContainer = part_utils.createRigContainer(instance, partData['rootname']) 

        # Group the arm under a master transform
        partLinkGrpName = ('Part_Link_' + userDefinedName)
        plGrp = cmds.group(n=partLinkGrpName, em=True)
        plGrpPos = cmds.xform(self.jnt_info['rigJnts'][0], q=True, ws=True, t=True)
        cmds.xform(plGrp, ws=True, t=plGrpPos)
        cmds.makeIdentity( plGrp, apply=True )

        cmds.parent(self.jnt_info['rigJnts'][0], plGrp)
        cmds.parent(fkControls[0][0], plGrp)

        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)