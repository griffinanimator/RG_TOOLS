import maya.cmds as cmds
import os
from functools import partial
import Utils.Utils_File as fileUtils
#NOET: Remove this import!
import Utils.Utils_Part as Utils_Part
reload(Utils_Part)
class PartParam_UI:
          
    def __init__(self, *args):

        """ Create a dictionary to store UI elements """
        self.UIElements = {}
        
        """ Check to see if the UI exists """
        self.windowName = "PartParams"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """    
        self.windowWidth = 200
        self.windowHeight = 400
        self.rowHeight = 40
        buttonWidth = 100
        buttonHeight = 40

        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Window", sizeable=True)
        
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=True, width=self.windowWidth, height=self.windowHeight, bgc=[0.2, 0.2, 0.2])
       
        """ Edit and Create botton row """
        self.UIElements["guiFlowLayout2"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.rowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["edit_button"] = cmds.button(label="Edit", width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout2"])
        self.UIElements["createbutton"] = cmds.button(label="Create", width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout2"], command=self.createPart)

        """ Name Row """
        self.UIElements["guiFlowLayout3"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.rowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["name_text"] = cmds.textField(tx="Test", width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])


        """ NumParts Row """
        self.UIElements["guiFlowLayout4"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.rowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["num_text"] = cmds.intField( minValue=3, maxValue=10, step=1,  width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"])
                                        
        """ Orientation Row """
        self.UIElements["guiFlowLayout5"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.rowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["radio_grp1"] = cmds.radioButtonGrp( label='Orientation', labelArray3=['X', 'Y', 'Z'], width=110, numberOfRadioButtons=3, adj=1,  p=self.UIElements["guiFlowLayout5"] )

        """ Generate and Mirror Row """
        self.UIElements["guiFlowLayout6"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.rowHeight, bgc=[0.4, 0.4, 0.4])
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["generate_button"] = cmds.button(label="Generate", width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout6"])
        self.UIElements["mirror_button"] = cmds.button(label="Mirror", width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout6"])

        cmds.showWindow(self.windowName)

    def createPart(self, *args):
        # Collect info from the UI to build part
        userDefinedName = cmds.textField(self.UIElements["name_text"], q=True, text=True)

        numParts = cmds.intField(self.UIElements["num_text"], q=True, v=True)

        partRoot = Utils_Part.rigNodeRoot(numParts, userDefinedName)
        parts = Utils_Part.rigNode(userDefinedName, numParts, partRoot)

