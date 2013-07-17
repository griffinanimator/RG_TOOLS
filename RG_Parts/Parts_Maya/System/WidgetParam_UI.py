import maya.cmds as cmds
import os
from functools import partial
import Utils.Utils_File as fileUtils
#NOTE: Remove this import!
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
        self.windowWidth = 380
        self.windowHeight = 120
        self.rowHeight = 40
        buttonWidth = 80
        buttonHeight = 22

        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Layout UI", sizeable=True)
        
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=True, width=self.windowWidth, height=self.windowHeight, bgc=[0.2, 0.2, 0.2])
        
        """ Button Row """
        cmds.separator( height=5, style='in' )
        self.UIElements["guiFlowLayout3"] = cmds.flowLayout(v=False, width=self.windowWidth, height=buttonHeight, bgc=[0.4, 0.4, 0.4], cs=10)
        cmds.setParent(self.UIElements["guiFlowLayout1"])

        """ Read from an external file to get the available widgets """
        import Utils.Utils_Csv as csvUtils
        reload(csvUtils)

        path = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs.csv'
        csvInfo = csvUtils.csvRead(path)
        cmds.separator( height=5, style='in' )
        self.UIElements["wsel_menu"] = cmds.optionMenu(label="Widgets", bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])
        for i in csvInfo:
            numItems = len(i[1])
            print numItems
            self.UIElements[i[0] + "_item"] = cmds.menuItem(label=i[0], ann=numItems)

        self.UIElements["side_menu"] = cmds.optionMenu(label="Side", bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])
        cmds.popupMenu( button=1 )
        menuItems = ('left', 'right', 'center')
        for i in menuItems:
            self.UIElements[i + "_item"] = cmds.menuItem(label=i)

        self.UIElements["untext_field"] = cmds.textField(tx="User Defined Name", width=buttonWidth+40, height=22, bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])


        """ Button Row 2 """
        cmds.separator( height=20, style='in' )
        self.UIElements["guiFlowLayout4"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.rowHeight, bgc=[0.4, 0.4, 0.4], cs=10)
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["create_button"] = cmds.button(label='Create', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"], command=self.createPart) 
        self.UIElements["edit_button"] = cmds.button(label='Edit', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"]) 
        self.UIElements["mirror_button"] = cmds.button(label='Mirror', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"])               
        cmds.showWindow(self.windowName)

    def createPart(self, *args):
        contained_nodes = []
        # Collect info from the UI to build part
        userDefinedName = cmds.textField(self.UIElements["untext_field"], q=True, text=True)

        menuItem = cmds.optionMenu(self.UIElements["wsel_menu"], q=True, v=True)
        print menuItem
        numParts = len(cmds.menuItem(self.UIElements[menuItem + "_item"], q=True, ann=True))
        print numParts

        partRoot = Utils_Part.rigNodeRoot(numParts, userDefinedName)
        contained_nodes.append(partRoot)
        parts = Utils_Part.rigNode(userDefinedName, numParts, partRoot)
        partsLen = len(parts)
        for p in range(len(parts)):  
            contained_nodes.append(parts[p])       
            if p < partsLen-1:
                partList = (parts[p], parts[p+1]) 
     
                partJoint = Utils_Part.createPJoints(partList)
                for j in partJoint:
                    contained_nodes.append(j)
                    # Set drawing overide on joints
                    cmds.setAttr(j + '.overrideEnabled', 1)
                    cmds.setAttr(j + '.overrideDisplayType', 1)
         
                ikHandleName = partJoint[0].replace('pjnt', 'ikh')
                ikInfo = Utils_Part.scStretchyIk(partList, partJoint, ikHandleName)
                for i in ikInfo[0]:
                    contained_nodes.append(i)

                # Connect ikHnadles, parts, and joints
                ptca =cmds.pointConstraint(partList[0], partJoint[0], mo=True)
                #cmds.connectAttr(partJoint[0] + '.rotate', partList[0] +'.rotateAxis')
                
                #cmds.parent(partJoint[0], partList[0])
                ptcb = cmds.pointConstraint(partList[1], ikInfo[0][0])

                contained_nodes.append(ptca[0])
                contained_nodes.append(ptcb[0])
            if p != 0:
                cmds.aimConstraint(parts[p], parts[p-1])

        # Cleanup nodes and add to a container.
        
        containerName = (userDefinedName+'_container')
        con1 = cmds.container(n=containerName)
        for i in contained_nodes:
            cmds.container(containerName, edit=True, addNode=i, inc=True, ish=True, ihb=True, iha=True)





