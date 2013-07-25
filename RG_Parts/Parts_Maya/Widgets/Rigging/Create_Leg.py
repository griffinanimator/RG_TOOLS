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

    def install(self, *args):
        # Collect layout info
        print "Install"
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
        userDefinedName = sel[0].partition('PartRoot_')[0]

        #ikHandleName = "ikHandle_%s_leg" % (side)
        ikHandleName = userDefinedName + 'ikh'
        
        #ctrlName = "ctrl_%s_leg" % (side)
        ctrlName = userDefinedName + 'ctrl'
        
        #pvName = "pv_%s_leg" % (side)
        pvName = userDefinedName + 'pv_ctrl'
        #suffix = "%s_leg" % (side)
        suffix = userDefinedName 

        # Connect the ik and fk joints to the rig joints
        constraints = part_utils.connectThroughBC(self.jnt_info['fkJnts'], self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], suffix)
        self.jnt_info['bcNodes'] = constraints
        #constraints = part_utils.connectJointChains(self.jnt_info['ikJnts'], self.jnt_info['rigJnts'])
        #self.jnt_info['ikConstraints'] = constraints

        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'stretch_bend', 'foot_roll', 'roll_break', 'foot_twist', 'foot_bank', 'pivot_posX', 'pivot_posZ', 'toe_flap', 'twist_offset', 'ik_fk')
        
        # NOTE: Dynamically generate the control objects
        footControl = part_utils.setupControlObject("FootControl.ma", ctrlName, ctrlAttrs, lytObs[2][1], os.environ['Parts_Maya_Controls'])
        # Do som additional adjustment to the foot control
        posY = cmds.xform(lytObs[5][0], q=True, ws=True, t=True)
        posXZ = cmds.xform(lytObs[2][0], q=True, ws=True, t=True)
        cmds.xform(footControl[0], t=[posXZ[0], posY[1], posXZ[2]], ws=True)
        cmds.xform(footControl[0], piv=posXZ, ws=True)
        cmds.xform(footControl[1], piv=posXZ, ws=True)

        # Create the stretchy ik chain
        ikInfo = part_utils.createStretchyIk(self.jnt_info['ikJnts'], self.jnt_info['rigJnts'], footControl, ikHandleName, pvName, suffix)
        
        
        # Setup the ik foot
        ikJntPos = []
        for jnt in self.jnt_info['ikJnts']:
            pos = cmds.xform(jnt, q=True, t=True, ws=True)
            ikJntPos.append(pos)
        self.foot_info['footInfo'] = self.setupRGFoot(suffix, footControl[1], ikJntPos, ikHandleName, ['.ry', '.rx', '.rz'])


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


    
    def setupRGFoot(self, suffix, footControl, ikJntPos, ikHandleName, orient, *args):
        print 'In Setup Foot'
        # NOTE: I want to pass in an orient argument that will determine rotation connections for foot groups.
        
        # NOTE:  Add all created nodes to a list.
        newFootGrps = []
        # Create utility nodes
        conBRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_ballRoll_' + suffix)
        conNBRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_negBallRoll_' + suffix)
        conTRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_toeRoll_'+ suffix)
        pmaBRoll = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_ballRoll_' + suffix)
        pmaTRoll = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_toeRoll_' + suffix)
        conHRoll = cmds.shadingNode("condition", asUtility=True, n='conNode_heelRoll_' + suffix)
        
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
        ikToe = cmds.ikHandle(n= "ikh_toe_" + suffix, sj=  self.jnt_info['ikJnts'][3], ee= self.jnt_info['ikJnts'][4], sol = "ikSCsolver")
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
            newFootGrps.append(footGrps[i])
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
        cmds.xform(pivLoc[0], t=ikJntPos[4])
        fgTran = cmds.getAttr(footGrps[4]+ '_' + suffix + '.translate')
        cmds.connectAttr(footControl+'.pivot_posX', pivLoc[0]+'.tx')
        cmds.connectAttr(footControl+'.pivot_posZ', pivLoc[0]+'.tz')
        

        cmds.connectAttr(footControl+'.foot_twist', footGrps[0]+ '_' + suffix + orient[1])
        cmds.connectAttr(footControl+'.foot_bank', footGrps[0]+ '_' + suffix + orient[2])

        # Hookup ik fk switch
        for i in range(len(self.jnt_info['bcNodes'])):
            for node in self.jnt_info['bcNodes'][i]:
                cmds.connectAttr(footControl +'.ik_fk', node + '.blender' )

        # Hookup control vis for the switch
        # NOTE:  This import is temp
        





