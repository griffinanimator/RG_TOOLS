import maya.cmds as cmds
import os
from functools import partial
import RG_Parts.Parts_Maya.Utils.Utils as utils


def rigNode(self, *args):
    # Find all the existing RG_Part nodes in the scene
    parts = cmds.ls(et='RG_Part')
    # Create a number suffix
    num = str(utils.findHighestTrailingNumber(parts, 'RG_Part'))
    # Create a transform
    tform = cmds.createNode('transform', name='RG_Part_' + num)
    # Create an RG_Part node and parent to the transform
    rNode = cmds.createNode ('RG_Part', n='RG_Part_Shape_' + num, p=tform)
    cmds.select(d=True)

def rigNodeRoot(self, *args):
    # Find all the existing RG_Part nodes in the scene
    parts = cmds.ls(et='RG_PartRoot')
    # Create a number suffix
    num = str(utils.findHighestTrailingNumber(parts, 'RG_PartRoot'))
    # Create a transform
    tform = cmds.createNode('transform', name='RG_PartRoot_' + num)
    # Create an RG_Part node and parent to the transform
    rNode = cmds.createNode ('RG_PartRoot', n='RG_PartRoot_Shape_' + num, p=tform)
    cmds.select(d=True)




def matchTwistAngle(twistAttribute, ikJoints, targetJoints):
    currentVector = []
    targetVector = []
    
    currentVector = calculateTwistVector(ikJoints[0], ikJoints[1], ikJoints[len(ikJoints)-1])
    targetVector = calculateTwistVector(targetJoints[0], targetJoints[1], targetJoints[len(targetJoints)-1])
    
    targetVector = normaliseVector(targetVector)
    currentVector = normaliseVector(currentVector)
    
    offsetAngle =calculateAngleBetweenNormalisedVectors(targetVector, currentVector)
    
    finalOffset = offsetAngle*-1
    finalOffset = offsetAngle

    return finalOffset

def calculateTwistVector(startJoint, secondJoint, endJoint, *args):
    a = cmds.xform(startJoint, q=True, ws=True, t=True)
    endPos = cmds.xform(endJoint, q=True, ws=True, t=True)
    
    b = [endPos[0] - a[0], endPos[1] - a[1], endPos[2] -a[2]]
    b = normaliseVector(b)
    
    p = cmds.xform(secondJoint, q=True, ws=True, t=True)
    
    p_minus_a = [p[0]-a[0], p[1]-a[1], p[2]-a[2]]
    p_minus_a__dot__b = p_minus_a[0]*b[0] + p_minus_a[1]*b[1] + p_minus_a[2]*b[2]
    
    p_minus_a__dot__b__multiply_b = [p_minus_a__dot__b * b[0], p_minus_a__dot__b * b[1], p_minus_a__dot__b * b[2]]
    
    q = [a[0] + p_minus_a__dot__b__multiply_b[0], a[1] + p_minus_a__dot__b__multiply_b[1], a[2] + p_minus_a__dot__b__multiply_b[2]]
    
    twistVector = [p[0] - q[0], p[1] - q[1], p[2] - q[2]]
    
    return twistVector  
    
def normaliseVector(vector, *args):
    from math import sqrt
    returnVector = list(vector)
    
    vectorLength = sqrt( returnVector[0]*returnVector[0] + returnVector[1]*returnVector[1] + returnVector[2]*returnVector[2])
    
    if vectorLength != 0:
        returnVector[0] /= vectorLength
        returnVector[1] /= vectorLength
        returnVector[2] /= vectorLength
    else:
        returnVector[0] = 1.0
        returnVector[1] = 0.0
        returnVector[2] = 0.0
        
    return returnVector  
    
def calculateAngleBetweenNormalisedVectors(VectA, VectB, *args):
    from math import acos, degrees
    
    dotProduct = VectA[0]*VectB[0] + VectA[1]*VectB[1] + VectA[2]*VectB[2]\
    
    if dotProduct <= -1.0:
        dotProduct = -1.0
    elif dotProduct >= 1.0:
        dotProduct = 1.0
        
    radians = acos(dotProduct)

    return degrees(radians)

def setupControlObject(control, ctrlName, ctrlAttrs, ctrlPos, ctrlPath, *args):
    # Delete the control if it exists
    if cmds.objExists('grp_%s' % (ctrlName)) == True:
        cmds.delete('grp_%s' % (ctrlName))
    # Import a control object
    cmds.file(ctrlPath + control, i=True)
    # rename the control
    ctrlGrp = 'grp_%s' % (ctrlName)
    cmds.rename('grp_control', ctrlGrp)
    cmds.rename('control', ctrlName)
    # Move the control to the foot position
    cmds.xform('grp_%s' % (ctrlName), t=ctrlPos, ws=True)
    # Add the control attributes
    if len(ctrlAttrs)!= 0:
        cmds.select(ctrlName)
        for attr in ctrlAttrs:
            cmds.addAttr(shortName=attr, longName=attr, defaultValue=0, k=True)

    return ([ctrlGrp, ctrlName])


def getSide(layoutRoot, *args):
    root = str(layoutRoot)

    parA = root.partition('_')[2]
    parB = parA.partition('_')[0]
    side = parB
    return parB

def collectLayoutInfo(*args):
    print "CollectLayoutInfo"
    lytTmp = []
    sel = cmds.ls(sl=True)

    rel = cmds.listRelatives(sel, ad=True, type="transform")

    for item in rel:
        print item
        pos = cmds.xform(item, q=True, ws=True, t=True)
        parent = cmds.listRelatives(item, p=True)
        lytTmp.append([item, pos, parent[0]])
    lytTmp.reverse()
    
    return (lytTmp, sel)
   

def createJoints(prefix, lytObs, *args):
    print "CreateJoints"

    cmds.select(d=True)

    ik_joints = []

    for item in lytObs:
        """ item[0] will be the joint
            item[1] will be the position
            item[2] will be the parent        
        """
        newJointName = item[0].replace("lyt_", prefix)

        cmds.select(d=True)
        if cmds.objExists(newJointName) == True:
            cmds.delete(newJointName)
        jnt = cmds.joint(p=item[1], n=newJointName )
        ik_joints.append(jnt)


    lytLen = len(lytObs)

    for item in range(len(lytObs)):
        if item != 0:
            joint = lytObs[item][0].replace("lyt_", prefix)
            jointParent = lytObs[item][2].replace("lyt_", prefix)
            cmds.parent(joint, jointParent) 

    for jnt in ik_joints:
        cmds.joint(jnt, e=True, oj='xyz', secondaryAxisOrient='yup', ch=True, zso=True)


    return ik_joints  


def createStretchyIk(control, ikHandleName, pvName, suffix, jnt_info, lyt_info, *args):  
    rootPos = cmds.xform(jnt_info[0], q=True, t=True, ws=True)
    midPos = cmds.xform(jnt_info[1], q=True, t=True, ws=True)
    endPos = cmds.xform(jnt_info[2], q=True, t=True, ws=True)
    
    # Create the ik solver
    cmds.ikHandle(n= ikHandleName, sj=jnt_info[0], ee=jnt_info[2], sol = "ikRPsolver")
    
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
    cmds.parent('lctrDis_End_' + suffix, control[1])

    # Determine the length of the joint chain in default position
    rootLen = cmds.getAttr(jnt_info[1] + '.tx')
    endLen = cmds.getAttr(jnt_info[2] + '.tx')
    chainLen = (rootLen + endLen)

    cmds.setAttr(adlStretch + '.input2', chainLen)
    cmds.setAttr(mdLStretch + '.input2X', chainLen)
    cmds.setAttr(mdKStretch + '.input2X', rootLen)
    cmds.setAttr(mdAStretch + '.input2X', endLen)

    # The clamp node lets us control the amount of stretch.
    cmds.connectAttr(control[1] + '.stretch', adlStretch + '.input1')
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
    cmds.connectAttr(mdKStretch + '.outputX', jnt_info[1]+ '.tx')
    cmds.connectAttr( mdAStretch + '.outputX', jnt_info[2] + '.tx')

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

    cmds.connectAttr(control[1]+'.twist', mDivTwst+'.input1X')
    cmds.connectAttr(control[1]+'.ry', mDivTwst+'.input1Y')
    # TODO: I need a pelvis or a better solution
    #cmds.connectAttr('jnt_pelvis.ry', 'mdNode_LegTwist.input1Z')
    cmds.setAttr(mDivTwst+'.input2X', -1)
    cmds.setAttr(mDivTwst+'.input2Y', -1)
    cmds.setAttr(mDivTwst+'.input2Z', -1)
    cmds.connectAttr(mDivTwst+'.input1X', pmaTwist+'.input1D[0]')
    cmds.connectAttr(mDivTwst+'.input1Y', pmaTwist+'.input1D[1]')

    # Calculate twist offset
    blueprintJoints = []
    for obj in lyt_info:
        blueprintJoints.append(obj[0])
    offset = matchTwistAngle(ikHandleName+".twist", jnt_info, blueprintJoints)
    # Make a buffer between the control and the ik twist
    cmds.setAttr(control[1]+'.twist_offset', offset)
    cmds.connectAttr(control[1]+'.twist_offset', pmaTwist+'.input1D[2]')
    cmds.connectAttr(pmaTwist+'.output1D', ikHandleName+'.twist')