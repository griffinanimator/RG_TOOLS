import os
import sys
from functools import partial
import pymel.core as pm
import maya.cmds as cmds
import maya.mel as mel
import Utils.Utils_File as fileUtils

print "Loading my Kickass Tools"

# Add more paths to make it easier to get to tools
os.environ['Parts_Maya']  = os.environ['GTOOLS'] + '//RG_Parts/Parts_Maya/'

if not os.environ['Parts_Maya'] in sys.path:
	sys.path.append(os.environ['Parts_Maya'])

os.environ['Parts_Maya_Icons']  = os.environ['GTOOLS'] + 'RG_Tools/RG_Parts/Parts_Maya/Icons/'

if not os.environ['Parts_Maya_Icons'] in sys.path:
	sys.path.append(os.environ['Parts_Maya_Icons'])

os.environ['Parts_Maya_Controls']  = os.environ['GTOOLS'] + '//RG_Parts/Parts_Maya/Controls/'

if not os.environ['Parts_Maya_Controls'] in sys.path:
    sys.path.append(os.environ['Parts_Maya_Controls'])

"""
# Path to animPicker
os.environ['Anim_Picker']  = 'C:/Users/rgriffin/Documents/GitHub/anim_picker/'
if not os.environ['Anim_Picker'] in sys.path:
    sys.path.append(os.environ['Anim_Picker'])
"""

# Path to MG_Tools
os.environ['MG_Tools']  = 'C:/Users/rgriffin/Documents/GitHub/RG_ARTTOOLS/MG_Tools/'
if not os.environ['MG_Tools'] in sys.path:
    sys.path.append(os.environ['MG_Tools'])

# Load the scripts menu ##########################################################
print "Loading Script Menu"
def runScript(item, *args):
    print item
    mel.eval("%s" %item)

def createMenu(items, *args):
    mi = cmds.window('MayaWindow', ma=True, q=True)
    for m in mi:
        if m == 'UserScripts':
            cmds.deleteUI('UserScripts', m=True)
           
    cmds.menu( 'UserScripts', label='UserScripts', to=True,  p="MayaWindow")
    
    for item in items:
    	cmds.menuItem( label=item, c=partial(runScript, item))

# Define the path to the scripts
Script_Path = ( os.environ['GTOOLS'] + '/scripts')

allScriptFiles = []
pyFiles = fileUtils.findAllFiles(Script_Path, '.py')
for script in pyFiles:
	allScriptFiles.append(script)
melFiles = fileUtils.findAllFiles(Script_Path, '.mel')
for script in melFiles:
	allScriptFiles.append(script)


createMenu(allScriptFiles)

print "Done Loading User Scripts"


# Load Setting
print "Trying to load settings"
startup = pm.evalDeferred('import RG_Parts.Parts_Maya.settings')