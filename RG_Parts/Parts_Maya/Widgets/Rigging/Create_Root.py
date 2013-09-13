import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Root"
TITLE = "Create Root"
DESCRIPTION = "Create a Character Root, Motion, and Anim"


class Create_Root:
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

        # NOTE:  This works but it isn't slick
        newAnName = self.jnt_info['rigJnts'][0].replace('_Root', '_ANIM')
        cmds.rename(self.jnt_info['rigJnts'][0], newAnName)
        newMoName = self.jnt_info['rigJnts'][1].replace('_Root', '_Motion')
        cmds.rename(self.jnt_info['rigJnts'][1], newMoName)
        newCrName = self.jnt_info['rigJnts'][2].replace('_Root', '_CHARACTER_ROOT')
        cmds.rename(self.jnt_info['rigJnts'][2], newCrName)

        ctrlAttrs = ('None')
        
        # NOTE: Dynamically generate the control objects
        animControl = part_utils.setupControlObject("AnimControl.ma", 'ANIM_', ctrlAttrs, lytObs[0][1], os.environ['Parts_Maya_Controls'])
        motionControl = part_utils.setupControlObject("MotionControl.ma", 'Motion', ctrlAttrs, lytObs[0][1], os.environ['Parts_Maya_Controls'])
        rootControl = part_utils.setupControlObject("RootControl.ma", 'CHARACTER_ROOT', ctrlAttrs, lytObs[2][1], os.environ['Parts_Maya_Controls'])
        for each in (animControl, motionControl, rootControl):
            self.tmpRigElements.append(each)

        self.rig_info['rig_info'] = self.tmpRigElements


        # Add the leg rig to a container.
        rigContainerName = ('Rig_Container_' + userDefinedName)
        rigContainer = cmds.container(n=rigContainerName)
        cmds.addAttr(rigContainer, shortName='Link', longName='Link', dt='string')

        # Group the arm under a master transform
        partLinkGrpName = ('Part_Link_' + userDefinedName)
        plGrp = cmds.group(n=partLinkGrpName, em=True)
        plGrpPos = cmds.xform(newAnName, q=True, ws=True, t=True)
        cmds.xform(plGrp, ws=True, t=plGrpPos)
        cmds.makeIdentity( plGrp, apply=True )

        cmds.parent(newAnName, plGrp)
        cmds.parent(newMoName, plGrp)
        cmds.parent(newCrName, plGrp)
        cmds.parent(animControl[1], plGrp)
        cmds.parent(motionControl[0], plGrp) 
        cmds.parent(rootControl[0], plGrp) 

        for element in self.rig_info['rig_info']:
            try:
                cmds.container(rigContainer, edit=True, addNode=element, inc=True, ish=True, ihb=True, iha=True)
            except: pass
