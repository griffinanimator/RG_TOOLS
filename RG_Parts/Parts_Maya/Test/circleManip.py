#
# Autodesk Script File
# MODIFY THIS AT YOUR OWN RISK
#
# Creation Date:   27 September 2006
#
# Example Plugin: circleNode.py
#
# This plug-in is an example of a user-defined dependency graph node.
# It takes a number as input (such as time) and generates two output
# numbers one which describes a sine curve as the input varies and
# one that generates a cosine curve. If these two are hooked up to
# the x and z translation attributes of an object the object will describe
# move through a circle in the xz plane as time is changed.
#
# See circleNodeTest.py for an example of how to use the node. The script will
# create a new "Circle" menu with a single item. Selecting this will build
# a simple model (a sphere which follows a circular path) which can be played back,
# by clicking on the "play" icon on the time slider.  Note: the circleNode
# plugin needs to be loaded before the "Circle" menu item can be executed
# properly.
#
# The node has two additional attributes which can be changed to affect
# the animation, "scale" which defines the size of the circular path, and
# "frames" which defines the number of frames required for a complete circuit
# of the path. Either of these can be hooked up to other nodes, or can
# be simply set via the command "maya.cmds.setAttr" operating on the circle node
# "circleNode1" created by the Python script. For example:
#
#       import maya.cmds as cmds
#       cmds.setAttr("circleNode1.scale", #)
#
# will change the size of the circle and:
#
#       cmds.setAttr("circleNode1.frames", #)
#
# will cause objects to complete a circle in indicated number of frames.
#

import math, sys

import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx

kPluginNodeTypeName = "spCircle"
kPluginNodeId = OpenMaya.MTypeId(0x87005)


# Node definition
class circle(OpenMayaMPx.MPxNode):
        # class variables
        aInput = OpenMaya.MObject()
        aScale = OpenMaya.MObject()
        aFrames = OpenMaya.MObject()
        aSOutput = OpenMaya.MObject()
        aCOutput = OpenMaya.MObject()


        def __init__(self):
                OpenMayaMPx.MPxNode.__init__(self)


        def compute(self, plug, data):
                # Check that the requested recompute is one of the output values
                if (plug == circle.aSOutput or plug == circle.aCOutput):
                        # Read the input values
                        inputData = data.inputValue(circle.aInput)
                        scaleData = data.inputValue(circle.aScale)
                        framesData = data.inputValue(circle.aFrames)

                        # Compute the output values
                        currentFrame = inputData.asFloat()
                        scaleFactor  = scaleData.asFloat()
                        framesPerCircle = framesData.asFloat()
                        angle = 6.2831853 * (currentFrame/framesPerCircle)
                        sinResult = math.sin(angle) * scaleFactor
                        cosResult = math.cos(angle) * scaleFactor

                        # Store them on the output plugs
                        sinHandle = data.outputValue(circle.aSOutput)
                        cosHandle = data.outputValue(circle.aCOutput)
                        sinHandle.setFloat(sinResult)
                        cosHandle.setFloat(cosResult)
                        data.setClean(plug)
                else:
                        return OpenMaya.MStatus.kUnknownParameter

                return OpenMaya.MStatus.kSuccess


# creator
def nodeCreator():
        return OpenMayaMPx.asMPxPtr( circle() )


# initializer
def nodeInitializer():
        nAttr = OpenMaya.MFnNumericAttribute()

        # Setup the input attributes
        circle.aInput = nAttr.create("input", "in", OpenMaya.MFnNumericData.kFloat, 0.0)
        nAttr.setStorable(True)

        circle.aScale = nAttr.create("scale", "sc", OpenMaya.MFnNumericData.kFloat, 10.0)
        nAttr.setStorable(True)

        circle.aFrames = nAttr.create("frames", "fr", OpenMaya.MFnNumericData.kFloat, 48.0)
        nAttr.setStorable(True)

        # Setup the output attributes
        circle.aSOutput = nAttr.create("sineOutput", "so", OpenMaya.MFnNumericData.kFloat, 0.0)
        nAttr.setWritable(False)
        nAttr.setStorable(False)

        circle.aCOutput = nAttr.create("cosineOutput", "co", OpenMaya.MFnNumericData.kFloat, 0.0,)
        nAttr.setWritable(False)
        nAttr.setStorable(False)

        # Add the attributes to the node
        circle.addAttribute(circle.aInput)
        circle.addAttribute(circle.aScale)
        circle.addAttribute(circle.aFrames)
        circle.addAttribute(circle.aSOutput)
        circle.addAttribute(circle.aCOutput)

        # Set the attribute dependencies
        circle.attributeAffects(circle.aInput, circle.aSOutput)
        circle.attributeAffects(circle.aInput, circle.aCOutput)
        circle.attributeAffects(circle.aScale, circle.aSOutput)
        circle.attributeAffects(circle.aScale, circle.aCOutput)
        circle.attributeAffects(circle.aFrames, circle.aSOutput)
        circle.attributeAffects(circle.aFrames, circle.aCOutput)


# initialize the script plug-in
def initializePlugin(mobject):
        mplugin = OpenMayaMPx.MFnPlugin(mobject, "Autodesk", "1.0", "Any")
        try:
                mplugin.registerNode( kPluginNodeTypeName, kPluginNodeId, nodeCreator, nodeInitializer )
        except:
                sys.stderr.write( "Failed to register node: %s" % kPluginNodeTypeName )
                raise


# uninitialize the script plug-in
def uninitializePlugin(mobject):
        mplugin = OpenMayaMPx.MFnPlugin(mobject)
        try:
                mplugin.deregisterNode( kPluginNodeId )
        except:
                sys.stderr.write( "Failed to deregister node: %s" % kPluginNodeTypeName )
                raise