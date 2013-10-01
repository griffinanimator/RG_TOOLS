import maya.cmds as cmds
import json
import tempfile
import Utils.Utils_JSON as utils_json
reload(utils_json)
import time

"""
# Define a path to the data file
filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
partInfo = {}
tmpDict = {}


import Widgets.Layout.LytPart_Install as LytPart_Install
reload(LytPart_Install)  
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
part = 'Spine'
# the part arg will be the name of the layout you want to build.
# dm is some extra name like the side "L" or "R".  If the dm exists, generate a new dm.
dm =  '_C_01_'
ns = part + dm

# Example call to install
LytPart_Install.install(part, dm, ns)
"""

def mirror(*args):
	cmds.namespace(set=':')

	# NOTE: This could be done by selection or by an argument.
    print sel
    # Find the namespace of selected.
    tns = sel[0].partition(':')
    namespace = tns[0]+tns[1]  # Arm_L_01_:
    extractedName = namespace.partition('_')[0] # Arm
    ti = namespace.partition('_')[2] 
    instance = ti.replace(':', '') # L_01_
    """
    for part in self.returnparts(self.rigWtPath):
        mod = __import__("Widgets.Rigging."+part, {}, {}, [part])
        reload(mod)
        title = mod.TITLE
        description = mod.DESCRIPTION
        classname = mod.CLASS_NAME

        if title == extractedName:
            part == title
            print "The Part is "+part
            self.collectPartInfo(title)
            self.installPart(part, namespace, instance)
	"""      