import sys
import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as OpenMayaMPx
import maya.OpenMayaRender as OpenMayaRender

nodeTypeName = "RG_Part"
# Gve an ID (identifier) to our type of node
nodeTypeId = OpenMaya.MTypeId(0x87079)

glRenderer = OpenMayaRender.MHardwareRenderer.theRenderer()