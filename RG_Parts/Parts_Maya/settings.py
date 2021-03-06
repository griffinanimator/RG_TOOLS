import os
import sys
import pymel.core as pm
import maya.cmds as cmds

import RG_Parts.Parts_Maya.Utils.Utils_File as File_Utils
import RG_Parts.Parts_Maya.System.Parts_MenuCmds as PMC
reload(PMC)

# Load Parts Plugins
Parts_Plugin_Path = ( os.environ['Parts_Maya'] + 'Plugins/')
RG_Plugs = File_Utils.findAllFiles(Parts_Plugin_Path, '.py')
for plug in RG_Plugs:
	print plug
	cmds.loadPlugin(Parts_Plugin_Path + plug+'.py')

# Create the menu
pmc = PMC.Parts_Menu()
pmc.createMenu()
