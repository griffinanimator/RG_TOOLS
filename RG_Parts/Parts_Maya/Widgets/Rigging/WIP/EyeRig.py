import maya.cmds as cmds

from maya import cmds, OpenMaya

"""
Create a UI that will generate x number of locators
with names
"""

upLidLocators = (['r_upLid1_lctr', [1.2, -0.7, 6.3]], ['r_upLid2_lctr', [1.3, -0.6, 6.3]], ['r_upLid3_lctr', [1.5, -0.5, 6.3]], ['r_upLid4_lctr', [1.5, -0.4, 6.3]], ['r_upLid5_lctr', [1.4, -0.2, 6.3]]) 
lowLidLocators = (['r_lowLid1_lctr', [1.2, -0.6, 6.2]], ['r_lowLid2_lctr', [1.3, -0.6, 6.2]], ['r_lowLid3_lctr', [1.4, -0.5, 6.2]], ['r_lowLid4_lctr', [1.5, -0.0, 6.0]], ['r_lowLid5_lctr', [1., -0.0, 6.0]])

#  Create a bone for every selected vert
center =  'l_eyeCenter_lctr1'
#vtx = cmds.ls(sl=1, fl=1)

endJoints = []
locObjs = []
# Make an empty group to hold joints
jgrp = cmds.group(name='r_lid_rJnt_grp', em=True)
# Make an empty group to hold locators
lgrp = cmds.group(name='r_lid_lctr_grp', em=True)
for l in lowLidLocators:
    cmds.parent(l[0], lgrp)
    locObjs.append(l[0])
    cmds.select(cl=1)
    jointName = l[0].replace('_lctr', 'rjnt_end')
    jnt =  cmds.joint(name=jointName)
    cmds.parent(jnt, jgrp) 
    pos =  cmds.xform(l[0], q=1, ws=1, t=1)
    cmds.xform(jnt, ws=1, t=pos)
    posC =  cmds.xform(center, q=1, ws=1, t=1)
    cmds.select(cl=1)
    jointName = l[0].replace('_lctr', '_rjnt')
    ej = jntC =  cmds.joint(name=jointName)
    cmds.parent(ej, jgrp)
    cmds.xform(jntC, ws=1, t=posC)
    cmds.parent(jnt, jntC)
    cmds.joint(jntC, e=1, oj="xyz", secondaryAxisOrient="yup", ch=1)
    endJoints.append(ej)
    

# Create an up vector and an aim constraint to help lid joints rotate around eye.    
    
#sel = cmds.ls(sl=True)

wuObject = 'r_eye_upVector_lctr'

for s in locObjs:
    #loc =  cmds.spaceLocator()[0]
    #pos = cmds.xform(s, q=1, ws=1, t=1)
    #cmds.xform(loc, ws=1, t=pos)
    #par = cmds.listRelatives(s, p=1)[0]
    par = s.replace('_lctr', '_rjnt')
    cmds.aimConstraint(s, par, mo=True, weight=1, aimVector = (1,0,0), upVector = (0,1,0), worldUpType = "object", worldUpObject = wuObject)



"""
Create a low rez curve for the top and bottom
"""
cvPos = []
#crvs = ('r_upLid_high_crv', 'r_upLid_low_crv', 'r_upLid_blink_crv')
crvs = ('r_lowLid_high_crv', 'r_lowLid_low_crv', 'r_lowLid_blink_crv')
for l in upLidLocators:
    pos = cmds.xform(l[0], q=True, ws=True, t=True)
    cvPos.append(pos)
print cvPos
for c in crvs:
    crv = cmds.curve(name=c, p=cvPos, d=1)

""" Create a wire deformer between high and low curve. """
# NOTE:  Wire no worky
cmds.wire( 'r_lowLid_high_crv', 'r_lowLid_low_crv')
cmds.wire( 'r_upLid_high_crv', 'r_upLid_low_crv')

""" Create controllers.  Snap Pivot to low curve cvs """
ctrlFile = 'Z:/RG_Parts/Parts_Maya/Controls/LidControl.ma'
ctrlJoints=[]
cjGrp=cmds.group(name='r_lid_ctrlJoints_grp', em=True)
ctrlGrp=cmds.group(name='r_lid_ctrl_grp', em=True)
crv='r_lowLid_low_crv'
for i in upLidLocators:
    cmds.file(ctrlFile, i=True)
    grpName = i[0].replace('_lctr', '_ctrl_grp')
    ctrlName = i[0].replace('_lctr', '_ctrl')
    jntName=i[0].replace('_lctr', '_ctrl_jnt')
    pos = cmds.xform(i[0], q=True, ws=True, t=True)
    cmds.select(d=True)
    cmds.joint(n=jntName, p=pos)
    cmds.xform('grp_control', ws=True, t=pos)
    cmds.xform('control', ws=True, piv=pos)
    cmds.pointConstraint('control', jntName, mo=True)
    ctrlJoints.append(jntName)
    cmds.parent('grp_control', ctrlGrp)
    cmds.parent(jntName, cjGrp)
    ctrlJoints.append(jntName)

    cmds.rename('grp_control', grpName)
    cmds.rename('control', ctrlName)
  

    

###############
from maya import cmds , OpenMaya

sel = cmds.ls(sl=1)
crv='l_lowLid_high_crvShape'
for s in sel:
    pos = cmds.xform(s, q=1, ws=1, t=1)
    # NOTE:  When working in feet, not enough precision
    u =  getUParam(pos, crv)
    name = s.replace('_loc', '_pci')
    pci = cmds.createNode("pointOnCurveInfo", n=name)
    cmds.connectAttr(crv + '.worldSpace', pci + '.inputCurve')
    cmds.setAttr(pci + '.parameter', u)
    cmds.connectAttr(pci + '.position', s + '.t')
    






""" Create a secondary control visibility switch """

""" Create jnts to skin curves """

""" Point constrain each bone to coresponding control """

""" Point constrain secondary between primary """

"""
Duplicate upper and lower high curves.
Create a wire deformer between
"""







from maya import cmds , OpenMaya

def getUParam( pnt = [], crv = None):

    point = OpenMaya.MPoint(pnt[0],pnt[1],pnt[2])
    curveFn = OpenMaya.MFnNurbsCurve(getDagPath(crv))
    paramUtill=OpenMaya.MScriptUtil()
    paramPtr=paramUtill.asDoublePtr()
    isOnCurve = curveFn.isPointOnCurve(point)
    if isOnCurve == True:
        
        curveFn.getParamAtPoint(point , paramPtr,0.001,OpenMaya.MSpace.kObject )
    else :
        point = curveFn.closestPoint(point,paramPtr,0.001,OpenMaya.MSpace.kObject)
        curveFn.getParamAtPoint(point , paramPtr,0.001,OpenMaya.MSpace.kObject )
    
    param = paramUtill.getDouble(paramPtr)
    param = param 
    return param

def getDagPath( objectName):
    
    if isinstance(objectName, list)==True:
        oNodeList=[]
        for o in objectName:
            selectionList = OpenMaya.MSelectionList()
            selectionList.add(o)
            oNode = OpenMaya.MDagPath()
            selectionList.getDagPath(0, oNode)
            oNodeList.append(oNode)
        return oNodeList
    else:
        selectionList = OpenMaya.MSelectionList()
        selectionList.add(objectName)
        oNode = OpenMaya.MDagPath()
        selectionList.getDagPath(0, oNode)
        return oNode
        
def getMObject(objectName):
    print objectName
    if isinstance(objectName, list)==True:
        print "True"
        oNodeList=[]
        for o in objectName:
            selectionList = OpenMaya.MSelectionList()
            selectionList.add(o)
            oNode = OpenMaya.MObject()
            selectionList.getDependNode(0, oNode)
            oNodeList.append(oNode)
        return oNodeList
        
    else:
        selectionList = OpenMaya.MSelectionList()
        selectionList.add(objectName)
        oNode = OpenMaya.MObject()
        selectionList.getDependNode(0, oNode)
        
        return oNode

#########################################
#Find U value of point on curve
from maya import cmds , OpenMaya

curveM = getMObject ("curveShape1")
print curveM

curveFn = OpenMaya.MFnNurbsCurve(curveM)
print curveFn

pos = cmds.xform("locator1", q=1, ws=1, t=1)
mPos = OpenMaya.MPoint(pos[0], pos[1], pos[2])

scriptU = OpenMaya.MScriptUtil()
paramPt = scriptU.asDoublePtr()

curveFn.getParamAtPoint(mPos, paramPt, OpenMaya.MSpace.kObject)

param = scriptU.getDouble(paramPt)

del(paramPt)


         