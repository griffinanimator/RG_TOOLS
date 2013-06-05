import os
import sys
import maya.cmds as cmds
import RG_Parts.Parts_Maya.System.Parts_UI as Parts_UI
import RG_Parts.Parts_Maya.System.utils as utils

class Parts_Menu():

    def createMenu(self, *args):
        mi = cmds.window('MayaWindow', ma=True, q=True)
        for m in mi:
            if m == 'parts':
                cmds.deleteUI('parts', m=True)
               
        cmds.menu( 'parts', label='Parts', to=True,  p="MayaWindow")
        
        cmds.menuItem( label='RigNodeUI', c=self.load_rigNodeUi)
        cmds.menuItem( label='PartsUI', c=self.load_partsUi)

    def load_rigNodeUi(self, *args):
        IconPath = os.environ['Parts_Maya_Icons']
        """ Create a dictionary to store UI elements """
        UIElements = {}
        """ Check to see if the UI exists """
        windowName = "RigNodeUI"
        if cmds.window(windowName, exists=True):
            cmds.deleteUI(windowName)
        """ Define UI elements width and height """    
        windowWidth = 120
        windowHeight = 200
        buttonWidth = 100
        buttonHeight = 100

        """ Define a window"""
        cmds.window(windowName, width=windowWidth, height=windowHeight, title="Window", sizeable=True)
       
        """ Use a flow layout for the  UI """
        UIElements["buttonFlowLayout"] = cmds.flowLayout(v=True, width=110, height=windowHeight, bgc=[0.4, 0.4, 0.4])
        # Make rigNode Button
        cmds.symbolButton(width=buttonWidth, height=buttonHeight, image=IconPath+'RigNode.png', command=self.rigNode)
        cmds.setParent(UIElements["buttonFlowLayout"])

        """ Show the window"""
        cmds.showWindow(windowName)

    def rigNode(self, *args):
        # Find all the existing RG_Part nodes in the scene
        parts = cmds.ls(et='RG_Part')
        # Create a number suffix
        num = str(utils.findHighestTrailingNumber(parts, 'RG_Part'))
        # Create a transform
        tform = cmds.createNode('transform', name='RG_Part_' + num)
        # Create an RG_Part node and parent to the transform
        rNode = cmds.createNode ('RG_Part', n='RG_Part_Shape_' + num, p=tform)
        cmds.select(d=True)

    def load_partsUi(self, *args):
        import System.Parts_UI as Parts_UI
        ui = Parts_UI.Parts_UI()