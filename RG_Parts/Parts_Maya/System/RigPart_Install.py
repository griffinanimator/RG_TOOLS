import maya.cmds as cmds
import os
from functools import partial
import json
import tempfile
import Utils.Utils_File as fileUtils
import Utils.Utils_JSON as utils_json
reload(utils_json)


class RigPart_Install:
          
    def __init__(self):
        print 'Install'
        arttools = os.environ["GTOOLS"]
        self.rigWtPath = arttools + "/RG_Parts/Parts_Maya/Widgets/Rigging/"
        self.part_data = {}



    def install(self, sel, *args):
        # NOTE: This could be done by selection or by an argument.
        print sel
        # Find the namespace of selected.
        tns = sel[0].partition(':')
        namespace = tns[0]+tns[1]  # Arm_L_01_:
        extractedName = namespace.partition('_')[0] # Arm
        ti = namespace.partition('_')[2] 
        instance = ti.replace(':', '') # L_01_
    
        for part in self.returnparts(self.rigWtPath):
            mod = __import__("Widgets.Rigging."+part, {}, {}, [part])
            reload(mod)
            title = mod.TITLE
            description = mod.DESCRIPTION
            classname = mod.CLASS_NAME
            print title
            print extractedName

            if title == extractedName:
                part == title
                print "The Part is "+part
                self.collectPartInfo(title)
                self.installPart(part, namespace, instance)


    def installPart(self, part, namespace, instance, *args):
        print "Install"
        mod = __import__("Widgets.Rigging."+part, {}, {}, [part])
        reload(mod)
           
        partClass = getattr(mod, mod.CLASS_NAME)
        partInstance = partClass()
        partInstance.install(self.part_data, namespace, instance, self.part_data)



    def returnparts(self, path, *args):
        # search the relative directory  for all available modules
        # Return a list of all module names (excluding the ".py" extension)
        allPyFiles = fileUtils.findAllFiles(path, ".py")
        
        returnModules = []
        
        for file in allPyFiles:
            if file != "__init__":
                returnModules.append(file)
                
        return returnModules


    def collectPartInfo(self, part, *args):

        # Read the JSON file and store data to dict
        filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
        data = utils_json.readJson(filename)
        info = json.loads( data )
        self.part_data = info[part]
        
        for key, value in self.part_data.iteritems() :
            print key, value 