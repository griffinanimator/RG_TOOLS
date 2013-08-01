import os
import sys
import pymel.core as pm
import maya.cmds as cmds
import maya.mel as mel

print "Loading Script Menu"

# Add the GTOOLS env variable to Maya's system path
if not os.environ['GTOOLS'] in sys.path:
	sys.path.append(os.environ['GTOOLS'])

# Add a pth to icons
os.environ['GTOOL_Icons']  = os.environ['GTOOLS'] + '/icons/'
if not os.environ['GTOOL_Icons'] in sys.path:
	sys.path.append(os.environ['GTOOL_Icons'])
print "Loading Icons"

def runScript(item, *args):
	print "Run Script"
	mel.eval(item)


def createMenu(items, *args):
    mi = cmds.window('MayaWindow', ma=True, q=True)
    for m in mi:
        if m == 'UserScripts':
            cmds.deleteUI('UserScripts', m=True)
           
    cmds.menu( 'UserScripts', label='UserScripts', to=True,  p="MayaWindow")
    
    for item in items:
    	print item
    	cmds.menuItem( label=item)




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
Script_Path = ( os.environ['GTOOLS'] + '/scripts')

allScriptFiles = []
pyFiles = findAllFiles(Script_Path, '.py')
for script in pyFiles:
	allScriptFiles.append(script)
melFiles = findAllFiles(Script_Path, '.mel')
for script in melFiles:
	allScriptFiles.append(script)
    try: 
        mel.eval(source script;)
    except: pass





createMenu(allScriptFiles)