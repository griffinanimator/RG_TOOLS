import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import maya.OpenMayaRender as OpenMayaRender
import maya.OpenMayaUI as OpenMayaUI

import math
import sys

kPluginNodeTypeName = "spFootPrintNode"

footPrintNodeId = OpenMaya.MTypeId(0x87010)
glRenderer = OpenMayaRender.MHardwareRenderer.theRenderer()
glFT = glRenderer.glFunctionTable()

sole = ( [ 0.00, 0.0, -0.70 ],
[  0.04, 0.0, -0.69 ],
[  0.09, 0.0, -0.65 ],
[  0.13, 0.0, -0.61 ],
[  0.16, 0.0, -0.54 ],
[  0.17, 0.0, -0.46 ],
[  0.17, 0.0, -0.35 ],
[  0.16, 0.0, -0.25 ],
[  0.15, 0.0, -0.14 ],
[  0.13, 0.0,  0.00 ],
[  0.00, 0.0,  0.00 ],
[ -0.13, 0.0,  0.00 ],
[ -0.15, 0.0, -0.14 ],
[ -0.16, 0.0, -0.25 ],
[ -0.17, 0.0, -0.35 ],
[ -0.17, 0.0, -0.46 ],
[ -0.16, 0.0, -0.54 ],
[ -0.13, 0.0, -0.61 ],
[ -0.09, 0.0, -0.65 ],
[ -0.04, 0.0, -0.69 ],
[ -0.00, 0.0, -0.70 ] )
 
heel = ( [  0.00, 0.0, 0.06 ],
[  0.13, 0.0,  0.06 ],
[  0.14, 0.0,  0.15 ],
[  0.14, 0.0,  0.21 ],
[  0.13, 0.0,  0.25 ],
[  0.11, 0.0,  0.28 ],
[  0.09, 0.0,  0.29 ],
[  0.04, 0.0,  0.30 ],
[  0.00, 0.0,  0.30 ],
[ -0.04, 0.0,  0.30 ],
[ -0.09, 0.0,  0.29 ],
[ -0.11, 0.0,  0.28 ],
[ -0.13, 0.0,  0.25 ],
[ -0.14, 0.0,  0.21 ],
[ -0.14, 0.0,  0.15 ],
[ -0.13, 0.0,  0.06 ],
[ -0.00, 0.0,  0.06 ] )

class footPrintNode(OpenMayaMPx.MPxLocatorNode):
        size = OpenMaya.MObject()
        
        def __init__(self):
                OpenMayaMPx.MPxLocatorNode.__init__(self)
                
        def compute(self, plug, dataBlock):
                return OpenMaya.kUnknownParameter

        def draw(self, view, path, style, status):
                thisNode = self.thisMObject()

                plug = OpenMaya.MPlug(thisNode, self.size)
                
                sizeVal = plug.asMDistance()
                
                multiplier = sizeVal.asCentimeters()

                view.beginGL()

                if style == OpenMayaUI.M3dView.kFlatShaded or style == OpenMayaUI.M3dView.kGouraudShaded:
                        glFT.glPushAttrib(OpenMayaRender.MGL_CURRENT_BIT)
                        
                        if status == OpenMayaUI.M3dView.kActive:
                                view.setDrawColor( 13, OpenMayaUI.M3dView.kActiveColors )
                        else:
                                view.setDrawColor( 13, OpenMayaUI.M3dView.kDormantColors )

                        last = len(sole) - 1
                        glFT.glBegin( OpenMayaRender.MGL_TRIANGLE_FAN )
                        for i in range(last):
                                glFT.glVertex3f(sole[i][0]*multiplier, sole[i][1]*multiplier, sole[i][2]*multiplier)
                        glFT.glEnd()

                        last = len(heel) - 1
                        glFT.glBegin( OpenMayaRender.MGL_TRIANGLE_FAN )
                        for i in range(last):
                                glFT.glVertex3f(heel[i][0]*multiplier, heel[i][1]*multiplier, heel[i][2]*multiplier)
                        glFT.glEnd()

                        glFT.glPopAttrib()

                glFT.glBegin(OpenMayaRender.MGL_LINES)
                
                last = len(sole) - 1
                for i in range(last):
                        glFT.glVertex3f( sole[i][0]*multiplier, sole[i][1]*multiplier, sole[i][2]*multiplier )
                        glFT.glVertex3f( sole[i+1][0]*multiplier, sole[i+1][1]*multiplier, sole[i+1][2]*multiplier )
                        
                last = len(heel) - 1
                for i in range(last):
                        glFT.glVertex3f( heel[i][0]*multiplier, heel[i][1]*multiplier, heel[i][2]*multiplier )
                        glFT.glVertex3f( heel[i+1][0]*multiplier, heel[i+1][1]*multiplier, heel[i+1][2]*multiplier )
                
                glFT.glEnd()

                view.endGL()

        def isBounded(self):
                return True
        """
        def boundingBox(self):
                thisNode = self.thisMObject()
                plug = OpenMaya.MPlug(thisNode, self.size)
                
                sizeVal = plug.asMDistance()
                
                multiplier = sizeVal.asCentimeters()
                
                corner1 = OpenMaya.MPoint(-0.17, 0.0, -0.7)
                corner2 = OpenMaya.MPoint(0.17, 0.0, 0.3)
                
                corner1 = corner1 * multiplier
                corner2 = corner2 * multiplier
                
                bbox = OpenMaya.MBoundingBox( corner1, corner2 )
                return bbox
        """

# creator
def nodeCreator():
        return OpenMayaMPx.asMPxPtr( footPrintNode() )

# initializer
def nodeInitializer():
        unitFn = OpenMaya.MFnUnitAttribute()
        footPrintNode.size = unitFn.create("size", "in", OpenMaya.MFnUnitAttribute.kDistance)
        unitFn.setDefault(1.0)
        footPrintNode.addAttribute( footPrintNode.size )
        
# initialize the script plug-in
def initializePlugin(mobject):
        mplugin = OpenMayaMPx.MFnPlugin(mobject)
        try:
                mplugin.registerNode( kPluginNodeTypeName, footPrintNodeId, nodeCreator, nodeInitializer, OpenMayaMPx.MPxNode.kLocatorNode )
        except:
                sys.stderr.write( "Failed to register node: %s" % kPluginNodeTypeName )
                raise

# uninitialize the script plug-in
def uninitializePlugin(mobject):
        mplugin = OpenMayaMPx.MFnPlugin(mobject)
        try:
                mplugin.deregisterNode( footPrintNodeId )
        except:
                sys.stderr.write( "Failed to deregister node: %s" % kPluginNodeTypeName )
                raise