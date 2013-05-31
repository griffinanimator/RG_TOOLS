import os
import sys
from functools import partial
import pymel.core as pm
import maya.cmds as cmds
import maya.mel as mel

print "Loading my Kickass Tools"

# Add more paths to make it easier to get to tools
os.environ['Parts_Maya']  = os.environ['GTOOLS'] + 'RG_Tools/RG_Parts/Parts_Maya/'

if not os.environ['Parts_Maya'] in sys.path:
	sys.path.append(os.environ['Parts_Maya'])

os.environ['Parts_Maya_Icons']  = os.environ['GTOOLS'] + 'RG_Tools/RG_Parts/Parts_Maya/Icons/'

if not os.environ['Parts_Maya_Icons'] in sys.path:
	sys.path.append(os.environ['Parts_Maya_Icons'])

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




def findAllFiles(fileDirectory, fileExtension):
    # Return a list of all file names, excluding the file extension
    allFiles = os.listdir(fileDirectory)
    
    # Refine all files, listing only those of the specified file extension
    returnFiles = []
    for f in allFiles:
        splitString = str(f).rpartition(fileExtension)
        
        if not splitString[1] == "" and splitString[2] == "":
            returnFiles.append(splitString[0])

    return returnFiles

# Define the path to the scripts
Script_Path = ( os.environ['GTOOLS'] + '/RG_Tools/scripts')

allScriptFiles = []
pyFiles = findAllFiles(Script_Path, '.py')
for script in pyFiles:
	allScriptFiles.append(script)
melFiles = findAllFiles(Script_Path, '.mel')
for script in melFiles:
	allScriptFiles.append(script)


createMenu(allScriptFiles)

print "Done Loading User Scripts"


# Load Setting
print "Trying to load settings"
#startup = pm.evalDeferred('import RG_Tools.RG_Parts.Parts_Maya.settings')