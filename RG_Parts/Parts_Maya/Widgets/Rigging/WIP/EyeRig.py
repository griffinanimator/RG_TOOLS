import maya.cmds as cmds

from maya import cmds, OpenMaya


#  Create a bone for every selected vert
center =  'locator1'
vtx = cmds.ls(sl=1, fl=1)

for v in vtx:
    cmds.select(cl=1)
    jnt =  cmds.joint()
    pos =  cmds.xform(v, q=1, ws=1, t=1)
    cmds.xform(jnt, ws=1, t=pos)
    posC =  cmds.xform(center, q=1, ws=1, t=1)
    cmds.select(cl=1)
    jntC =  cmds.joint()
    cmds.xform(jntC, ws=1, t=posC)
    cmds.parent(jnt, jntC)
    cmds.joint(jntC, e=1, oj="xyz", secondaryAxisOrient="yup", ch=1)
    

# Create an up vector and an aim constraint to help lid joints rotate around eye.    
    
sel = cmds.ls(sl=True)

wuObject = 'l_eye_upVector_lctr'

for s in sel:
    loc =  cmds.spaceLocator()[0]
    pos = cmds.xform(s, q=1, ws=1, t=1)
    cmds.xform(loc, ws=1, t=pos)
    par = cmds.listRelatives(s, p=1)[0]
    cmds.aimConstraint(loc, par, mo=True, weight=1, aimVector = (1,0,0), upVector = (0,1,0), worldUpType = "object", worldUpObject = wuObject)


"""
NOTE:  We should build curves through script by finding each locator position and use
that info to create cvs
"""


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
    
"""
Create a low rez curve for the top and bottom
"""

""" Create a wire deformer between high and low curve. """

""" Create controllers.  Snap Pivot to low curve cvs """

""" Create a secondary control visibility switch """

""" Create jnts to skin curves """

""" Point constrain each bone to coresponding control """

""" Point constrain secondary between primary """






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


        