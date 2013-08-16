import maya.cmds as cmds
import Utils.Utils as Utils
reload(Utils)

class Utils_UI:
          
    def __init__(self):

        self.UIElements = {}
        
        self.windowName = "Utils_UI"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)

        self.windowWidth = 240
        self.windowHeight = 200
        buttonWidth = 100
        buttonHeight = 30


        self.UIElements["utils_window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Window", sizeable=True)
        
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=False, width=220, height=self.windowHeight, bgc=[0.2, 0.2, 0.2])

        self.UIElements["TempParentButton"] = cmds.button(label='TempParent', width=buttonWidth, height=buttonHeight, p=self.UIElements["guiFlowLayout1"], command=Utils.tempParent)       

        cmds.showWindow(self.windowName)


