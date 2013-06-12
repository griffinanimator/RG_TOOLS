import maya.cmds as cmds
import os
from functools import partial
import Utils.Utils_File as fileUtils


class Parts_UI:
          
    def __init__(self):

        """ Create a dictionary to store UI elements """
        self.UIElements = {}
        
        """ Check to see if the UI exists """
        self.windowName = "Window"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """    
        self.windowWidth = 240
        self.windowHeight = 200
        buttonWidth = 100
        buttonHeight = 30

        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Window", sizeable=True)
        
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=False, width=220, height=self.windowHeight, bgc=[0.2, 0.2, 0.2])
       
        """ Use a flow layout for the  UI """
        self.UIElements["guiFlowLayout2"] = cmds.flowLayout(v=True, width=110, height=self.windowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["guiFlowLayout3"] = cmds.flowLayout(v=True, width=110, height=self.windowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])

        arttools = os.environ["GTOOLS"]
        lytWtPath = arttools + "/RG_Parts/Parts_Maya/Widgets/Layout/"

        for widget in self.returnWidgets(lytWtPath):
            print widget
            mod = __import__("Widgets.Layout."+widget, {}, {}, [widget])
            reload(mod)

            title = mod.TITLE
            description = mod.DESCRIPTION
            classname = mod.CLASS_NAME

            cmds.separator(p=self.UIElements["guiFlowLayout2"])
            self.UIElements["module_button_"+widget] = cmds.button(label=title, width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout2"], command=partial(self.installWidget, widget))
 
        rigWtPath = arttools + "/RG_Parts/Parts_Maya/Widgets/Rigging/"
        
        for widget in self.returnWidgets(rigWtPath):
            print widget
            mod = __import__("Widgets.Rigging."+widget, {}, {}, [widget])
            reload(mod)

            title = mod.TITLE
            description = mod.DESCRIPTION
            classname = mod.CLASS_NAME

            cmds.separator(p=self.UIElements["guiFlowLayout3"])
            self.UIElements["module_button_"+widget] = cmds.button(label=title, width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout3"], command=partial(self.installWidget, widget))       

            """ Show the window"""
        
 
        cmds.showWindow(self.windowName)

    def installWidget(self, widget, *args):
        mod = __import__("Widgets.Layout."+widget, {}, {}, [widget])
        reload(mod)
        
        widgetClass = getattr(mod, mod.CLASS_NAME)
        widgetInstance = widgetClass()
        print widgetClass
        widgetInstance.install()


    def returnWidgets(self, path, *args):
        # search the relative directory  for all available modules
        # Return a list of all module names (excluding the ".py" extension)
        allPyFiles = fileUtils.findAllFiles(path, ".py")
        
        returnModules = []
        
        for file in allPyFiles:
            if file != "__init__":
                returnModules.append(file)
                
        return returnModules

