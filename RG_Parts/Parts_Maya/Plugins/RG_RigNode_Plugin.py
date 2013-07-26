import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import maya.OpenMayaRender as OpenMayaRender
import maya.OpenMayaUI as OpenMayaUI

import math
import sys

kPluginNodeTypeName = "RG_Part"
# Gve an ID (identifier) to our type of node
nodeTypeId = OpenMaya.MTypeId(0x00000006)

# A pointer to hardware render class
glRenderer = OpenMayaRender.MHardwareRenderer.theRenderer()
# Pointer to open GL instructions
glFT = glRenderer.glFunctionTable()

aBase = OpenMaya.MObject()

class RigNode(OpenMayaMPx.MPxLocatorNode):
        size = OpenMaya.MObject()

        def __init__(self):
                OpenMayaMPx.MPxLocatorNode.__init__(self)

        def compute(self, plug, dataBlock):
                return OpenMaya.kUnknownParameter

        
        # Define how the rigNode will draw.
        def draw(self, view, path, style, status):
                thisNode = self.thisMObject()

                plug = OpenMaya.MPlug(thisNode, self.size)
                
                sizeVal = plug.asMDistance()
                
                multiplier = sizeVal.asCentimeters()

                view.beginGL()

                glFT.glColor3f(1, 0, 0)
                glFT.glBegin(OpenMayaRender.MGL_TRIANGLES)
                glFT.glVertex3f(-1.0, 0.0, 0.0)
                glFT.glVertex3f(-2.0, 0.0, 2.0)         
                glFT.glVertex3f(-2.0, 0.0, -2.0)        
                glFT.glEnd()

                glFT.glColor3f(1, 0, 0)
                glFT.glBegin(OpenMayaRender.MGL_TRIANGLES)
                glFT.glVertex3f(1.0, 0.0, 0.0)
                glFT.glVertex3f(2.0, 0.0, 2.0)          
                glFT.glVertex3f(2.0, 0.0, -2.0) 
                glFT.glEnd()

                # Y Axis
                glFT.glColor3f(0, 1, 0)
                glFT.glBegin(OpenMayaRender.MGL_TRIANGLES)
                glFT.glVertex3f(-2.0, 2.0, 0.0)
                glFT.glVertex3f(0.0, 1.0, 0.0)          
                glFT.glVertex3f(2.0, 2.0, 0.0)          
                glFT.glEnd()

                glFT.glColor3f(0, 1, 0)
                glFT.glBegin(OpenMayaRender.MGL_TRIANGLES)
                glFT.glVertex3f(-2.0, -2.0, 0.0)
                glFT.glVertex3f(0.0, -1.0, 0.0)         
                glFT.glVertex3f(2.0, -2.0, 0.0)         
                glFT.glEnd()

                # Z Axis
                glFT.glColor3f(0, 0, 1)
                glFT.glBegin(OpenMayaRender.MGL_TRIANGLES)
                glFT.glVertex3f(-2.0, 0.0, 2.0)
                glFT.glVertex3f(0.0, 0.0, 1.0)          
                glFT.glVertex3f(2.0, 0.0, 2.0)          
                glFT.glEnd()

                glFT.glColor3f(0, 0, 1)
                glFT.glBegin(OpenMayaRender.MGL_TRIANGLES)
                glFT.glVertex3f(-2.0, 0.0, -2.0)
                glFT.glVertex3f(0.0, 0.0, -1.0)         
                glFT.glVertex3f(2.0, 0.0, -2.0)         
                glFT.glEnd()

                view.endGL()
       
        def isBounded(self):
                return True

        def boundingBox(self):
                thisNode = self.thisMObject()
                plug = OpenMaya.MPlug(thisNode, self.size)
                
                sizeVal = plug.asMDistance()
                
                multiplier = sizeVal.asCentimeters()
                
                corner1 = OpenMaya.MPoint(-0.5, 0.0, 0.5)
                corner2 = OpenMaya.MPoint(0.5, 0.0, -0.5)
                
                corner1 = corner1 * multiplier
                corner2 = corner2 * multiplier
                
                bbox = OpenMaya.MBoundingBox( corner1, corner2 )
                return bbox

def nodeCreator():
        return OpenMayaMPx.asMPxPtr(RigNode())
 
def nodeInitializer():
        unitFn = OpenMaya.MFnUnitAttribute()
        RigNode.size = unitFn.create("size", "in", OpenMaya.MFnUnitAttribute.kDistance)
        unitFn.setDefault(1.0)
        RigNode.addAttribute( RigNode.size )
 
def initializePlugin(mobject):                                             
        mplugin = OpenMayaMPx.MFnPlugin(mobject)
        try:
                mplugin.registerNode(kPluginNodeTypeName, nodeTypeId, nodeCreator, nodeInitializer, OpenMayaMPx.MPxNode.kLocatorNode)
        except:
                sys.stderr.write( "Failed to register node: %s" % kPluginNodeTypeName)
                raise

def uninitializePlugin(mobject):                            
        mplugin = OpenMayaMPx.MFnPlugin(mobject)
        try:
                mplugin.deregisterNode(nodeTypeId)
        except:
                sys.stderr.write( "Failed to deregister node: %s" % kPluginNodeTypeName)
                raise
