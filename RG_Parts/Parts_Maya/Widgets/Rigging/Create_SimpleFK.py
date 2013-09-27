import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_SimpleFK"
TITLE = "chain"
DESCRIPTION = "Create FK on a variable length chain"


class Create_SimpleFK:
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.tmpRigElements = []
        self.rig_info = {}


    def install(self, part_data, namespace, instance, partData, *args):
        print part_data
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

        ctrlAttrs = (['stretch'])

        fkControls = []
        for i in range(len(self.jnt_info['rigJnts'])):
            ctrlName = self.jnt_info['rigJnts'][i].replace('rigj_', 'ctrl_')

            fkControl = part_utils.setupControlObject("SphereControl.ma", ctrlName, ctrlAttrs, jntInfo[i][1], jntInfo[i][2], os.environ['Parts_Maya_Controls'])
            fkControls.append(fkControl)

            cmds.parentConstraint(fkControl[1], self.jnt_info['rigJnts'][i], mo=True)
        
        for i in range(len(fkControls)):
            if i !=0:
                cmds.parent(fkControls[i][0], fkControls[i-1][1])
        
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
        cmds.parent(fkControls[0][0], plGrp)

        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)