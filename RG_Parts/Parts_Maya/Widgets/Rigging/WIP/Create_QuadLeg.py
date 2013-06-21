""" RG_TestUtils
    Author: Ryan S Griffin
    Description: A bunch of utilities for building the rig for the Shell test.
    This will not build a complete rig, but the buttons should do something :)
    Use: Access the functions by running the ShelfButton.py
"""

""" Import Python"""
import maya.cmds as cmds
import maya.mel as mel

import os
import sys


# These should be changed to your local paths.
projectRoot = "C:/Users/Griffy/Projects/SchellTest/RG_Test/"
controlDir = "C:/Users/Griffy/Dropbox/Projects/SchellTest/RG_Test/Rig/Controls/" 
#controlDir = "C:/Users/rgriffin/Dropbox/Projects/SchellTest/RG_Test/Rig/Controls/"


""" Create a class """
class RG_Test_Funcs:
    
    def __init__(self):
        """ Create a dictionary to store UI elements """
        self.UIElements = {}
        
        """ Check to see if the UI exists """
        self.windowName = "RG_Test1"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """    
        self.windowWidth = 120
        self.windowHeight = 400
        buttonWidth = 100
        buttonHeight = 30
        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="RG_Test_UI", sizeable=True)
        """ Use a flow layout for the buttons """
        self.UIElements["flowLayout"] = cmds.flowLayout(v=True, width=self.windowWidth, height=self.windowHeight)
        
        """ Define the buttons """
        self.UIElements["jntInfoButton"] = cmds.button(label="JntInfo", width=buttonWidth, height=buttonHeight, enable=True,  annotation='Get information on the bind joints', c=self.getBindJointInfo)
        self.UIElements["rigSkelButton"] = cmds.button(label="CreateRigSkel", width=buttonWidth, height=buttonHeight, enable=True,  annotation='Create a rig skeleton', c=self.createRigSkel)
        self.UIElements["buildLegButton"] = cmds.button(label="BuildLeg", width=buttonWidth, height=buttonHeight, enable=True,  annotation='Create a biped leg', c=self.createIkLegChains)
        self.UIElements["connectSkelButton"] = cmds.button(label="ConnectSkels", width=buttonWidth, height=buttonHeight, enable=True,  annotation='Connect the rig and bind skeletons', c=self.connectJntToRigSkel)
        self.UIElements["zeroControlButton"] = cmds.button(label="Zero Controls", width=buttonWidth, height=buttonHeight, enable=False,  annotation='All animation controls to zero ', c=self.zeroAllControls)


        """ Show the window"""
        cmds.showWindow(self.windowName)
      

    """ This function is used to find all the bind joint, and provide general stats"""
    """ I am actually counting a few joints that are not being bound """
    def getBindJointInfo(self, *args):
        """ Create an empty array """
        bindJoints = []
        
        """ Find all of the joints """
        cmds.select("jnt_*")
        selJnts = cmds.ls(sl=True, type="joint")
        
        """ Deselect the joints """
        cmds.select(d=True)
        
        """ Prune the joint array to include only bind joints """
        for jnt in selJnts:
            suffix = "cap" 
            result = jnt.endswith(suffix)
            if result == False:
                bindJoints.append(jnt)
        bindJntArrayLen = len(bindJoints)
        print bindJntArrayLen 
        """ Return bindJnts """
        cmds.select(bindJoints)
        return bindJoints
        
    def createRigSkel(self, *args):
        bindJoints = self.getBindJointInfo()

        jntPairs = []

        """ Step through the bind joints and create a corresponding rig joint. """
        for joint in bindJoints:
            """ Create a new name for the rig joint """
            rigJointName = joint.replace("jnt_", "rig_")
            """ Get the joint Position"""
            jntPos = cmds.xform(joint, q=True, t=True, ws=True)
            """ Get the joint parent"""
            jntParentTmp = cmds.listRelatives(joint, p=True)
            if jntParentTmp != None:
                jntParent = jntParentTmp[0].replace("jnt_", "rig_")
                jntPairs.append([rigJointName, jntParent])
            else:
                jntParent == None 

            """ Create a rig joint """
            cmds.joint(n=rigJointName, p=jntPos)
            cmds.joint(edit=True, oj="xyz", secondaryAxisOrient="yup", zso=True)
            cmds.select(d=True)

        for index in range(len(jntPairs)):
            if jntPairs[index][1] != None:
                cmds.parent(jntPairs[index][0], jntPairs[index][1])


    def createIkLegChains(self, *args):
        self.jointChains = {}
        """ For this leg we will need to build 2 sets of IK joints.
        This first set is the primary chain."""
        selected = cmds.ls(sl=True, type="joint")
        if len(selected) != 0:
            prefix = "jnt_" 
            result = selected[0].startswith(prefix)
            if result == True:
                legHi = self.getSelHipHierarchy(selected)
            else:
                print "Please Select A Jnt_Hip Joint"
                cmds.headsUpMessage("Please select a jnt_*_hip")
                return

        else:
            print "Please Select A Hip Joint"
            cmds.headsUpMessage("Please select a jnt_*_hip")
            return

        """ Build primary ik leg joints"""
        ikPLegJnts = self.buildLegSkel(legHi, "ikPJnt_")

        """ Build the ik leg joints """
        fkLegJnts = self.buildLegSkel(legHi, "fkJnt_")

        """ Create the fk leg """
        fkLeg = self.createFkLeg(fkLegJnts)

        """ Get all of the fk ik and rig joints into a dictionary """
        self.jointChains["allJointChains"] = self.collectJointChains(legHi[0])

        """ Create blendColor nodes and setup the fk/ik switch """
        #legSwitchodes = self.fkIkSwitch(self.jointChains["allJointChains"])
        """ Use parent constraints and setup the fk/ik switch """
        legSwitchodes = self.fkIkSwitch(self.jointChains["allJointChains"])

        """ Create a spring IK on the primary chain"""
        # ikSpringSolver;
        mel.eval('ikSpringSolver')
        #cmds.ikSolver(st='ikSCsolver')

        pSolverName = ikPLegJnts[4][0].replace("jnt_", "springSolver_")
        iksSolver = cmds.ikHandle(n=pSolverName, sj=ikPLegJnts[4][0], ee=ikPLegJnts[1][0], sol="ikSpringSolver")

        """ Create a foot control """
        tmp = selected[0].partition("_")[2]
        instanceName = tmp.partition("_")[0]
        footControlName = ("ctrl" + instanceName + "_ikFoot")
        ctrlPos = cmds.xform(ikPLegJnts[1][0], q=True, ws=True, t=True)
        footCtrl = self.createFootControl(footControlName, ctrlPos)

        """ Parent the springIK to the foot control """
        cmds.parent(iksSolver[0], footCtrl[0])

        """ Create a stretchy ik setup """
        ikStrJnts = ([ikPLegJnts[4][0], ikPLegJnts[2][0], ikPLegJnts[1][0]])
        part = 1
        stIk = self.createStretchyIk(ikStrJnts, ikPLegJnts[3][0], footCtrl, ikPLegJnts[1][0], part)

        """ Create a stretchy ik setup """
        part = 2
        ikStrJnts = ([ikPLegJnts[3][0], ikPLegJnts[1][0], ikPLegJnts[0][0]])
        stIk2 = self.createStretchyIk(ikStrJnts, ikPLegJnts[2][0], footCtrl, ikPLegJnts[1][0], part)

        """ Create a no flip knee """
        poleVec = self.createNoFlipKnee(iksSolver, ikPLegJnts[4][0], footCtrl)

        """ Setup the toe """
        toeIK = self.createToeIk(ikPLegJnts[1][0], ikPLegJnts[0][0], iksSolver, footCtrl)


    def collectJointChains(self, legJnts, *args):
        jntCollection = []
        for jnt in legJnts:
            rigJnt = jnt.replace("jnt_", "rig_")
            fkJnt = jnt.replace("jnt_", "fkJnt_")
            ikJnt = jnt.replace("jnt_", "ikPJnt_")
            jntCollection.append([rigJnt, fkJnt, ikJnt])
        return jntCollection

    def fkIkSwitch(self, legJnts, *args):
        print "FIKS"
        print legJnts
        swCtrlFile = controlDir + "fkCircleControl.ma"


        """ Create a switch control """
        swControl = []
        ctrlFile = controlDir + "swControl.ma"
        cmds.file(ctrlFile, i=True )
        cmds.select("grp_control")
        cmds.xform(cp=True)
        swControlGrp = cmds.ls(sl=True)
   
        cmds.select("control")
        swCtrl= cmds.ls(sl=True)
        cmds.makeIdentity( apply=True )
 
        tmpName = legJnts[0][0].replace("rig_", "sw_")
        cmds.rename(swControlGrp, "grp_" + tmpName)
        swCtrl = cmds.rename(swCtrl, tmpName)
        swControl.append(swCtrl)

        cmds.addAttr( shortName='switch', longName='switch', defaultValue=0, minValue=0, maxValue=1, k=True)
        cmds.addAttr( shortName='ctrl_vis', longName='ctrl_vis', at="enum", en="0:1:", k=False, r=True, w=True)

        """ Create  reverseNode """
        bcTNodeName = legJnts[0][0].replace("rig_", "bc_")
        bcTranNode = cmds.shadingNode("reverse", asUtility=True, n=bcTNodeName)

        """ Connect the switch attr to the reverse node """
        cmds.connectAttr(swCtrl+".switch", bcTranNode+".inputX")

        

        for item in legJnts:
           
            """ Constrain rig to both ik and fk """
            cmds.parentConstraint(item[1], item[0], mo=True)
            pCon = cmds.parentConstraint(item[2], item[0], mo=True)

            pconInfo = cmds.parentConstraint(pCon, q=True, wal=True)
            
            fkCon = pconInfo[0] 
            ikCon = pconInfo[1] 
            
            """ Connect swith or bc to parent constraint """
            cmds.connectAttr(swCtrl+".switch", pCon[0] + "." + fkCon)
            cmds.connectAttr(bcTranNode+".outputX", pCon[0] + "." + ikCon)


    def createFkLeg(self, fkLegJnts, *args):
        fkControls = []
        fkCtrlFile = controlDir + "fkCircleControl.ma"
        for fkJnt in fkLegJnts:
            cmds.file(fkCtrlFile, i=True )
     
            cmds.select("grp_control")
            fkCtrlGrp = cmds.ls(sl=True)

            tmpCon = cmds.pointConstraint(fkJnt[0], fkCtrlGrp, mo=False) 
            cmds.delete(tmpCon)
            tmpCon = cmds.orientConstraint(fkJnt[0], fkCtrlGrp, mo=False) 
            cmds.delete(tmpCon)

            cmds.select("control")
            fkCtrl = cmds.ls(sl=True)
            cmds.makeIdentity( apply=True )
            cmds.select(d=True)

            fkCtrlName = fkJnt[0].replace("fkJnt_", "ctrl_")
            fkControlGrp = cmds.rename(fkCtrlGrp, "grp_" + fkCtrlName)
            fkControl = cmds.rename(fkCtrl, fkCtrlName)
            fkControls.append(fkControl)

            #cmds.parentConstraint(fk)

        return fkControls




    def createFootControl(self, footControlName, ctrlPos, *args):
        footControl = []
        ikCtrlFile = controlDir + "footControl.ma"
        cmds.file(ikCtrlFile, i=True )
        cmds.select("*grp_control")
        footControlGrp = cmds.ls(sl=True)
        cmds.xform(t=ctrlPos) 
        cmds.select("control")
        footCtrl= cmds.ls(sl=True)
        cmds.makeIdentity( apply=True )

        cmds.rename(footControlGrp, "grp_" + footControlName)
        footCtrl = cmds.rename(footCtrl, footControlName)
        footControl.append(footCtrl)

        cmds.addAttr( shortName='twist', longName='twist', defaultValue=0, minValue=-360, maxValue=360, k=True)
        cmds.addAttr( shortName='bias', longName='bias', defaultValue=0, minValue=-90, maxValue=90, k=True)
        cmds.addAttr( shortName='l1_stretch', longName='l1_stretch', defaultValue=0, k=True)
        cmds.addAttr( shortName='l2_stretch', longName='l2_stretch', defaultValue=0, k=True)
        cmds.select(d=True)
        
        return footControl



    def createToeIk(self, ball, toe, iksSolver, footCtrl, *args):
        """ Create an Ik Solver """
        solverName = toe.replace("ikPJnt_", "toeSolver_")
        iktSolver = cmds.ikHandle(n=solverName, sj=ball, ee=toe, sol="ikRPsolver")

        """ Create attributes on the foot control """
        attributes = ("toe_roll", "toe_twist", "toe_bank")
        cmds.select(footCtrl)
        for attr in attributes:  
            cmds.addAttr(shortName=attr, longName=attr, defaultValue=0, k=True)
        cmds.select(d=True)

        """ Create a group at the toe """
        groupName = toe.replace("ikPJnt_", "grp_ik_")
        grpPos = cmds.xform(toe, q=True, t=True, ws=True)
        toeGrp = cmds.group(name=groupName, em=True, p=footCtrl[0])

        cmds.select(toeGrp)
        cmds.xform(toeGrp, t=grpPos, ws=True) 
        cmds.select(d=True)
        #cmds.parent(toeGrp, footCtrl)
        #cmds.parent(iktSolver, footCtrl)
        #cmds.parent(iksSolver, toeGrp)
        #cmds.parent(iktSolver, toeGrp)
        cmds.connectAttr(footCtrl[0]+".toe_roll", toeGrp+".rotateX")
        cmds.connectAttr(footCtrl[0]+".toe_twist", toeGrp+".rotateY")
        cmds.connectAttr(footCtrl[0]+".toe_bank", toeGrp+".rotateZ")




    def createNoFlipKnee(self, iksSolver, hip, footControl, *args):
        """ Create a locator """

        """ Create a locator to use for the PoleVector"""
        lctrName = hip.replace("Jnt_", "LctrPV_")
        lctrPos = cmds.xform(hip, q=True, ws=True, t=True)
        pvPoint = cmds.spaceLocator(n=lctrName, p=lctrPos)
        cmds.xform(cp=True)
        cmds.makeIdentity( apply=True )

        """ Parent the locator to the cog """
        cmds.parent(pvPoint, "rig_root") #Temp

        """ Constran ikHandle to PV """
        cmds.poleVectorConstraint(pvPoint[0], iksSolver[0])

        """ Create a twist attribute on the foot control """
        cmds.select(footControl)
        try:
            cmds.addAttr( shortName='twist', longName='twist', defaultValue=0, k=True)
        except:
            print "twist attr may have not been created"
        cmds.select(d=True)

        """ Create an mdiv and a pma node """
        mdivNamePrefix = hip.replace("Jnt_", "mDiv_PV_") 
        mdivNode = cmds.shadingNode("multiplyDivide", asUtility=True, n=mdivNamePrefix)

        pmaNamePrefix = hip.replace("Jnt_", "Pma_PV__") 
        pmaNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaNamePrefix)

        cmds.connectAttr(footControl[0]+".twist", mdivNode+".input1X")
        cmds.connectAttr(footControl[0]+".ry", mdivNode+".input1Y")
        # Will need to change this with cog
        cmds.connectAttr("jnt_c1_spine1.ry", mdivNode+".input1Z")

        cmds.setAttr(mdivNode+".input2X", -1)
        cmds.setAttr(mdivNode+".input2Y", -1)
        cmds.setAttr(mdivNode+".input2Z", -1)

        cmds.connectAttr(mdivNode+".input1X", pmaNode+".input1D[0]")
        cmds.connectAttr(mdivNode+".input1Y", pmaNode+".input1D[1]")
        cmds.connectAttr(pmaNode+".output1D", iksSolver[0]+".twist")
        #142.4
        cmds.setAttr(footControl[0]+".twist", 90)





    def getSelHipHierarchy(self, selJnt, *args):
        """ Create some empty arrays to store information """
        legJntSets = []
        
        """ Use the getBindJoints function"""
        selJnt = cmds.ls(sl=True)
        """ Find the hip bone and it's children """
        for jnt in selJnt:
            suffix = "hip" 
            result = jnt.endswith(suffix)
            if result == True:
                jntChildren = cmds.listRelatives(jnt, ad=True, type='joint')
                jntChildren.append(jnt)
                legJntSets.append(jntChildren)

        else: 
            cmds.headsUpMessage("Please select a jnt_*_hip")

        return legJntSets

    def buildLegSkel(self, inputJnts, prefix, *args):
        ikJntSet = []
        print inputJnts

        for j in inputJnts[0]:                
            """ Create a new name and query the joint position """
            ikJntName = j.replace("jnt_", prefix)
            ikJntPos = cmds.xform(j, q=True, t=True, ws=True)

            """ Create the new joint """
            cmds.select(d=True)
            ikJnt = cmds.joint(n=ikJntName, p=ikJntPos)
            cmds.select(d=True)

            """ Find the parent joint and append everything to ikJntSet """
            ikJntParentTmp = cmds.listRelatives(j, p=True)
            ikJntParent = ikJntParentTmp[0].replace("jnt_", prefix) 
            ikJntSet.append([ikJnt, ikJntParent])

            """ Create the joint hierarchy """
        for each in ikJntSet:
            suffix = "hip" 
            result = each[0].endswith(suffix)
            if result != True:
                cmds.parent(each[0], each[1])
            else:
                cmds.select(each[0])
                cmds.joint(edit=True, oj="xyz", secondaryAxisOrient="yup", zso=True)
                cmds.select(d=True)

        return ikJntSet


    def createStretchyIk(self, ikJnts, ikKneeJnt, footCtrl, ikBallJnt, part, *args):
        print "I CSIK"
        pHip = ikJnts[0]
        pKnee = ikKneeJnt
        pAnkle = ikJnts[1]
        pBall = ikBallJnt

        ikJntArray = (pHip, pAnkle)

        """ First we will handle all the stretchy nodes """
        """ Create locators for defining the distance between joints"""
        stretchPoints = []
        stretchPositions = []
        for jnt in ikJntArray:
            lctrName = jnt.replace("Jnt_", "LctrPos_")
            lctrPos = cmds.xform(jnt, q=True, ws=True, t=True)
            stretchPositions.append(lctrPos)

        distNamePrefix = pHip.replace("Jnt_", "disB_") 
        distN = cmds.distanceDimension( sp=(stretchPositions[0]), ep=(stretchPositions[1]) )
        distNode = distNamePrefix
        cmds.rename(distN, distNamePrefix)
        disdimCon = cmds.listConnections(distNode)
        for locator in disdimCon:
            stretchPoints.append(locator)

        """ Create nodes for stretchy """
        mdivNamePrefix = pHip.replace("Jnt_", "mDiv_") 
        mdivNode = cmds.shadingNode("multiplyDivide", asUtility=True, n=mdivNamePrefix)

        conNamePrefix = pHip.replace("Jnt_", "conN_") 
        conNode = cmds.shadingNode("condition", asUtility=True, n=conNamePrefix)

        """ Pont constrain stretchPoints[0] to hip and stretchPoints[1] to ankle """
        cmds.pointConstraint(pHip, stretchPoints[0], mo=True)
  
        cmds.parent(stretchPoints[1], footCtrl[0])


        """ Connect stPoint[0].translate to distNode.point1.XYZ """
        #cmds.connectAttr(stretchPoints[0]+".translate", distNode+".point1")
        """ Connect stPoint[1].translate to distNode.point2.XYZ """
        #cmds.connectAttr(stretchPoints[1]+".translate", distNode+".point2")


        """ Connect the distNode.distance to conNode.firstTerm"""
        cmds.connectAttr(distNode+".distance", conNode+".firstTerm")
        """ Connect distNode.distance to mdivNode.input1X """
        cmds.connectAttr(distNode+".distance", mdivNode+".input1X")
        """ Connect mdivNode.output1X to conNode.colorIfTrueR """
        cmds.connectAttr(mdivNode+".outputX", conNode+".colorIfTrue.colorIfTrueR")

        """ Set mdivNode to "divide" and conNode to "greater than or equal" """
        cmds.setAttr( mdivNode+".operation", 2)
        cmds.setAttr(conNode+".operation", 3)

        """ Connect conNode.outColorR to scale of hip and knee bones """
        if part == 1:
 
            cmds.setAttr(footCtrl[0]+".l1_stretch", 62)
            cmds.connectAttr(conNode+".outColorR", pHip+".scaleX")
            #cmds.connectAttr(conNode+".outColorR", pKnee+".scaleX")
            #cmds.connectAttr(conNode+".outColorR", pAnkle+".scaleY")
            """ Stretch attr connected to conNode.secondTerm and mdivNode.input2X """
            """ For Hip 0.250 """

            cmds.connectAttr(footCtrl[0]+".l1_stretch", conNode+".secondTerm")
            cmds.connectAttr(footCtrl[0]+".l1_stretch", mdivNode+".input2X")
        if part == 2:
 
            cmds.setAttr(footCtrl[0]+".l1_stretch", 62)
            cmds.connectAttr(conNode+".outColorR", pHip+".scaleX")
            #cmds.connectAttr(conNode+".outColorR", pKnee+".scaleX")
            #cmds.connectAttr(conNode+".outColorR", pAnkle+".scaleY")
            """ Stretch attr connected to conNode.secondTerm and mdivNode.input2X """
            """ For Hip 0.250 """
            cmds.setAttr(footCtrl[0]+".l2_stretch", 62)
            cmds.connectAttr(footCtrl[0]+".l2_stretch", conNode+".secondTerm")
            cmds.connectAttr(footCtrl[0]+".l2_stretch", mdivNode+".input2X")


    def connectJntToRigSkel(self, *args):
        """ Connect bind to rig jnts """
        cmds.select("rig_*")
        rigJnts = cmds.ls(sl=True, type="joint")
        for jnt in rigJnts:
            bindJnt = jnt.replace("rig_", "jnt_")
            cmds.parentConstraint(jnt, bindJnt, mo=True)

    def zeroAllControls(swlf, *args):
        print "ZERO"
        cmds.select("ctrl_*")
        controlSel = cmds.ls(sl=True)

        for ctrl in controlSel:
            print ctrl
            cattr = cmds.listAttr(ctrl, k=True, v=True, cb=True )
            print cattr



    """ Head with optional lookat control""" 
    """ One group point and orient constraint to the neck """
    """ Same group point constrained to the neck and orient constrained to a lookat control """
    """ Create a head control """
    """ Create a lookat control """
    """ Create a group for the head """
    """ Head control group is parented under the neck control """
    """ Head control grp is aim constrained to the lookat """
    """ Lookat attr controls lookat constraint weight and lookat control vis """



    """ Create a jaw control """

    """ Create a nose control with a lip raise attribute """

    """ Create ear controls with optional jiggle """


""" Used this to connect bias attr on feet
cmds.connectAttr("ctrl_l1_ikFoot.bias", "ikPJnt_l1_hip1.springAngleBias[0].springAngleBias_FloatValue") 
cmds.connectAttr("ctrl_l1_ikFoot.bias", "rev_l1_ikSpring_bias.inputX") 
cmds.connectAttr("ctrl_l1_ikFoot.bias", "ikPJnt_l1_hip1.springAngleBias[0].springAngleBias_FloatValue" ) """




""" This is code I used for spine and skeleton setup """


""" IK Spline expressions
cmds.expression( s='ik_spine3.twist = ctrl_spine3.rotateZ' )
cmds.expression( s='ik_spine1.twist = ctrl_spine1.rotateZ' )
cmds.expression( s='ik_spine2.twist = ik_spine3.twist + ik_spine1.twist / 2' )
"""


 



      