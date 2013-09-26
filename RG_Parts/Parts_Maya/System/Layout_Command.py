import maya.cmds as cmds
import json
import tempfile
import Utils.Utils_JSON as utils_json



# Define a path to the data file
filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
partInfo = {}
tmpDict = {}


import Widgets.Layout.LytPart_Install as LytPart_Install
reload(LytPart_Install)     
part = 'Spine'
# the part arg will be the name of the layout you want to build.
# dm is some extra name like the side "L" or "R".  If the dm exists, generate a new dm.
dm =  '_L_01_'
ns = part + dm

# Example call to install
LytPart_Install.install(part, dm, ns)