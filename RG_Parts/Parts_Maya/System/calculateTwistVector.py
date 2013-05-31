def matchTwistAngle(twistAttribute, ikJoints, targetJoints):
    currentVector = []
    targetVector = []
    
    currentVector = calculateTwistVector(ikJoints[0], ikJoints[1], ikJoints[len(ikJoints)-1])
    targetVector = calculateTwistVector(targetJoints[0], targetJoints[1], targetJoints[len(targetJoints)-1])
    
    targetVector = normaliseVector(targetVector)
    currentVector = normaliseVector(currentVector)
    
    offsetAngle = calculateAngleBetweenNormalisedVectors(targetVector, currentVector)
    
    finalOffset = offsetAngle*-1
    print finalOffset

    
def calculateTwistVector(startJoint, secondJoint, endJoint):
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
    
def normaliseVector(vector):
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
    
def calculateAngleBetweenNormalisedVectors(VectA, VectB):
    from math import acos, degrees
    
    dotProduct = VectA[0]*VectB[0] + VectA[1]*VectB[1] + VectA[2]*VectB[2]\
    
    if dotProduct <= -1.0:
        dotProduct = -1.0
    elif dotProduct >= 1.0:
        dotProduct = 1.0
        
    radians = acos(dotProduct)
    print radians
    return degrees(radians)
    
ikHandleControl = 'ikh_l_thigh01'
blueprintJoints = (['bn_l_thigh01', 'bn_l_knee01', 'bn_l_ankle01'])
joints = (['ik_l_thigh01', 'ik_l_knee01', 'ik_l_ankle01'])

matchTwistAngle(ikHandleControl+".twist", joints, blueprintJoints)