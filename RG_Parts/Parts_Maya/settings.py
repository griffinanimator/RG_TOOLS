import os
import sys
import pymel.core as pm
import maya.cmds as cmds

print "Yes"
import RG_Tools.RG_Parts.Parts_Maya.System.FileUtils as File_Utils
import RG_Tools.RG_Parts.Parts_Maya.System.Parts_MenuCmds as PMC

# Load Parts Plugins
print "Loading Parts Plugins"
Parts_Plugin_Path = ( os.environ['Parts_Maya'] + '/Plugins/')
RG_Plugs = File_Utils.findAllFiles(Parts_Plugin_Path, '.py')
for plug in RG_Plugs:
	print plug
    cmds.loadPlugin(Parts_Plugin_Path + plug)

# Load Red9 Tools
"""
print "Loading Red9"
RN_Plugin_Path = ( os.environ['GTOOLS'] + '/MG_Tools/cpp/')
print RN_Plugin_Path
RN_Plugs = File_Utils.findAllFiles(RN_Plugin_Path, '.cpp')
for plug in RG_Plugs:
	print plug
    #cmds.loadPlugin(Parts_Plugin_Path + plug)
"""

# Create the menu
pmc = PMC.Parts_Menu()
pmc.createMenu()