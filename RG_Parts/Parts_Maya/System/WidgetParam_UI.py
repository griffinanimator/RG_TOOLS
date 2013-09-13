import maya.cmds as cmds
import os
import json
import tempfile
from functools import partial
import Utils.Utils_File as fileUtils
#NOTE: Remove this import!
import Utils.Utils_Part as Utils_Part
reload(Utils_Part)
import Utils.Utils as Utils
import Utils.Utils_JSON as Utils_Json

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
        self.windowWidth = 280
        self.windowHeight = 300
        self.rowHeight = 40
        buttonWidth = 80
        buttonHeight = 22

        """ Define a window"""
        self.UIElements["window"] = cmds.window(self.windowName, width=self.windowWidth, height=self.windowHeight, title="Layout UI", sizeable=True)
        
        self.UIElements["guiFlowLayout1"] = cmds.flowLayout(v=False, width=self.windowWidth, height=self.windowHeight, bgc=[0.2, 0.2, 0.2])
        cmds.separator( width=20, style='in', p=self.UIElements["guiFlowLayout1"] )
        
        """ Button Row 1"""
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
       
        #self.UIElements["parenttext_field"] = cmds.textFieldButtonGrp( label='Parent', pht='Parent Part', buttonLabel='<', adj=2, cw=[3, 20], w=110, p=self.UIElements["guiFlowLayout3"] )
        self.UIElements["parent_button"] = cmds.button(label='< Parent', width=buttonWidth+40, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout3"], command=self.chooseParentLink) 
        self.UIElements["child_button"] = cmds.button(label='< Child', width=buttonWidth+40, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout3"], command=self.chooseChildLink)
        self.UIElements["link_button"] = cmds.button(label='Make Link', width=buttonWidth+40, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout3"], command=self.makePartLink)

        self.UIElements["savelyt_button"] = cmds.button(label='Save_Layout', width=buttonWidth+40, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout3"], command=self.saveCharacterLayout) 
        self.UIElements["loadlyt_button"] = cmds.button(label='Load_Layout', width=buttonWidth+40, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout3"], command=self.loadCharacterLayout)   
        #self.UIElements["childtext_field"] = cmds.textFieldButtonGrp( label='Child', pht='Child Part', buttonLabel='<', adj=2, cw=[3, 20], w=110, p=self.UIElements["guiFlowLayout3"] )
        cmds.separator( width=20, style='in', p=self.UIElements["guiFlowLayout1"] )
        
        """ Button Row 2 """      
        self.UIElements["guiFlowLayout4"] = cmds.flowLayout(v=False, width=self.windowWidth/2, height=self.windowHeight, bgc=[0.4, 0.4, 0.4], cs=10, wr=True)
        cmds.setParent(self.UIElements["guiFlowLayout1"])
        self.UIElements["create_button"] = cmds.button(label='Create', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"], command=self.createPart) 
        self.UIElements["edit_button"] = cmds.button(label='Edit', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"]) 
        self.UIElements["mirror_button"] = cmds.button(label='Mirror', width=buttonWidth, height=buttonHeight, bgc=[1.0, 1.0, 1.0], p=self.UIElements["guiFlowLayout4"], command=self.mirrorWidget)               
        cmds.showWindow(self.windowName)

    def createPart(self, *args):
        # TODO: Add stuff to namespaces.
        # First check to see if a master widget container exists.  If not, create one.
        MasterWidgetContainerName = 'Master_Widget_Container'
        if cmds.objExists(MasterWidgetContainerName) == False:
            masterWidgetContainer = cmds.container(n=MasterWidgetContainerName)

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

        userDefinedName = udn + menuItem + '__' + side + num

        pos = self.csv_info['partInfo'][selectedIndex][1][0]

        partRoot = Utils_Part.rigNodeRoot(numParts, userDefinedName, pos, num)
        contained_nodes.append(partRoot[0])
        contained_nodes.append(partRoot[1])

        pos = self.csv_info['partInfo'][selectedIndex][1]

        parts = Utils_Part.rigNode(userDefinedName, numParts, partRoot, pos, num)

        partsLen = len(parts)

        # Setup joints and stretchy ik
        pjntList = []
        for p in range(len(parts)):  
            contained_nodes.append(parts[p])  
                
            if p < partsLen-1:
                partList = (parts[p], parts[p+1]) 
     
                partJoint = Utils_Part.createPJoints(partList)
                pjntList.append(partJoint[0])
                for j in partJoint:
                    contained_nodes.append(j)
                    # Set drawing overide on joints
                    cmds.setAttr(j + '.overrideEnabled', 1)
                    cmds.setAttr(j + '.overrideDisplayType', 1)

                """
                ikHandleName = partJoint[0].replace('pjnt', 'ikh')
                ikInfo = Utils_Part.scStretchyIk(partList, partJoint, ikHandleName)
                for i in ikInfo[0]:
                    contained_nodes.append(i)
                """

                # Connect ikHandles, parts, and joints
                ptca =cmds.pointConstraint(partList[0], partJoint[0], mo=True)
                ptcb =cmds.pointConstraint(partList[1], partJoint[1], mo=True)

                #ptcb = cmds.pointConstraint(partList[1], ikInfo[0][0])

                contained_nodes.append(ptca[0])
                contained_nodes.append(ptcb[0])
                
            if p != 0:
                cmds.aimConstraint(parts[p], parts[p-1])
        
        # Cleanup nodes and add to a container.

        jntGrpName = partRoot[1].replace('PartRoot', 'PartJoints')
        jntGrp = cmds.group(n=jntGrpName, em=True)
        pgPos = cmds.xform(partRoot[1], q=True, ws=True, t=True)
        cmds.xform(jntGrp, ws=True, t=pgPos)

        for jnt in pjntList:
            cmds.parent(jnt, jntGrp)

        containerName = ('Part_Container_' + num + '_' + userDefinedName)
        con1 = cmds.container(n=containerName)
        cmds.addAttr(con1, shortName='ParentLink', longName='ParentLink', dt='string')
        cmds.addAttr(con1, shortName='ChildLink', longName='ChildLink', dt='string')

        for i in contained_nodes:
            cmds.container(containerName, edit=True, addNode=i, inc=True, ish=True, ihb=True, iha=True)

        cmds.container('Master_Widget_Container', edit=True, addNode=containerName, inc=True, ish=True, ihb=True, iha=True)


    def mirrorWidget(self, *args):
        print "Mirror Widget"
        mirror_contained_nodes = []

        # Selected part in var
        selPart = cmds.ls(sl=True, type='transform')

        # Get the part group
        partParent = cmds.listRelatives(selPart[0], p=True)
        
        partChildren = cmds.listRelatives(selPart, c=True, type='transform')

        # Define the mirrored naming prefix
        tmpItemA = selPart[0].partition('PartRoot_')[2]
        tmpItemB = tmpItemA.partition('_')
        userDefinedName = tmpItemB[2]

        instanceName =  userDefinedName.partition('__')[2]

        mirrorUserDefinedName = 'c'
        if instanceName.startswith('l') == True:
            mirrorUserDefinedName = userDefinedName.replace('__l', '__r')
        if instanceName.startswith('r') == True:
            mirrorUserDefinedName = userDefinedName.replace('__r', '__l')

        #newPartGrpName = partParent[0].replace(userDefinedName, mirrorUserDefinedName)
        #mirrorPart = cmds.duplicate(partParent[0], n=newPartGrpName, rc=True, un=False, ic=False, po=True)

        parts = cmds.ls(et='RG_PartRoot')
        numParts = len(partChildren)
        pos = cmds.xform(selPart, q=True, ws=True, t=True)

        num = str(Utils_Part.findHighestTrailingNumber(parts, 'PartRoot_Shape_'))
        
        partRoot = Utils_Part.rigNodeRoot(numParts, mirrorUserDefinedName, pos, num)
        mirrorPartGrp = partRoot[1]

        posList = []
        for item in partChildren:
            pos = cmds.xform(item, q=True, ws=True, t=True)
            posList.append(pos)
        parts = Utils_Part.rigNode(mirrorUserDefinedName, numParts, partRoot, posList, num)

        pjntList = []
        partsLen = len(parts)
        for p in range(len(parts)):
            mirror_contained_nodes.append(parts[p])  
                
            if p < partsLen-1:
                partList = (parts[p], parts[p+1]) 
     
                partJoint = Utils_Part.createPJoints(partList)
                pjntList.append(partJoint[0])
                for j in partJoint:
                    mirror_contained_nodes.append(j)
                    # Set drawing overide on joints
                    cmds.setAttr(j + '.overrideEnabled', 1)
                    cmds.setAttr(j + '.overrideDisplayType', 1)

                # Connect ikHandles, parts, and joints
                ptca =cmds.pointConstraint(partList[0], partJoint[0], mo=True)
                ptcb =cmds.pointConstraint(partList[1], partJoint[1], mo=True)

                mirror_contained_nodes.append(ptca[0])
                mirror_contained_nodes.append(ptcb[0])

            if p != 0:
                cmds.aimConstraint(parts[p], parts[p-1])
        
        # Cleanup nodes and add to a container.

        mirrorJntGrpName = partRoot[1].replace('PartRoot', 'PartJoints')
        mirrorJntGrp = cmds.group(n=mirrorJntGrpName, em=True)
        pgPos = cmds.xform(partRoot[1], q=True, ws=True, t=True)
        cmds.xform(mirrorJntGrp, ws=True, t=[0.0, pgPos[1], pgPos[2]])

        # Negative scale on new groups for mirroring
        originalScale = cmds.xform(partParent[0], q=True, s=True)[0]
        
        cmds.scale(-originalScale, mirrorPartGrp, x=True)

        cmds.scale(-originalScale, mirrorJntGrpName, x=True)

        for jnt in pjntList:
            cmds.parent(jnt, mirrorJntGrp)

        containerName = ('Part_Container_' + num + '_' + mirrorUserDefinedName)
        con1 = cmds.container(n=containerName)
        cmds.addAttr(con1, shortName='ParentLink', longName='ParentLink', dt='string')
        cmds.addAttr(con1, shortName='ChildLink', longName='ChildLink', dt='string')

        for i in mirror_contained_nodes:
            cmds.container(containerName, edit=True, addNode=i, inc=True, ish=True, ihb=True, iha=True)
        cmds.container('Master_Widget_Container', edit=True, addNode=containerName, inc=True, ish=True, ihb=True, iha=True)

    def chooseParentLink(self, *args):
        sel = cmds.ls(sl=True, type='transform')
        cmds.button(self.UIElements["parent_button"], edit=True, l=sel[0])
 
    def chooseChildLink(self, *args):
        sel = cmds.ls(sl=True, type='transform')
        cmds.button(self.UIElements["child_button"], edit=True, l=sel[0])

    def makePartLink(self, *args):
        node = cmds.button(self.UIElements["child_button"], q=True, label=True)
        partContainer = self.findPartContainer(node)
        parent = cmds.button(self.UIElements["parent_button"], q=True, label=True)
        cmds.setAttr(partContainer + '.ParentLink', parent, type='string')
        cmds.setAttr(partContainer + '.ChildLink', node, type='string')

    def findPartContainer(self, node, *args):
        if node == None:
            return
        print node
        partNodes = cmds.ls(et='RG_Part')
        shapeNode = cmds.listRelatives(node, c=True, s=True)[0]   
        return cmds.container(q=True, fc=shapeNode)

    """
    def saveCharacterLayout(self, *args):
        widgetContainers = []
        partNodes = cmds.ls(et='RG_PartRoot')
        
        for node in partNodes:
            transformNode = cmds.listRelatives(node, p=True)[0]   
            widgetContainers.append(self.findPartContainer(transformNode))

        print widgetContainers
    """

    def saveCharacterLayout(self, *args):
        # Temporary path for testing
        filename = '//samba/artist/RGriffin/Assets/Flynn/CharacterData'
        widget_info = {}

        containers = cmds.ls(et='container')  

        for c in containers:
            tmpWI_list = {}

            containedNodes = cmds.container(c, q=True, nl=True)
            # If the container is not the Master Container, get parent and child attrs
            if c != 'Master_Widget_Container':            
                plAttr = cmds.getAttr(c + '.ParentLink')
                clAttr = cmds.getAttr(c + '.ChildLink')

                # Find the userDefinedName
                # NOTE:  This should be a function
                tn = c.partition('Part_Container_')[2]
                partName = tn.partition('_')[2]

                tmpWI_list['plAttr'] = plAttr
                tmpWI_list['clAttr'] = clAttr
                tmpWI_list['part'] = c
                tmpWI_list['nodes'] = containedNodes

        widget_info[partName] = tmpWI_list

        Utils_Json.writeJson(filename, widget_info)


    def loadCharacterLayout(self, *args):
        filename = '//samba/artist/RGriffin/Assets/Flynn/CharacterData'

        data = Utils_Json.readJson(filename)
        print json.loads( data )
        lctrInfo = json.loads( data )


        for key, value in lctrInfo.iteritems() :
            print key, value



