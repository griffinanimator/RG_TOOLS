import os
import sys
import pymel.core as pm
import maya.cmds as cmds


sys.path.append(os.environ['GTOOLS'])

startup = pm.evalDeferred('import startup')