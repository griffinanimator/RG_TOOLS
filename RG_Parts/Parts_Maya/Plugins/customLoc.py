import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx
import maya.OpenMayaRender as omr
import maya.OpenMayaUI as omui

import math
import sys

glR = omr.MHardwareRenderer.theRenderer()
glFT = glR.glFunctionTable()

circleNodeName="clCircle"
circleNodeId= om.MTypeId(0x87632)

def drawOver():
    glFT.glClearDepth(0.0)
    glFT.glDepthFunc(omr.MGL_ALWAYS)

def statusCol(r,g,b,a,status):
    if status == omui.M3dView.kLead:
        glFT.glColor4f(0, 1, 1,a)
    elif status == omui.M3dView.kActive:
        glFT.glColor4f(1, 1, 1,a)
    else:
        glFT.glColor4f( r, g, b, a )
    
def clLocASA(node):
    nAttr= om.MFnNumericAttribute()
    
    #create and set attributes
    node.aColorR=nAttr.create("colorR","colR", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.1)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setMin(0)
    nAttr.setMax(1)
    
    node.aColorG=nAttr.create("colorG","colG", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.1)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setMin(0)
    nAttr.setMax(1)
    
    node.aColorB=nAttr.create("colorB","colB", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.8)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setMin(0)
    nAttr.setMax(1)
    
    
    node.aTransparency = nAttr.create( "transparency", "t", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.5)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    nAttr.setMin(0)
    nAttr.setMax(1)
    
    node.aLineWidth = nAttr.create( "lineWidth", "lw", om.MFnNumericData.kInt)
    nAttr.setDefault(1)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    nAttr.setMin(1)
    nAttr.setMax(10)
    
    node.aDrawOver= nAttr.create("drawOver","dro",om.MFnNumericData.kInt)
    nAttr.setDefault(0)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    nAttr.setMin(0)
    nAttr.setMax(1)
    
    enumAttr = om.MFnEnumAttribute()
    node.aDrawType = enumAttr.create("drawType", "dt")
    enumAttr.addField("wireframe", 0)
    enumAttr.addField("shaded", 1)
    enumAttr.setHidden(False)
    enumAttr.setKeyable(True)
    enumAttr.setDefault(1)
    
    #add attribute
    node.addAttribute(node.aColorR)
    node.addAttribute(node.aColorG)
    node.addAttribute(node.aColorB)
    node.addAttribute(node.aTransparency)
    node.addAttribute(node.aLineWidth)
    node.addAttribute(node.aDrawOver)
    node.addAttribute(node.aDrawType)

class clCircle(ompx.MPxLocatorNode):
    def __init__(self):
        ompx.MPxLocatorNode.__init__(self)
    
    def compute(self,plug,dataBlock):
        return om.kUnknownParameter
    
    def draw(self, view, path, style, status):
        thisNode= self.thisMObject()
        fnThisNode= om.MFnDependencyNode(thisNode)
        trX= om.MPlug(thisNode,self.localPositionX).asFloat()
        trY= om.MPlug(thisNode,self.localPositionY).asFloat()
        trZ= om.MPlug(thisNode,self.localPositionZ).asFloat()
        slX= om.MPlug(thisNode,self.localScaleX).asFloat()
        slY= om.MPlug(thisNode,self.localScaleY).asFloat()
        slZ= om.MPlug(thisNode,self.localScaleZ).asFloat()
        a = om.MPlug(thisNode, fnThisNode.attribute("transparency")).asFloat()
        r = om.MPlug(thisNode, fnThisNode.attribute ("colorR")).asFloat()
        g = om.MPlug(thisNode, fnThisNode.attribute ("colorG")).asFloat()
        b = om.MPlug(thisNode, fnThisNode.attribute ("colorB")).asFloat()
        dp = om.MPlug (thisNode, fnThisNode.attribute ("drawPlace")).asInt()
        dt = om.MPlug (thisNode, fnThisNode.attribute ("drawType")).asInt()
        seg = om.MPlug (thisNode,fnThisNode.attribute("segment")).asInt()
        rad = om.MPlug (thisNode,fnThisNode.attribute("radius")).asFloat()
        lw = om.MPlug (thisNode,fnThisNode.attribute("lineWidth")).asInt()
        dro = om.MPlug(thisNode,fnThisNode.attribute("drawOver")).asInt()
        
        def drawCircle(self):
            ang = float(360)/float(seg)
            glFT.glBegin(omr.MGL_TRIANGLE_FAN)
            for i in xrange(seg):
                x = math.cos(math.radians(ang*float(i)))
                y = math.sin(math.radians(ang*float(i)))
                x1= math.cos(math.radians(ang*float(i+1)))
                y1= math.sin(math.radians(ang*float(i+1)))
                glFT.glVertex3f(0*slX+trX,0*slY+trY,0*slZ+trZ)
                if dp==0:
                    glFT.glVertex3f(0.0*slX+trX,x*slY*rad+trY,y*slZ*rad+trZ)
                    glFT.glVertex3f(0.0*slX+trX,x1*slY*rad+trY,y1*slZ*rad+trZ)
                elif dp==1:
                    glFT.glVertex3f(x*slX*rad+trX,0.0*slY+trY,y*slZ*rad+trZ)
                    glFT.glVertex3f(x1*slX*rad+trX,0.0*slY+trY,y1*slZ*rad+trZ)
                else:
                    glFT.glVertex3f(x*slX*rad+trX,y*slY*rad+trY,0.0*slZ+trZ)
                    glFT.glVertex3f(x1*slX*rad+trX,y1*slY*rad+trY,0.0*slZ+trZ)
            glFT.glEnd()
            

        def drawShaded(self):
            glFT.glDisable (omr.MGL_CULL_FACE)
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_POLYGON_SMOOTH)

        def drawWireframe(self):
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_LINE)
            glFT.glLineWidth(lw)
        glFT.glPushAttrib(omr.MGL_ALL_ATTRIB_BITS)
        view.beginGL()
        if dro == 1:
            drawOver()
        
        f=drawShaded
        if style not in [omui.M3dView.kFlatShaded, omui.M3dView.kGouraudShaded]:
            f=drawWireframe
        if dt == 1: f=drawShaded
        elif dt==0: f=drawWireframe
        glFT.glEnable( omr.MGL_BLEND )
        glFT.glBlendFunc( omr.MGL_SRC_ALPHA, omr.MGL_ONE_MINUS_SRC_ALPHA )
        statusCol(r,g,b,a,status)
        f(self)
        drawCircle(self)
        f(self)
        if dro == 1:
            drawCircle(self)
        view.endGL()
        glFT.glPopAttrib()


def circleNodeCreator():
    return ompx.asMPxPtr(clCircle())

def circleNodeInitializer():
    clLocASA(clCircle)
    
    nAttr= om.MFnNumericAttribute()
    
    clCircle.aSeg=nAttr.create("segment","seg",om.MFnNumericData.kInt)
    nAttr.setDefault(8)
    nAttr.setMin(2)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    
    clCircle.aRad = nAttr.create("radius","rad", om.MFnNumericData.kFloat)
    nAttr.setDefault(1.0)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    
    enumAttr = om.MFnEnumAttribute()
    clCircle.aDrawPlace = enumAttr.create("drawPlace", "dp")
    enumAttr.addField("x", 0)
    enumAttr.addField("y", 1)
    enumAttr.addField("z", 2)
    enumAttr.setHidden(False)
    enumAttr.setKeyable(True)
    enumAttr.setDefault(0)
    
    clCircle.addAttribute(clCircle.aSeg)
    clCircle.addAttribute(clCircle.aRad)
    clCircle.addAttribute(clCircle.aDrawPlace)
########################################################################################
boxNodeName = "dfBox"
boxNodeId = om.MTypeId(0x87633)
  
class dfBox(ompx.MPxLocatorNode):
  
    def __init__(self):
        ompx.MPxLocatorNode.__init__(self)
  
    def compute(self, plug, dataBlock):
        return om.kUnknownParameter
  
    def draw(self, view, path, style, status):
        thisNode= self.thisMObject()
        fnThisNode = om.MFnDependencyNode(thisNode)
        trX= om.MPlug(thisNode,self.localPositionX).asFloat()
        trY= om.MPlug(thisNode,self.localPositionY).asFloat()
        trZ= om.MPlug(thisNode,self.localPositionZ).asFloat()
        slX= om.MPlug(thisNode,self.localScaleX).asFloat()
        slY= om.MPlug(thisNode,self.localScaleY).asFloat()
        slZ= om.MPlug(thisNode,self.localScaleZ).asFloat()
        lw = om.MPlug(thisNode, fnThisNode.attribute("lineWidth")).asInt()
        a = om.MPlug(thisNode, fnThisNode.attribute("transparency")).asFloat()
        r = om.MPlug(thisNode, fnThisNode.attribute ("colorR")).asFloat()
        g = om.MPlug(thisNode, fnThisNode.attribute ("colorG")).asFloat()
        b = om.MPlug(thisNode, fnThisNode.attribute ("colorB")).asFloat()
        xsize = om.MPlug(thisNode, fnThisNode.attribute("xsize")).asFloat()
        ysize = om.MPlug(thisNode, fnThisNode.attribute("ysize")).asFloat()
        zsize = om.MPlug(thisNode, fnThisNode.attribute("zsize")).asFloat()
        dt = om.MPlug (thisNode, fnThisNode.attribute ("drawType")).asInt()
        dro = om.MPlug(thisNode,fnThisNode.attribute("drawOver")).asInt()

  
        def drawCube(self):
            glFT.glBegin (omr.MGL_QUADS)
            glFT.glNormal3f (0.0*slX+trX, 0.0*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, -ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, -ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, ysize*slY+trY, zsize*slZ+trZ)
  
            glFT.glNormal3f (0.0*slX+trX, 0.0*slY+trY,-zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, -ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, -ysize*slY+trY, -zsize*slZ+trZ)
  
            glFT.glNormal3f (0.0*slX+trX, ysize*slY+trY, 0.0*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, ysize*slY+trY, -zsize*slZ+trZ)
  
            glFT.glNormal3f (0.0*slX+trX, -ysize*slY+trY, 0.0*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, -ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, -ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, -ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, -ysize*slY+trY, zsize*slZ+trZ)
  
            glFT.glNormal3f (xsize*slX+trX, 0.0*slY+trY, 0.0*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, -ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (xsize*slX+trX, -ysize*slY+trY, zsize*slZ+trZ)
  
            glFT.glNormal3f (-xsize*slX+trX, 0.0*slY+trY, 0.0*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, -ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, -ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, ysize*slY+trY, zsize*slZ+trZ)
            glFT.glVertex3f (-xsize*slX+trX, ysize*slY+trY, -zsize*slZ+trZ)
            glFT.glEnd()
  
        def drawShaded(self):
            glFT.glEnable (omr.MGL_CULL_FACE)
            glFT.glPolygonMode(omr.MGL_FRONT, omr.MGL_POLYGON_SMOOTH)
  
        def drawWireframe(self):
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_LINE)
            glFT.glLineWidth(lw)
        
        glFT.glPushAttrib(omr.MGL_ALL_ATTRIB_BITS)
        view.beginGL()
        if dro == 1:
            drawOver()
        f = drawShaded
        if style not in [omui.M3dView.kFlatShaded, omui.M3dView.kGouraudShaded]:
            f = drawWireframe
        if dt == 1:   f = drawShaded
        elif dt == 0: f = drawWireframe
        glFT.glEnable( omr.MGL_BLEND )
        glFT.glBlendFunc( omr.MGL_SRC_ALPHA, omr.MGL_ONE_MINUS_SRC_ALPHA )
        statusCol(r,g,b,a,status)
        f(self)
        drawCube(self)
        f(self)
        glFT.glPopAttrib()
        view.endGL()
  
    def isBounded(self):
        return True
  
    def drawLast(self):
        return True
  
    def boundingBox(self):
        fnThisNode = om.MFnDependencyNode(self.thisMObject())
        xsize = om.MPlug(self.thisMObject(), fnThisNode.attribute("xsize")).asFloat()
        ysize = om.MPlug(self.thisMObject(), fnThisNode.attribute("ysize")).asFloat()
        zsize = om.MPlug(self.thisMObject(), fnThisNode.attribute("zsize")).asFloat()
        corner1 = om.MPoint(xsize,ysize,zsize)
        corner2 = om.MPoint(-xsize,-ysize,-zsize)
        bbox = om.MBoundingBox( corner1, corner2 )
        return bbox
  
def boxNodeCreator():
    return ompx.asMPxPtr( dfBox())
  
def boxNodeInitializer():
    clLocASA(dfBox)
  
    enumAttr = om.MFnEnumAttribute()
    nAttr = om.MFnNumericAttribute()
    
    dfBox.aXsize = nAttr.create( "xsize", "xsz", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.5)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
  
    dfBox.aYsize = nAttr.create( "ysize", "ysz", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.5)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
  
    dfBox.aZsize = nAttr.create( "zsize", "zsz", om.MFnNumericData.kFloat)
    nAttr.setDefault(0.5)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
  
  
    dfBox.addAttribute(dfBox.aXsize)
    dfBox.addAttribute(dfBox.aYsize)
    dfBox.addAttribute(dfBox.aZsize)


########################################################################################
cilinderNodeName="clCilinder"
cilinderNodeId= om.MTypeId(0x87634)


class clCilinder(ompx.MPxLocatorNode):
    def __init__(self):
        ompx.MPxLocatorNode.__init__(self)
    
    def compute(self,plug,dataBlock):
        return om.kUnknownParameter
    
    def draw(self, view, path, style, status):
        thisNode= self.thisMObject()
        fnThisNode= om.MFnDependencyNode(thisNode)
        trX= om.MPlug(thisNode,self.localPositionX).asFloat()
        trY= om.MPlug(thisNode,self.localPositionY).asFloat()
        trZ= om.MPlug(thisNode,self.localPositionZ).asFloat()
        slX= om.MPlug(thisNode,self.localScaleX).asFloat()
        slY= om.MPlug(thisNode,self.localScaleY).asFloat()
        slZ= om.MPlug(thisNode,self.localScaleZ).asFloat()
        a = om.MPlug(thisNode, fnThisNode.attribute("transparency")).asFloat()
        r = om.MPlug(thisNode, fnThisNode.attribute ("colorR")).asFloat()
        g = om.MPlug(thisNode, fnThisNode.attribute ("colorG")).asFloat()
        b = om.MPlug(thisNode, fnThisNode.attribute ("colorB")).asFloat()
        dp = om.MPlug (thisNode, fnThisNode.attribute ("drawPlace")).asInt()
        dt = om.MPlug (thisNode, fnThisNode.attribute ("drawType")).asInt()
        seg = om.MPlug (thisNode,fnThisNode.attribute("segment")).asInt()
        rad = om.MPlug (thisNode,fnThisNode.attribute("radius")).asFloat()
        rtp = om.MPlug (thisNode,fnThisNode.attribute("radiusTop")).asFloat()
        rcp = om.MPlug (thisNode,fnThisNode.attribute("removeCaps")).asInt()
        lw = om.MPlug (thisNode,fnThisNode.attribute("lineWidth")).asInt()
        dro = om.MPlug(thisNode,fnThisNode.attribute("drawOver")).asInt()
        hgt = om.MPlug(thisNode,fnThisNode.attribute("height")).asFloat()
        
        def drawCilinder(self):
            ang = float(360)/float(seg)
            if rcp == 0:
                glFT.glBegin(omr.MGL_TRIANGLE_FAN)
                for i in xrange(seg):
                    x = math.cos(math.radians(ang*float(i)))
                    y = math.sin(math.radians(ang*float(i)))
                    x1= math.cos(math.radians(ang*float(i+1)))
                    y1= math.sin(math.radians(ang*float(i+1)))
                    glFT.glVertex3f(0.0*slX+trX,0.0*slY+trY,0.0*slZ+trZ)
                    if dp==0:
                        glFT.glVertex3f(0.0*slX+trX,x1*slY*rad+trY,y1*slZ*rad+trZ)
                        glFT.glVertex3f(0.0*slX+trX,x*slY*rad+trY,y*slZ*rad+trZ)
                    elif dp==1:
                        glFT.glVertex3f(x1*slX*rad+trX,0.0*slY+trY,y1*slZ*rad+trZ)
                        glFT.glVertex3f(x*slX*rad+trX,0.0*slY+trY,y*slZ*rad+trZ)
                        
                    else:
                        glFT.glVertex3f(x1*slX*rad+trX,y1*slY*rad+trY,0.0*slZ+trZ)
                        glFT.glVertex3f(x*slX*rad+trX,y*slY*rad+trY,0.0*slZ+trZ)
                        
                glFT.glEnd()
                glFT.glBegin(omr.MGL_TRIANGLE_FAN)
                for i in xrange(seg):
                    x = math.cos(math.radians(ang*float(i)))
                    y = math.sin(math.radians(ang*float(i)))
                    x1= math.cos(math.radians(ang*float(i+1)))
                    y1= math.sin(math.radians(ang*float(i+1)))
                    if dp==0:
                        glFT.glVertex3f(hgt*slX+trX,0.0*slY+trY,0.0*slZ+trZ)
                        glFT.glVertex3f(hgt*slX+trX,x1*slY*rtp+trY,y1*slZ*rtp+trZ)
                        glFT.glVertex3f(hgt*slX+trX,x*slY*rtp+trY,y*slZ*rtp+trZ)
                        
                    elif dp==1:
                        glFT.glVertex3f(0.0*slX+trX,hgt*slY+trY,0.0*slZ+trZ)
                        glFT.glVertex3f(x1*slX*rtp+trX,hgt*slY+trY,y1*slZ*rtp+trZ)
                        glFT.glVertex3f(x*slX*rtp+trX,hgt*slY+trY,y*slZ*rtp+trZ)
                        
                    else:
                        glFT.glVertex3f(0.0*slX+trX,0.0*slY+trY,hgt*slZ+trZ)
                        glFT.glVertex3f(x1*slX*rtp+trX,y1*slY*rtp+trY,hgt*slZ+trZ)
                        glFT.glVertex3f(x*slX*rtp+trX,y*slY*rtp+trY,hgt*slZ+trZ)
                        
                glFT.glEnd()
            glFT.glBegin(omr.MGL_QUADS)
            for i in xrange(seg):
                x = math.cos(math.radians(ang*float(i)))
                y = math.sin(math.radians(ang*float(i)))
                x1= math.cos(math.radians(ang*float(i+1)))
                y1= math.sin(math.radians(ang*float(i+1)))
                if dp==0:
                    glFT.glVertex3f(0.0*slX+trX,x*slY*rad+trY,y*slZ*rad+trZ)
                    glFT.glVertex3f(0.0*slX+trX,x1*slY*rad+trY,y1*slZ*rad+trZ)
                    glFT.glVertex3f(hgt*slX+trX,x1*slY*rtp+trY,y1*slZ*rtp+trZ)
                    glFT.glVertex3f(hgt*slX+trX,x*slY*rtp+trY,y*slZ*rtp+trZ)
                elif dp==1:
                    glFT.glVertex3f(x*slX*rad+trX,0.0*slY+trY,y*slZ*rad+trZ)
                    glFT.glVertex3f(x1*slX*rad+trX,0.0*slY+trY,y1*slZ*rad+trZ)
                    glFT.glVertex3f(x1*slX*rtp+trX,hgt*slY+trY,y1*slZ*rtp+trZ)
                    glFT.glVertex3f(x*slX*rtp+trX,hgt*slY+trY,y*slZ*rtp+trZ)
                else:
                    glFT.glVertex3f(x*slX*rad+trX,y*slY*rad+trY,0.0*slZ+trZ)
                    glFT.glVertex3f(x1*slX*rad+trX,y1*slY*rad+trY,0.0*slZ+trZ)
                    glFT.glVertex3f(x1*slX*rtp+trX,y1*slY*rtp+trY,hgt*slZ+trZ)
                    glFT.glVertex3f(x*slX*rtp+trX,y*slY*rtp+trY,hgt*slZ+trZ)
            glFT.glEnd()
        def drawShaded(self):
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_FLAT)

        def drawWireframe(self):
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_LINE)
            glFT.glLineWidth(lw)
        glFT.glPushAttrib(omr.MGL_ALL_ATTRIB_BITS)
        view.beginGL()
        if dro == 1:
            drawOver()
        
        f=drawShaded
        if style not in [omui.M3dView.kFlatShaded, omui.M3dView.kGouraudShaded]:
            f=drawWireframe
        if dt == 1: f=drawShaded
        elif dt==0: f=drawWireframe
        glFT.glEnable( omr.MGL_BLEND )
        glFT.glBlendFunc( omr.MGL_SRC_ALPHA, omr.MGL_ONE_MINUS_SRC_ALPHA )
        statusCol(r,g,b,a,status)
        f(self)
        drawCilinder(self)
        f(self)
        if dro == 1:
            drawCilinder(self)
        view.endGL()
        glFT.glPopAttrib()


def cilinderNodeCreator():
    return ompx.asMPxPtr(clCilinder())

def cilinderNodeInitializer():
    clLocASA(clCilinder)
    
    nAttr= om.MFnNumericAttribute()
    
    clCilinder.aSeg=nAttr.create("segment","seg",om.MFnNumericData.kInt)
    nAttr.setDefault(8)
    nAttr.setMin(2)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    
    clCilinder.aRCp=nAttr.create("removeCaps","rcp",om.MFnNumericData.kInt)
    nAttr.setDefault(0)
    nAttr.setMin(0)
    nAttr.setMax(1)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)    
    
    clCilinder.aRad = nAttr.create("radius","rad", om.MFnNumericData.kFloat)
    nAttr.setDefault(1.0)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    
    clCilinder.aRTp = nAttr.create("radiusTop","rtp", om.MFnNumericData.kFloat)
    nAttr.setDefault(1.0)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)    
    
    clCilinder.aHgt = nAttr.create("height","hgt", om.MFnNumericData.kFloat)
    nAttr.setDefault(1.0)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    
    enumAttr = om.MFnEnumAttribute()
    clCilinder.aDrawPlace = enumAttr.create("drawPlace", "dp")
    enumAttr.addField("x", 0)
    enumAttr.addField("y", 1)
    enumAttr.addField("z", 2)
    enumAttr.setHidden(False)
    enumAttr.setKeyable(True)
    enumAttr.setDefault(0)
    
    
    
    clCilinder.addAttribute(clCilinder.aSeg)
    clCilinder.addAttribute(clCilinder.aRCp)
    clCilinder.addAttribute(clCilinder.aRad)
    clCilinder.addAttribute(clCilinder.aRTp)
    clCilinder.addAttribute(clCilinder.aHgt)
    clCilinder.addAttribute(clCilinder.aDrawPlace)

########################################################################################
sphereNodeName="dfSphere"
sphereNodeId= om.MTypeId(0x87635)


class dfSphere(ompx.MPxLocatorNode):
    def __init__(self):
        ompx.MPxLocatorNode.__init__(self)
    
    def compute(self,plug,dataBlock):
        return om.kUnknownParameter
    
    def draw(self, view, path, style, status):
        thisNode= self.thisMObject()
        fnThisNode= om.MFnDependencyNode(thisNode)
        trX= om.MPlug(thisNode,self.localPositionX).asFloat()
        trY= om.MPlug(thisNode,self.localPositionY).asFloat()
        trZ= om.MPlug(thisNode,self.localPositionZ).asFloat()
        slX= om.MPlug(thisNode,self.localScaleX).asFloat()
        slY= om.MPlug(thisNode,self.localScaleY).asFloat()
        slZ= om.MPlug(thisNode,self.localScaleZ).asFloat()
        a = om.MPlug(thisNode, fnThisNode.attribute("transparency")).asFloat()
        r = om.MPlug(thisNode, fnThisNode.attribute ("colorR")).asFloat()
        g = om.MPlug(thisNode, fnThisNode.attribute ("colorG")).asFloat()
        b = om.MPlug(thisNode, fnThisNode.attribute ("colorB")).asFloat()
        dt = om.MPlug (thisNode, fnThisNode.attribute ("drawType")).asInt()
        segx = om.MPlug (thisNode,fnThisNode.attribute("segmentX")).asInt()
        segy = om.MPlug (thisNode,fnThisNode.attribute("segmentY")).asInt()
        rad = om.MPlug (thisNode,fnThisNode.attribute("radius")).asFloat()
        lw = om.MPlug (thisNode,fnThisNode.attribute("lineWidth")).asInt()
        dro = om.MPlug(thisNode,fnThisNode.attribute("drawOver")).asInt()
        
        def drawSphere(self):
            PI = math.pi
            for i in xrange(segx):
                lat0 = PI * (-0.5 + float(i) / segx)
                z0  = math.sin(lat0)
                zr0 = math.cos(lat0)
                lat1 = PI * (-0.5 + float(i+1) / segx)
                z1 = math.sin(lat1)
                zr1 = math.cos(lat1)
                glFT.glBegin(omr.MGL_QUAD_STRIP)
                for j in xrange(segy+1):
                    lng = 2 * PI * float(j) / segy
                    x = math.cos(lng)
                    y = math.sin(lng)
                    glFT.glVertex3f(x*slX* zr0 * rad+trX, y*slY * zr0 * rad+trY, z0*slZ * rad+trZ)
                    glFT.glVertex3f(x*slX* zr1 * rad+trX, y*slY * zr1 * rad+trY, z1*slZ * rad+trZ)
                glFT.glEnd()
        
        def drawShaded(self):
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_FLAT)

        def drawWireframe(self):
            glFT.glPolygonMode(omr.MGL_FRONT_AND_BACK, omr.MGL_LINE)
            glFT.glLineWidth(lw)
        glFT.glPushAttrib(omr.MGL_ALL_ATTRIB_BITS)
        view.beginGL()
        if dro == 1:
            drawOver()
        
        f=drawShaded
        if style not in [omui.M3dView.kFlatShaded, omui.M3dView.kGouraudShaded]:
            f=drawWireframe
        if dt == 1: f=drawShaded
        elif dt==0: f=drawWireframe
        glFT.glEnable( omr.MGL_BLEND )
        glFT.glBlendFunc( omr.MGL_SRC_ALPHA, omr.MGL_ONE_MINUS_SRC_ALPHA )
        statusCol(r,g,b,a,status)
        f(self)
        drawSphere(self)
        f(self)
        view.endGL()
        glFT.glPopAttrib()


def sphereNodeCreator():
    return ompx.asMPxPtr(dfSphere())

def sphereNodeInitializer():
    clLocASA(dfSphere)
    
    nAttr= om.MFnNumericAttribute()
    
    dfSphere.aSegX=nAttr.create("segmentX","segX",om.MFnNumericData.kInt)
    nAttr.setDefault(8)
    nAttr.setMin(2)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)

    dfSphere.aSegY=nAttr.create("segmentY","segY",om.MFnNumericData.kInt)
    nAttr.setDefault(8)
    nAttr.setMin(2)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)    

    
    dfSphere.aRad = nAttr.create("radius","rad", om.MFnNumericData.kFloat)
    nAttr.setDefault(1.0)
    nAttr.setKeyable(1)
    nAttr.setReadable(1)
    nAttr.setWritable(1)
    nAttr.setStorable(1)
    
    dfSphere.addAttribute(dfSphere.aSegX)
    dfSphere.addAttribute(dfSphere.aSegY)
    dfSphere.addAttribute(dfSphere.aRad)

########################################################################################

def initializePlugin(mobject):
    mplugin = ompx.MFnPlugin(mobject,"Antonio Sacco","1.0","Any")
    
    try:
        mplugin.registerNode(circleNodeName, circleNodeId, circleNodeCreator,circleNodeInitializer, ompx.MPxNode.kLocatorNode)
    except:
        sys.stderr.write("Failed to register node: %s" % circleNodeName)
        raise
    try:
        mplugin.registerNode( boxNodeName, boxNodeId, boxNodeCreator, boxNodeInitializer, ompx.MPxNode.kLocatorNode )
    except:
        sys.stderr.write( "Failed to register node: %s" % boxNodeName )
        raise
    try:
        mplugin.registerNode(cilinderNodeName, cilinderNodeId, cilinderNodeCreator,cilinderNodeInitializer, ompx.MPxNode.kLocatorNode)
    except:
        sys.stderr.write("Failed to register node: %s" % cilinderNodeName)
        raise
    
    try:
        mplugin.registerNode(sphereNodeName, sphereNodeId, sphereNodeCreator,sphereNodeInitializer, ompx.MPxNode.kLocatorNode)
    except:
        sys.stderr.write("Failed to register node: %s" % sphereNodeName)
        raise

def uninitializePlugin(mobject):
    mplugin= ompx.MFnPlugin(mobject)
    
    try:
        mplugin.deregisterNode(circleNodeId)
    except:
        sys.stderr.write("Failed to deregister node: %s" % circleNodeName)
        raise
    try:
        mplugin.deregisterNode( boxNodeId )
    except:
        sys.stderr.write( "Failed to deregister node: %s" % boxNodeName )
        raise
    
    try:
        mplugin.deregisterNode(cilinderNodeId)
    except:
        sys.stderr.write("Failed to deregister node: %s" % cilinderNodeName)
        raise
    
    try:
        mplugin.deregisterNode(sphereNodeId)
    except:
        sys.stderr.write("Failed to deregister node: %s" % sphereNodeName)
        raise    