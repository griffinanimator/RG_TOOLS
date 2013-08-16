import os
import sys
import pymel.core as pm
import maya.cmds as cmds
try:
	import maya, PMT
	import PET.Rig
except: pass


sys.path.append(os.environ['GTOOLS'])

startup = pm.evalDeferred('import RG_Parts.Parts_Maya.startup')

import Red9
Red9.start()

sys.path.append('C:/Users/rgriffin/Documents/GitHub/CGMonks/mayaTools/')
