import maya.cmds as cmds
import os
from functools import partial
import Utils.Utils_File as fileUtils
#NOTE: Remove this import!
import Utils.Utils_Part as Utils_Part
reload(Utils_Part)
import Utils.Utils as Utils
class PartParam_UI:
          
    def __init__(self, *args):
        """ Get information on the available widgets and store to a dictionary """
        self.csv_info = {}
        """ Read from an external file to get the available widgets """
        import Utils.Utils_Csv as csvUtils
        reload (csvUtils)

        path = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs.csv'
        csvInfo = csvUtils.csvRead(path)


        
        """ A bunch of crap to convert csv info to a usable state """
        tmpInfo = []

        for item in csvInfo:
            tmp = []
            for each in item[1]:
                tmp.append(each)

            tmpPos = []
            for index, value in enumerate(tmp):
                tmpPos.append([float(i) for i in value[0:len(value)].strip('[').strip(']').split(',')])
      
            tmpInfo.append([item[0], tmpPos])

        self.csv_info['partInfo'] = tmpInfo


        """ Create a dictionary to store UI elements """
        self.UIElements = {}
        
        """ Check to see if the UI exists """
        self.windowName = "PartParams"
        if cmds.window(self.windowName, exists=True):
            cmds.deleteUI(self.windowName)
        """ Define UI elements width and height """    
        self.windowWidth = 240
        self.windowHeight = 300
        self.rowHeight = 40
        buttonWidth = 80
        buttonHeight = 22

        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Layout UI", sizeable=True)
        
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.windowHeight, bgc=[0.2, 0.2, 0.2])
        cmds.separator( width=20, style='in', p=self.UIElements["guiFlowLayout1"] )
        
        """ Button Row """
        self.UIElements["guiFlowLayout3"] = cmds.flowLayout(v=False, width=self.windowWidth/2, height=self.windowHeight, bgc=[0.4, 0.4, 0.4], cs=10, wr=True)
        cmds.setParent(self.UIElements["guiFlowLayout1"])

        self.UIElements["wsel_menu"] = cmds.optionMenu(label="Widgets", bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])
        for i in range(len(self.csv_info['partInfo'])):
            self.UIElements[self.csv_info['partInfo'][i][0] + "_item"] = cmds.menuItem(self.csv_info['partInfo'][i][0])

        self.UIElements["side_menu"] = cmds.optionMenu(label="Side", bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])
        menuItems = ('l', 'r', 'c')
        for i in menuItems:
            self.UIElements[i + "_item"] = cmds.menuItem(label=i)

        self.UIElements["untext_field"] = cmds.textField(tx="User_Defined_Name", width=buttonWidth+40, height=22, bgc=[1.0, 1.0, 1.0],p=self.UIElements["guiFlowLayout3"])

        cmds.separator( width=20, style='in', p=self.UIElements["guiFlowLayout1"] )
        
        """ Button Row 2 """      
        self.UIElements["guiFlowLayout4"] = cmds.flowLayout(v=False, width=self.windowWidth/2, height=self.windowHeight, bgc=[0.4, 0.4, 0.4], cs=10, wr=True)
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["create_button"] = cmds.button(label='Create', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"], command=self.createPart) 
        self.UIElements["edit_button"] = cmds.button(label='Edit', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"]) 
        self.UIElements["mirror_button"] = cmds.button(label='Mirror', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"])               
        cmds.showWindow(self.windowName)

    def createPart(self, *args):
        contained_nodes = []
        """ Collect info from the UI to build part """
        un = cmds.textField(self.UIElements["untext_field"], q=True, text=True)

        menuItem = cmds.optionMenu(self.UIElements["wsel_menu"], q=True, v=True)
        for i in range(len(self.csv_info['partInfo'])):
            if self.csv_info['partInfo'][i][0] == menuItem:
                numParts = len(self.csv_info['partInfo'][i][1])
                selectedIndex = i

        side = cmds.optionMenu(self.UIElements["side_menu"], q=True, v=True)

        if un != 'User_Defined_Name':
            udn = un 
        else:
            udn = ''

        """ Check to see if this name exists """
        parts = cmds.ls(et='RG_PartRoot')

        # Create a number suffix
        num = str(Utils_Part.findHighestTrailingNumber(parts, 'PartRoot_Shape_'))

        userDefinedName = udn + menuItem + '_' + side + num

        pos = self.csv_info['partInfo'][selectedIndex][1][0]

        partRoot = Utils_Part.rigNodeRoot(numParts, userDefinedName, pos, num)
        contained_nodes.append(partRoot[0])
        contained_nodes.append(partRoot[1])

        pos = self.csv_info['partInfo'][selectedIndex][1]
        parts = Utils_Part.rigNode(userDefinedName, numParts, partRoot, pos, num)

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

                # Connect ikHandles, parts, and joints
                ptca =cmds.pointConstraint(partList[0], partJoint[0], mo=True)

                ptcb = cmds.pointConstraint(partList[1], ikInfo[0][0])

                contained_nodes.append(ptca[0])
                contained_nodes.append(ptcb[0])
                
            if p != 0:
                cmds.aimConstraint(parts[p], parts[p-1])

        # Cleanup nodes and add to a container.
        
        containerName = (userDefinedName+'_container_' + num)
        con1 = cmds.container(n=containerName)
        for i in contained_nodes:
            cmds.container(containerName, edit=True, addNode=i, inc=True, ish=True, ihb=True, iha=True)





