import maya.cmds as cmds

import System.widgetUtils as widget_utils
reload(widget_utils)

CLASS_NAME = "Create_Leg"

TITLE = "Leg"
DESCRIPTION = "Create a leg rig"


class Create_Leg:
  
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.foot_info = {}
        # Path to the control objects
        self.ctrlPath = "C:/Users/Griffy/Google Drive/RG_ARTTOOLS/RG_Parts/Parts_Maya/Controls/"

    def install(self, *args):
        # Collect layout info
    	lytObs = widget_utils.collectLayoutInfo()
        self.lyt_info['layoutObjs'] = lytObs[0]
        self.lyt_info['layoutRoot'] = lytObs[1]

        # Find the side we are on
        side = widget_utils.getSide(self.lyt_info['layoutRoot'])

        # Create an ik joint chain
    	self.jnt_info['ikJnts'] = widget_utils.createJoints('ikj_'+side+"_", self.lyt_info['layoutObjs'])

        # Define names for components involved in ik setup
        ikHandleName = "ikHandle_%s_leg" % (side)
        ctrlName = "ctrl_%s_leg" % (side)

        pvName = "pv_%s_leg" % (side)
        suffix = "%s_leg" % (side)

        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'foot_roll', 'roll_break', 'foot_twist', 'foot_bank', 'pivot_posX', 'pivot_posZ', 'toe_flap', 'twist_offset')
        footControl = widget_utils.setupControlObject("FootControl.ma", ctrlName, ctrlAttrs, self.lyt_info['layoutObjs'][2][1], self.ctrlPath)

        # Create the stretchy ik chain
        ikInfo = self.createStretchyIk(footControl, ikHandleName, pvName, suffix)

        # Setup the ik foot
        ikJntPos = []
        for jnt in self.jnt_info['ikJnts']:
            pos = cmds.xform(jnt, q=True, t=True, ws=True)
            ikJntPos.append(pos)
        self.foot_info['footInfo'] = self.setupFoot(suffix, footControl[1], ikJntPos, ikHandleName)



    def setupFoot(self, suffix, footControl, ikJntPos, ikHandleName, *args):
        print 'In Setup Foot'
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
        ikBall = cmds.ikHandle(n= "ikh_ball_" + suffix, sj= self.jnt_info['ikJnts'][2], ee= self.jnt_info['ikJnts'][4], sol = "ikSCsolver")
        ikToe = cmds.ikHandle(n= "ikh_toe_" + suffix, sj=  self.jnt_info['ikJnts'][4], ee= self.jnt_info['ikJnts'][5], sol = "ikSCsolver")
        # Create the foot groups
        footGrps = ('grp_footPivot', 'grp_heel', 'grp_toe', 'grp_ball', 'grp_flap')

        for grp in footGrps:
            grpName = (grp + '_' + suffix)
            grp = cmds.group(n=grpName, empty=True)
            cmds.xform(grp, t=ikJntPos[4])
            if grp == footGrps[1] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[3])
            if grp == footGrps[2] + '_' + suffix:
                cmds.xform(grp, t=ikJntPos[5])
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
        cmds.connectAttr(pmaTRoll + '.output1D', 'grp_toe_' + suffix + '.rx')

        # Setup the Heel -----------------------------------------------------
        cmds.connectAttr(footRoll, conHRoll + '.firstTerm')
        cmds.connectAttr(footRoll, conHRoll + '.colorIfTrueR')
        cmds.connectAttr(conHRoll + '.outColorR', 'grp_heel_' + suffix + '.rx')

        # Setup Ball ----------------------------------------------------------
        cmds.connectAttr(footRoll, conBRoll+'.firstTerm')
        cmds.connectAttr(footRoll, conBRoll+'.colorIfTrueR')
        cmds.connectAttr(rollBreak, conNBRoll+'.secondTerm')
        cmds.connectAttr(rollBreak, conNBRoll+'.colorIfTrueR')
        cmds.connectAttr(conNBRoll+'.outColorR', pmaBRoll+'.input1D[0]')
        cmds.connectAttr('grp_toe_' + suffix + '.rx', pmaBRoll+'.input1D[1]')
        cmds.connectAttr(pmaBRoll+'.output1D', 'grp_ball_' + suffix + '.rx')
        cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.firstTerm')
        cmds.connectAttr(conBRoll+'.outColorR', conNBRoll+'.colorIfFalseR')

        # Toe Flap
        cmds.connectAttr(footControl +'.toe_flap', footGrps[4]+ '_' + suffix + '.rx')

        # Animated Pivot
        pivLoc = cmds.spaceLocator(n='lctrTwist_'+suffix)
        cmds.parent(pivLoc[0], footControl)
        cmds.xform(pivLoc[0], t=ikJntPos[4])
        fgTran = cmds.getAttr(footGrps[4]+ '_' + suffix + '.translate')
        #pmaFTwist = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_FootTwist_' + suffix))
        #cmds.setAttr(pmaFTwist+'.input1')
        #cmds.connectAttr(pivLoc[0]+'.translate', footGrps[0]+ '_' + suffix + '.rotatePivot')
        cmds.connectAttr(footControl+'.pivot_posX', pivLoc[0]+'.tx')
        cmds.connectAttr(footControl+'.pivot_posZ', pivLoc[0]+'.tz')
        

        cmds.connectAttr(footControl+'.foot_twist', footGrps[0]+ '_' + suffix + '.ry')
        cmds.connectAttr(footControl+'.foot_bank', footGrps[0]+ '_' + suffix + '.rz')



    def createStretchyIk(self, footControl, ikHandleName, pvName, suffix, *args):  
        rootPos = cmds.xform(self.jnt_info['ikJnts'][0], q=True, t=True, ws=True)
        midPos = cmds.xform(self.jnt_info['ikJnts'][1], q=True, t=True, ws=True)
        endPos = cmds.xform(self.jnt_info['ikJnts'][2], q=True, t=True, ws=True)
        
        # Create the ik solver
        cmds.ikHandle(n= ikHandleName, sj= self.jnt_info['ikJnts'][0], ee= self.jnt_info['ikJnts'][2], sol = "ikRPsolver")
        
        # Stretch ----------------------------------------------------------
        #Start by creating all of the nodes we will need for the stretch.
        adlStretch = cmds.shadingNode("addDoubleLinear", asUtility=True, n='adlNode_RStretch_' + suffix)
        clmpStretch = cmds.shadingNode("clamp", asUtility=True, n='clampNode_Stretch_' + suffix)
        mdLStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_RStretch_' + suffix)
        mdKStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_MStretch_' + suffix)
        mdAStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_EStretch_' + suffix)
        cmds.select(d=True)
        disDim = cmds.distanceDimension(sp=(rootPos), ep=(endPos))

        cmds.rename('distanceDimension1', 'disDimNode_Stretch_' + suffix)
        cmds.rename('locator1', 'lctrDis_Root_' + suffix)
        cmds.rename('locator2', 'lctrDis_End_' + suffix)
        # TODO: Need to save these for later
        # cmds.parent('lctrDis_hip', 'jnt_pelvis')
        cmds.parent('lctrDis_End_' + suffix, footControl[1])

        # Determine the length of the joint chain in default position
        rootLen = cmds.getAttr(self.jnt_info['ikJnts'][1] + '.tx')
        endLen = cmds.getAttr(self.jnt_info['ikJnts'][2] + '.tx')
        chainLen = (rootLen + endLen)
  
        cmds.setAttr(adlStretch + '.input2', chainLen)
        cmds.setAttr(mdLStretch + '.input2X', chainLen)
        cmds.setAttr(mdKStretch + '.input2X', rootLen)
        cmds.setAttr(mdAStretch + '.input2X', endLen)

        # The clamp node lets us control the amount of stretch.
        cmds.connectAttr(footControl[1] + '.stretch', adlStretch + '.input1')
        cmds.connectAttr(adlStretch + '.output', clmpStretch + '.maxR')
        cmds.setAttr (clmpStretch + '.minR', chainLen)
        cmds.setAttr (mdLStretch + '.operation',  2)

        # Connect the distance dimension so we always know the current length of the leg.
        cmds.connectAttr('disDimNode_Stretch_' + suffix +'.distance', clmpStretch + '.inputR')

        #Now we feed the total value into a multiply divide so we can distribute the value to our joints.
        cmds.connectAttr(clmpStretch + '.outputR', mdLStretch + '.input1X')
        cmds.connectAttr(mdLStretch + '.outputX', mdKStretch + '.input1X')
        cmds.connectAttr(mdLStretch + '.outputX', mdAStretch + '.input1X')

        #Finally, we output our new values into the translateX of the knee and ankle joints.
        cmds.connectAttr(mdKStretch + '.outputX', self.jnt_info['ikJnts'][1]+ '.tx')
        cmds.connectAttr( mdAStretch + '.outputX', self.jnt_info['ikJnts'][2] + '.tx')

        # Create a pv ----------------------------------------------
        cmds.spaceLocator(n=pvName)
        cmds.xform(pvName, t=rootPos, ws=True)
        # Pv constrain the ik
        cmds.poleVectorConstraint (pvName, ikHandleName, weight=1)
        cmds.select(d=True)

        #Create a plusMinusAverage utility
        #Create a multiplyDivide utility
        pmaTwist = cmds.shadingNode("plusMinusAverage", asUtility=True, n='pmaNode_twist_' + suffix)
        # Set PMA to subtract
        cmds.setAttr(pmaTwist + ".operation", 2)
        mDivTwst =  cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_twist_' + suffix)

        cmds.connectAttr(footControl[1]+'.twist', mDivTwst+'.input1X')
        cmds.connectAttr(footControl[1]+'.ry', mDivTwst+'.input1Y')
        # TODO: I need a pelvis or a better solution
        #cmds.connectAttr('jnt_pelvis.ry', 'mdNode_LegTwist.input1Z')
        cmds.setAttr(mDivTwst+'.input2X', -1)
        cmds.setAttr(mDivTwst+'.input2Y', -1)
        cmds.setAttr(mDivTwst+'.input2Z', -1)
        cmds.connectAttr(mDivTwst+'.input1X', pmaTwist+'.input1D[0]')
        cmds.connectAttr(mDivTwst+'.input1Y', pmaTwist+'.input1D[1]')

        # Calculate twist offset
        blueprintJoints = []
        for obj in self.lyt_info['layoutObjs']:
            blueprintJoints.append(obj[0])
        offset = widget_utils.matchTwistAngle(ikHandleName+".twist", self.jnt_info['ikJnts'], blueprintJoints)
        # Make a buffer between the control and the ik twist
        cmds.setAttr(footControl[1]+'.twist_offset', offset)
        cmds.connectAttr(footControl[1]+'.twist_offset', pmaTwist+'.input1D[2]')
        cmds.connectAttr(pmaTwist+'.output1D', ikHandleName+'.twist')
