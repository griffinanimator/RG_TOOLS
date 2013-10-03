import maya.cmds as cmds
import json
import tempfile
import Utils.Utils_JSON as utils_json
import System.LytPart_Install as lytInstall
reload(lytInstall)


# Define a path to the data file
filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
partInfo = {}
tmpDict = {}

"""
Leg
Arm
Root
Head
Clavicle
Spine
Finger
Chain
"""   
#This will run install

part = 'Leg'
# the part arg will be the name of the layout you want to build.
# dm is some extra name like the side "L" or "R".  If the dm exists, generate a new dm.
dm =  '_L_01_'
ns = part + dm 
mirror = 0
# Example call to install
lyi = lytInstall.Part_Install()
lyi.install(part, dm, ns, mirror)