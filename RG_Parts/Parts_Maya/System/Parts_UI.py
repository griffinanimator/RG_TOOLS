import maya.cmds as cmds
import os
from functools import partial


class Parts_UI:
          
    def __init__(self):

        """ Create a dictionary to store UI elements """
        self.UIElements = {}
        
        """ Check to see if the UI exists """
        self.windowName = "Window"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """    
        self.windowWidth = 120
        self.windowHeight = 200
        buttonWidth = 100
        buttonHeight = 30

        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Window", sizeable=True)
        
        self.UIElements["rowColumnLayout"] = cmds.rowColumnLayout( numberOfColumns=1, columnWidth=[(1, 120)], cs=[2, 10] )
       
        """ Use a flow layout for the  UI """
        self.UIElements["guiFlowLayout"] = cmds.flowLayout(v=True, width=110, height=self.windowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["rowColumnLayout"])

        arttools = os.environ["GTOOLS"]
        widgetPath = arttools + "/RG_Tools/RG_Parts/Parts_Maya/Widgets/"

        for widget in self.returnWidgets(widgetPath):
            mod = __import__("Widgets."+widget, {}, {}, [widget])
            reload(mod)

            title = mod.TITLE
            description = mod.DESCRIPTION
            classname = mod.CLASS_NAME

            cmds.separator(p=self.UIElements["guiFlowLayout"])
            self.UIElements["module_button_"+widget] = cmds.button(label=title, width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout"], command=partial(self.installWidget, widget))

        """ Show the window"""
        cmds.showWindow(self.windowName)

    def installWidget(self, widget, *args):
        mod = __import__("Widgets."+widget, {}, {}, [widget])
        reload(mod)
        
        widgetClass = getattr(mod, mod.CLASS_NAME)
        widgetInstance = widgetClass()
        print widgetClass
        widgetInstance.install()


    def returnWidgets(self, path, *args):
        # search the relative directory  for all available modules
        # Return a list of all module names (excluding the ".py" extension)
        allPyFiles = self.findAllFiles(path, ".py")
        
        returnModules = []
        
        for file in allPyFiles:
            if file != "__init__":
                returnModules.append(file)
                
        return returnModules

    def findAllFiles(self, fileDirectory, fileExtension, *args):
        # Return a list of all file names, excluding the file extension
        print fileDirectory
        allFiles = os.listdir(fileDirectory)
        
        # Refine all files, listing only those of the specified file extension
        returnFiles = []
        for f in allFiles:
            splitString = str(f).rpartition(fileExtension)
            
            if not splitString[1] == "" and splitString[2] == "":
                returnFiles.append(splitString[0])

        return returnFiles