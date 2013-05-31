import sys
import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import maya.OpenMayaRender as OpenMayaRender

nodeTypeName = "RG_Part"
# Gve an ID (identifier) to our type of node
nodeTypeId = OpenMaya.MTypeId(0x00000004)

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

 


def nodeCreator():
	return OpenMayaMPx.asMPxPtr(RigNode())
 
def nodeInitializer():
	return OpenMaya.MStatus.kSuccess
 
def initializePlugin(obj):						
	plugin = OpenMayaMPx.MFnPlugin(obj)
	try:
		plugin.registerNode(nodeTypeName, nodeTypeId, nodeCreator, nodeInitializer, OpenMayaMPx.MPxNode.kLocatorNode)
	except:
		sys.stderr.write( "Failed to register node: %s" % nodeTypeName)

def uninitializePlugin(obj):				
	plugin = OpenMayaMPx.MFnPlugin(obj)
	try:
		plugin.deregisterNode(nodeTypeId)
	except:
		sys.stderr.write( "Failed to deregister node: %s" % nodeTypeName)
