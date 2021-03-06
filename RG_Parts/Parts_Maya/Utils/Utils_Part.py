import maya.cmds as cmds
import pymel.core as pm
import os
from functools import partial
import RG_Parts.Parts_Maya.Utils.Utils as utils
reload(utils)

def createJoints(prefix, lytObs, *args):
    print "CreateJoints"
    print prefix


    cmds.select(d=True)

    ik_joints = []

    for item in lytObs:
        """ item[0] will be the joint
            item[1] will be the position
            item[2] will be the parent        
        """
        print item[0]
        newJointName = prefix+item[0]

        cmds.select(d=True)
        if cmds.objExists(newJointName) == True:
            cmds.delete(newJointName)
        jnt = cmds.joint(p=item[1], n=newJointName )
        ik_joints.append(jnt)


    lytLen = len(lytObs)

    for item in range(len(lytObs)):
        if lytObs[item][2] != 'None':
            joint = prefix+lytObs[item][0]
            jointParent = prefix+lytObs[item][2]
            cmds.parent(joint, jointParent) 

    for jnt in ik_joints:
        cmds.joint(jnt, e=True, oj='xyz', secondaryAxisOrient='yup', ch=True, zso=True)


    return ik_joints  

def scStretchyIk(partList, partJoints, ikHandleName, *args):
    # Empty list to store nodes generated in scStretchyIk
    ikNodes = []

    cmds.select(d=True)
    pjntLen = len(partJoints)

    sjnt = partJoints[0]
    ejnt = partJoints[1]
    sjPos = cmds.xform(sjnt, q=True, t=True, ws=True)
    ejPos = cmds.xform(ejnt, q=True, t=True, ws=True)
    # Create the ik solver
    ikH = cmds.ikHandle(n= ikHandleName, sj=sjnt, ee=ejnt, sol = "ikRPsolver")
    cmds.setAttr(ikH[0] +'.visibility', 0)
    suffix = partJoints[0].partition('_')[2]
    # Stretch ----------------------------------------------------------
 
    mdEStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_EStretch_' + suffix)
    cmds.select(d=True)
    # NOTE: I need to change disDim transform name
    disDim = cmds.distanceDimension(sp=(sjPos), ep=(ejPos))
    cmds.setAttr('distanceDimension1.visibility', 0)
    cmds.connectAttr(disDim + '.distance', mdEStretch + '.input1X')
    #cmds.rename('distanceDimension1', 'disDimNode_Stretch_Shape' + suffix)

    
    cmds.rename('distanceDimension1', 'disDimNode_Stretch_' + suffix)
    
    # Determine the length of the joint chain in default position
    endLen = cmds.getAttr(partJoints[1] + '.ty')

    cmds.setAttr(mdEStretch + '.input2X', endLen)

    #Finally, we output our new values into the translateX of the knee and ankle joints.
    cmds.connectAttr( mdEStretch + '.outputX', ejnt  + '.ty')

    ikNodes.append([ikH[0], mdEStretch, 'disDimNode_Stretch_' + suffix])
    return ikNodes

def createPJoints(parts, *args):
    jointList = []
    cmds.select(d=True)
    print parts
    
    jointNameR = 'pjnt_'+parts[0]
    jointNameE = 'pjnt_end_'+parts[0]
    pjntR = cmds.joint(n=jointNameR, p=(cmds.xform(parts[0], q=True, ws=True, t=True)))
    pjntE = cmds.joint(n=jointNameE, p=(cmds.xform(parts[1], q=True, ws=True, t=True)))

    jointList.append(pjntR)
    jointList.append(pjntE)
    print "done"
    cmds.select(d=True)
    return jointList


def rigNode(userDefinedName, numParts, pParent, *args):

    Parts_List=[]
    for i in range(numParts):
        # NOTE: Crappy attempt at position.  Fix this!!!
        val = numParts
        pos = [0.0, val-i, 0.0]
        # Find all the existing RG_Part nodes in the scene
        parts = cmds.ls(et='RG_Part')
        # Create a number suffix
        tformName = userDefinedName+'_Part_' + str(i)
   
        # Create a transform
        tform = cmds.createNode("transform", n=tformName )       

        # Create an RG_Part node and parent to the transform
        rnodeName = userDefinedName+'_Part_Shape_' + str(i)
        rNode = cmds.createNode('RG_Part', p=tform, n=rnodeName)
        
        cmds.select(d=True)
        cmds.xform(tform, t=pos)

        cmds.parent(rNode, pParent)          

        lockAttrs=('.rx', '.ry', '.rz', '.sx', '.sy', '.sz')
        for attr in lockAttrs:
            cmds.setAttr(tform+attr, lock=True, keyable=False, channelBox=False)

        Parts_List.append(tform)
        
        cmds.select(d=True)
    return Parts_List

def rigNodeRoot(numParts, userDefinedName, *args):
    val = numParts+1
    pos = [0.0, val, 0.0]
    print pos
    # Find all the existing RG_Part nodes in the scene
    parts = cmds.ls(et='RG_PartRoot')
    # Create a number suffix
    num = str(utils.findHighestTrailingNumber(parts, 'PartRoot'))
    # Create a transform
    tform = cmds.createNode('transform', name=userDefinedName+'_PartRoot_' + num)
    # Create an RG_Part node and parent to the transform
    rNode = cmds.createNode ('RG_PartRoot', n=userDefinedName+'_PartRoot_Shape_' + num, p=tform)
    cmds.xform(tform, t=pos, ws=True)
    cmds.select(d=True)

    return(rNode)




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
    # Move the control to the  position
    cmds.xform('grp_%s' % (ctrlName), t=ctrlPos, ws=True)
    # Add the control attributes
    if len(ctrlAttrs)!= 0:
        print ctrlAttrs
        print ctrlName
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

def collectLayoutInfo(sel, *args):
    print "CollectLayoutInfo"
    lytTmp = []

    # NOTE:  Check this is the root.  I will probably do this with scriptJob widget detection

    rel = cmds.listRelatives(sel, ad=True, type="transform")
    relLen = len(rel)
    for i in range(len(rel)):
        pos = cmds.xform(rel[i], q=True, ws=True, t=True)
        # NOTE:  This seems to work at the moment, but I want to force the order.
        if i == 0:
            lytTmp.append([rel[i], pos, 'None'])
        else:
            lytTmp.append([rel[i], pos, rel[i-1]])

    return lytTmp




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
    """
    blueprintJoints = []
    for obj in lyt_info:
        blueprintJoints.append(obj[0])
    offset = matchTwistAngle(ikHandleName+".twist", jnt_info, blueprintJoints)
    # Make a buffer between the control and the ik twist
    cmds.setAttr(control[1]+'.twist_offset', offset)
    cmds.connectAttr(control[1]+'.twist_offset', pmaTwist+'.input1D[2]')
    cmds.connectAttr(pmaTwist+'.output1D', ikHandleName+'.twist')
    """