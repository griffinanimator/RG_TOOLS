import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_Leg"

TITLE = "Leg"
DESCRIPTION = "Create a leg rig"


class Create_Leg:
  
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.foot_info = {}

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
        # Handle twist joint creation

        # Connect the ik and fk joints to the rig joints
        constraints = part_utils.connectThroughBC(self.jnt_info['fkJnts'], self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], instance)
        self.jnt_info['bcNodes'] = constraints

        ikHandleName = 'ikh_'+ instance + 'leg'
   
        ctrlName = partData['ikcontrol'][0].replace('s_', instance)
        
        pvName = partData['ikcontrol'][1].replace('s_', instance)
        
        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'stretch_bend', 'foot_roll', 'roll_break', 'foot_twist', 'foot_bank', 'pivot_posX', 'pivot_posZ', 'toe_flap', 'twist_offset')
        
        # NOTE: Dynamically generate the control objects
        footControl = part_utils.setupControlObject("FootControl.ma", ctrlName, ctrlAttrs, jntInfo[2][1], jntInfo[2][2], os.environ['Parts_Maya_Controls'])
        
        # Do som additional adjustment to the foot control
        #posY = cmds.xform(lytObs[5][0], q=True, ws=True, t=True)
        #posXZ = cmds.xform(lytObs[2][0], q=True, ws=True, t=True)
        #cmds.xform(footControl[0], t=[posXZ[0], posY[1], posXZ[2]], ws=True)
        #cmds.xform(footControl[0], piv=posXZ, ws=True)
        #cmds.xform(footControl[1], piv=posXZ, ws=True)

        # Create the stretchy ik chain
        ikInfo = part_utils.createStretchyIk(self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], footControl, ikHandleName, pvName, instance)
        self.foot_info['ikNodes'] = ikInfo

        
        # Setup the ik foot
        ikJntPos = []
        for jnt in part_data['pjntnames']:
            pos = cmds.xform(namespace+jnt[0], q=True, t=True, ws=True)
            ikJntPos.append(pos)

        pos = cmds.xform(namespace+part_data['pjntnames'][4][1], q=True, t=True, ws=True)
        ikJntPos.append(pos)
        self.foot_info['footInfo'] = self.setupRGFoot(footControl[1], ikJntPos, ikHandleName, ['.rx', '.ry', '.rz'])
        
        
        # Setup the FK controls
        ctrlAttrs = (['stretch'])
        fkControls = []
        for i in range(len(self.jnt_info['fkJnts'])):
            ctrlName = self.jnt_info['fkJnts'][i].replace('fkj_', 'ctrl_')
            ctrlPos = cmds.xform(self.jnt_info['fkJnts'][i], q=True, ws=True, t=True)
            ctrlRot = cmds.xform(self.jnt_info['fkJnts'][i], q=True, ws=True, ro=True)

            fkControl = part_utils.setupControlObject("SphereControl.ma", ctrlName, ctrlAttrs, jntInfo[i][1], jntInfo[i][2], os.environ['Parts_Maya_Controls'])
            fkControls.append(fkControl)

            #cmds.xform(fkControl[0], ws=True, t=ctrlPos)
            #cmds.xform(fkControl[0], ws=True, ro=ctrlRot)
            cmds.parentConstraint(fkControl[1], self.jnt_info['fkJnts'][i], mo=True)

        for i in range(len(fkControls)):
            if i !=0:
                cmds.parent(fkControls[i][0], fkControls[i-1][1])
        
        
        # Setup FK stretch
        part_utils.createStretchyFk(fkControls, '.tx')
      
        # Setup the foot settings control  
        ctrlAttrs = (['ik_fk'])
        ctrlName = partData['setcontrol'].replace('s_', instance)
        settingsControl = part_utils.setupControlObject("SettingsControl.ma", ctrlName, ctrlAttrs, jntInfo[2][1], jntInfo[2][2], os.environ['Parts_Maya_Controls'])
        # NOTE:  I need a temp fix to make IK_FK attr an Enum.

        # Hookup ik fk switch
        for i in range(len(self.jnt_info['bcNodes'])):
            for node in self.jnt_info['bcNodes'][i]:
                cmds.connectAttr(settingsControl[1] +'.ik_fk', node + '.blender' )

        # Add all control objects to self.foot_info = {'controls'}
        fkControls.append(footControl)
        fkControls.append(settingsControl)
        self.foot_info['controls'] = fkControls
        

        # Add the leg rig to a container.
        rigContainerName = ('Rig_Container_' + instance + partData['rootname'])
        rigContainer = cmds.container(n=rigContainerName)
        cmds.addAttr(rigContainer, shortName='Link', longName='Link', dt='string')

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
        cmds.parent(footControl[0], plGrp)
        cmds.parent(fkControls[0][0], plGrp)
        for i in range(len(ikInfo)):      
            cmds.parent(ikInfo[i], plGrp)

        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)
        
        """
        for each in self.jnt_info['rigJnts']:
            try:
                cmds.container(rigContainer, edit=True, addNode=each, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        for each in self.foot_info['footInfo']:
            try:
                cmds.container(rigContainer, edit=True, addNode=each, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        for each in self.foot_info['controls']:
            try:
                cmds.container(rigContainer, edit=True, addNode=each, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        """
        
    def setupRGFoot(self, footControl, ikJntPos, ikHandleName, orient, *args):
        print 'In Setup Foot'
        suffix = ikHandleName.replace('ikh_', '')
        # NOTE: I want to pass in an orient argument that will determine rotation connections for foot groups.
        
        # NOTE:  Add all created nodes to a list.
        footNodes = []
        # Create utility nodes
        conBRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_ballRoll_' + suffix)
        conNBRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_negBallRoll_' + suffix)
        conTRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_toeRoll_'+ suffix)
        pmaBRoll = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_ballRoll_' + suffix)
        pmaTRoll = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_toeRoll_' + suffix)
        conHRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_heelRoll_' + suffix)
        footUtilNodes = (conBRoll, conNBRoll, conTRoll, pmaBRoll, pmaTRoll, conHRoll)
        for each in footUtilNodes:
            footNodes.append(each)
        
        cmds.setAttr(pmaTRoll + '.operation', 2)
        cmds.setAttr (conTRoll + '.operation', 2)
        cmds.setAttr (conTRoll + '.colorIfFalseR', 0)
        cmds.setAttr (conTRoll + '.colorIfFalseG', 0)
        cmds.setAttr (conTRoll + '.colorIfFalseB', 0)
        cmds.setAttr (conHRoll + '.operation', 4)
        cmds.setAttr(conHRoll + '.colorIfFalseB', 0)
        cmds.setAttr(conHRoll + '.colorIfFalseR', 0)
        cmds.setAttr(conHRoll + '.colorIfFalseG', 0)
        cmds.setAttr(pmaBRoll+ '.operation', 2)
        cmds.setAttr (conNBRoll + '.operation', 3)
        cmds.setAttr (conBRoll + '.operation', 3)

        # Make Ik Handles
        ikBall = cmds.ikHandle(n= "ikh_ball_" + suffix, sj= self.jnt_info['ikJnts'][2], ee= self.jnt_info['ikJnts'][3], sol = "ikSCsolver")
        footNodes.append(ikBall)
        ikToe = cmds.ikHandle(n= "ikh_toe_" + suffix, sj=  self.jnt_info['ikJnts'][3], ee= self.jnt_info['ikJnts'][4], sol = "ikSCsolver")
        footNodes.append(ikToe)
        # Create the foot groups
        footGrps = ('grp_footPivot', 'grp_heel', 'grp_toe', 'grp_ball', 'grp_flap')

        for grp in footGrps:
            grpName = (grp + '_' + suffix)
            grp = cmds.group(n=grpName, empty=True)
            cmds.xform(grp, t=ikJntPos[3])
            if grp == footGrps[1] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[5])
            if grp == footGrps[2] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[4])
            
        
        for i in range(len(footGrps)):
            footNodes.append(footGrps[i])
            cmds.select(d=True)
            if i == 0:
                cmds.parent(footGrps[i]+ '_' + suffix, footControl)    
            else:
                cmds.parent(footGrps[i]+ '_' + suffix,footGrps[i-1]+ '_' + suffix) 
            if i == 4:
                cmds.parent(footGrps[i]+ '_' + suffix, footGrps[2]+ '_' + suffix) 
        cmds.parent(ikBall[0], footGrps[3]+ '_' + suffix)
        cmds.parent(ikToe[0], footGrps[4]+ '_' + suffix)
        cmds.parent(ikHandleName, footGrps[3]+ '_' + suffix)
        cmds.select(d=True)

        
        # Setup toe ---------------------------------------------------
        footRoll = footControl + '.foot_roll'
        rollBreak = footControl + '.roll_break'
        cmds.connectAttr(footRoll, conTRoll + '.firstTerm')
        cmds.connectAttr(footRoll, conTRoll + '.colorIfTrueR')
        cmds.connectAttr(rollBreak, conTRoll + '.secondTerm')
        cmds.connectAttr(rollBreak, conTRoll + '.colorIfFalseR')
        cmds.connectAttr(rollBreak, pmaTRoll + '.input1D[1]')
        cmds.connectAttr(conTRoll + '.outColorR', pmaTRoll + '.input1D[0]')
        cmds.connectAttr(pmaTRoll + '.output1D', 'grp_toe_' + suffix + orient[0])

        # Setup the Heel -----------------------------------------------------
        cmds.connectAttr(footRoll, conHRoll + '.firstTerm')
        cmds.connectAttr(footRoll, conHRoll + '.colorIfTrueR')
        cmds.connectAttr(conHRoll + '.outColorR', 'grp_heel_' + suffix + orient[0])

        # Setup Ball ----------------------------------------------------------
        cmds.connectAttr(footRoll, conBRoll+'.firstTerm')
        cmds.connectAttr(footRoll, conBRoll+'.colorIfTrueR')
        cmds.connectAttr(rollBreak, conNBRoll+'.secondTerm')
        cmds.connectAttr(rollBreak, conNBRoll+'.colorIfTrueR')
        cmds.connectAttr(conNBRoll+'.outColorR', pmaBRoll+'.input1D[0]')
        cmds.connectAttr('grp_toe_' + suffix + '.rx', pmaBRoll+'.input1D[1]')
        cmds.connectAttr(pmaBRoll+'.output1D', 'grp_ball_' + suffix + orient[0])
        cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.firstTerm')
        cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.colorIfFalseR')

        # Toe Flap
        cmds.connectAttr(footControl +'.toe_flap', footGrps[4]+ '_' + suffix + orient[0])

        # Animated Pivot
        pivLoc = cmds.spaceLocator(n='lctrTwist_'+suffix)
        cmds.parent(pivLoc[0], footControl)
        cmds.xform(pivLoc[0], ws=True, t=ikJntPos[4])
        
        #fgTran = cmds.getAttr(footGrps[4]+ '_' + suffix + '.translate')
        #cmds.connectAttr(footControl+'.pivot_posX', pivLoc[0]+'.tx')
        #cmds.connectAttr(footControl+'.pivot_posZ', pivLoc[0]+'.tz')
        

        #cmds.connectAttr(footControl+'.foot_twist', footGrps[0]+ '_' + suffix + orient[1])
        #cmds.connectAttr(footControl+'.foot_bank', footGrps[0]+ '_' + suffix + orient[2])

        return footNodes

        # Hookup control vis for the switch
        # NOTE:  This import is temp
        