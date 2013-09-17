import os
import maya.cmds as cmds
from functools import partial

#import System.characterInstall as install
#reload (install)

import System.turbineSpecificUtils as turbineUtils

import csv

import tap.core.maya.animation as animation

# Used to attach geometry

class skinning_Tools:
    def __init__(self):
        self.characterName = turbineUtils.getCharacterInfo()[0]
        self.fullCharName = turbineUtils.getCharacterInfo()[2]
        
        
    def attachGeo_UI(self):
        
        # store UI elements in a dictionary
        self.UIElements = {}
        
        if cmds.window("attachGeo_UI_window", exists=True):
            cmds.deleteUI("attachGeo_UI_window")
            
        windowWidth = 200
        windowHeight = 200
        
        self.UIElements["window"]= cmds.window("attachGeo_UI_window", width=windowWidth, height=windowHeight, title="Attach Geometry UI", sizeable = False)
        
        # Create UI elements
        self.UIElements ["topLevelColumn"] = cmds.columnLayout(adjustableColumn=True, columnAlign = "center")
        
        # Buttons
        cmds.setParent(self.UIElements["topLevelColumn"])
        self.UIElements["skinSaveColumn"] = cmds.columnLayout(adj=True, columnAlign="center", rs=3)
        
        cmds.separator()
        
        self.UIElements["skinBtn"] = cmds.button(label="Skin", c=self.attachWithSkinning )
        
        self.UIElements["editBtn"] = cmds.button(label="Edit Mode Off", c=self.editModeToggle )
       
        cmds.separator()
        # Display Window
        cmds.showWindow(self.UIElements["window"])
        

      
    def attachWithParenting(self):
        self.parenting = True
        self.skinning = False
        self.processInitialSelection()
        
    def attachWithSkinning(self, *args):
        self.skinning = True
        self.parenting = False
        self.processInitialSelection()
        
    def processInitialSelection(self):
        selection = cmds.ls(selection=True)
        
        setupContents = []
        
        geometry = self.findGeometry(selection)
        
        characterContainer = turbineUtils.getCharacterInfo()[1]
        characterName = turbineUtils.getCharacterInfo()[0]
        # exportName will define the name of the export node and can also be used 
        # for the namespace the export node resides in
        
        setupNode = turbineUtils.getCharacterInfo()[3]

        # Use the joint class to identify the joints in the scene
        import System.jointUtils as jntUtils
        
        joint = jntUtils.gameJoint_Utils()
        gameJoints = joint.getGameJoints()
        
        geoNode = ("Geometry")
        
        if geometry == None:
            cmds.headsUpMessage("please select the geometry you wish to attach to the specified blueprint joint.")
        else:      
            self.doSkin(geometry, gameJoints, geoNode, setupNode) 
       
        return (geometry, characterContainer, characterName, gameJoints, geoNode, setupNode)
        
        
    def findGeometry(self, selection):
        selection = cmds.ls(selection, transforms=True)
        
        nonJointSelection = []
        for node in selection:
            if not cmds.objectType(node, isType="joint"):
                nonJointSelection.append(node)
                
        if len(nonJointSelection) > 0:
            return nonJointSelection
        else:
            return None
        
    def findGameJoints(self, setupContents):
        if len(setupContents) > 0:
            return setupContents
        else:
            return None
             
    
    def doSkin(self, geometry, gameJoints, geoNode, setupNode):
        # Set the namespace to the export namespace
        characterName = turbineUtils.getCharacterInfo()[0]
        
        exportName = turbineUtils.getCharacterInfo()[3]
        
        cmds.namespace(set=":")
        
        # Create a geometry container

        if cmds.objExists(geoNode):
            print "Geo node exists"
        else:
            geoGrp = cmds.group(n=geoNode, empty=True)
            cmds.setAttr("Geometry.overrideEnabled", 1)

        cmds.lockNode(setupNode, lock=False, lockUnpublished=False)
        try:     
            """ Publish the displayType attribute to the setup container """
            cmds.container(setupNode, edit=True, publishAndBind=["Geometry.overrideDisplayType", "GeoDisplay"]) 
        except: print 'Attribute exists'
            
        for geo in geometry:
            cmds.select(d=True)
            import maya.mel as mel
            
            cmds.select(gameJoints, geo)
            
            """ I need to find out if the skin cluster exists.  If so, index the name +1"""
            skinClusterName = (geo+"_skinCluster")                
            skinClust = cmds.skinCluster(gameJoints, geo, tsb=True, maximumInfluences=4, omi=True, rui=False, sm=0, normalizeWeights=1, n=skinClusterName)
            try:
                cmds.parent(geo, geoNode)
            except: pass
            try:
                cmds.container(setupNode, edit=True, addNode=geoGrp, inc=True, ihb=True, it=True, ish=True, isd=True)
            except: pass           
            
        #cmds.lockNode(setupNode, lock=True, lockUnpublished=True)
        # Set the namespace back to default
        cmds.namespace(set=":")
        
        
    def editModeToggle(self, *args):

        setupNode = turbineUtils.getCharacterInfo()[3]
   
        labelVal = cmds.button(self.UIElements["editBtn"], q=True, l=True )
        if labelVal == "Edit Mode On":
            cmds.button(self.UIElements["editBtn"], edit=True, l="Edit Mode Off" )
            cmds.lockNode(setupNode, lock=True, lockUnpublished=True)
                
        else:
            cmds.button(self.UIElements["editBtn"], edit=True, l="Edit Mode On" )
            cmds.lockNode(setupNode, lock=False, lockUnpublished=False)
   
   
    def saveSkinWeights(self, *args):
        ''' This next block is used to define the path where the weights will be saved.
        I plan on putting this in the __init__ once I am done testing '''
        print "saving weights"
        
        try:
            character = cmds.ls(sl=True)[0]
        except:
            cmds.headsUpMessage("Please Select Valid Geometry")
            return
        weights = animation.Weights()
        

        # Define the file name and path
        characterName = self.characterName 
        skinPath = turbineUtils.setupDirs(characterName, create=False)[4]
        outFileSuffix = '_skinWeight.csv'
        outFile = (character + outFileSuffix )
        finalPath = (skinPath + outFile)
        
        """ Delete the skin file if one already exists """
        if cmds.file(finalPath, q=True, ex=True):
            os.remove(finalPath)
                
        # Select the character here, then use GetValidSkinWeights to grab vert info.

        for char in Weights.getValidSkinWeights():
            vert = char[0]
        
            jointInfo = char[1]
            for each in jointInfo:
                joint = each[0]
                tmpWeight = each[1]

                weight = str("%.2f" % tmpWeight)
                weight = float(weight)

                value = (vert, joint, weight)
                   
                writer = csv.writer(open(finalPath, "a"))                
                writer.writerow(value)
        """ I need to make sure the file closes here """            
        # Close the file
        #file.close(finalPath)
        
         # Get the user name and inform the user the weights have been saved        
        currentUser = getUser()        
        niceName = (currentUser)[1]
        cmds.headsUpMessage("The weight file has been saved to " + finalPath)

       
    def loadSkinWeights(self, *args):
        import maya.mel as mel
        
        try:
            character = cmds.ls(sl=True)[0]
        except:
            cmds.headsUpMessage("Please Select Valid Geometry")
            return

        
        # Define the file name and path
        characterName = self.characterName
        skinPath = turbineUtils.setupDirs(characterName, create=False)[4]
        outFileSuffix = '_skinWeight.csv'
        outFile = (character + outFileSuffix )
        finalPath = (skinPath + outFile)

        missingJoints = []
        allCV = []
        if cmds.file(finalPath, q=True, ex=True):
            reader = csv.reader(open(finalPath, 'rb'), delimiter=' ', quotechar='|')
        else:
            return
        
        # Find the skin cluster
        selection= cmds.ls(sl=True, fl=True)
        mel.eval("$selectionList = `ls -sl`")
        skCl = mel.eval('findRelatedSkinCluster $selectionList[0]')
    
        for row in reader:
            if row not in allCV:
                allCV.append(row)
                
        for cv in allCV:
            splitString1 = cv[0].partition(",")
            vert =  splitString1[0]
            splitString2 = splitString1[2].partition(",")
            joint = splitString2[0]
            value = float(splitString2[2])
        
            
            if cmds.objExists(joint):
                cmds.skinPercent( skCl, vert, transformValue=[(joint, value)])
            else:
                missingJoints.append(joint)
                
        """ Normalize the weights """
        cmds.skinPercent(skCl, normalize=True)
        
        if len(missingJoints) == 0:  
            cmds.headsUpMessage("The weight has been loaded from " + finalPath)
        else:
            cmds.headsUpMessage("Influences are missing.  Please view the script editor for details.")
            print "These influences do not exist"
            for joint in missingJoints:
                print joint











import maya.cmds as mc
import maya.mel as mel



class Skin_Utils():

    def __init__(self):
        """ Create a dictionary to store UI elements """
        self.UIElements = {}

        """ Check to see if the UI exists """
        self.windowName = "skinUtils"
        if mc.window(self.windowName, exists=True):
            mc.deleteUI(self.windowName)

        """ Define UI elements width and height """
        self.windowWidth = 380
        self.windowHeight = 300
        buttonWidth = 110
        buttonHeight = 20


        """ Define a window"""
        self.UIElements["mk_skinUtils"] = mc.window(self.windowName, width=self.windowWidth, height=self.windowHeight,
            title="mk_skinUtils", sizeable=True, mxb=False, mnb=False, menuBar=True)
        
        """ Make a menu bar """
        self.UIElements['menu'] = mc.menu( label='File', tearOff=False )
        mc.menuItem( label='Export Weights', c=self.saveSkin )
        mc.menuItem( label='Import Weights', c=self.loadSkin )
        
        """ The root layout """
        self.UIElements["rowColumnLayout"] = mc.rowColumnLayout(numberOfColumns=2, columnWidth=[(1, 120), (2, 240)], cs=[2, 10], bgc=[0.2, 0.2, 0.2])

        """ Use a flow layout for the  UI """
        self.UIElements["guiFlowLayout"] = mc.flowLayout(v=True, bgc=[.4, .4, .4], width=120, height=self.windowHeight)
        mc.setParent(self.UIElements["rowColumnLayout"])

        self.UIElements["guiFlowLayout2"] = mc.flowLayout(v=True, bgc=[.4, .4, .4], width=240, height=self.windowHeight)
        mc.setParent(self.UIElements["rowColumnLayout"])

        self.UIElements['Separator'] = mc.separator(height=20, style='single', p=self.UIElements['guiFlowLayout'])
        self.UIElements['BindOptionsText'] = mc.text(label='Bind Method:', align='left',p=self.UIElements["guiFlowLayout"])
    
        """ Organise all the bind options here.
            Start with a dropdown Menu """
        self.UIElements['DropDownMenu1'] = mc.optionMenu( ni=4, width=buttonWidth, height=buttonHeight, enable=True,
        p=self.UIElements['guiFlowLayout'])
        self.UIElements['DropDownItem1'] = mc.menuItem(label='Skeleton', p=self.UIElements['DropDownMenu1'])
        self.UIElements['DropDownItem1'] = mc.menuItem(label='Selected Joints', c=self.skeletonBind, p=self.UIElements['DropDownMenu1'])
        self.UIElements['DropDownItem1'] = mc.menuItem(label='Closest Point', c=self.bindToSurface, p=self.UIElements['DropDownMenu1'])
        
        self.UIElements['NormChkBx'] = mc.checkBox(label = 'Normalize Weights',annotation = "Normalizes Weights in post", onc = self.weightNormalize,p=self.UIElements['guiFlowLayout'])
        self.UIElements['PruneChkBx'] = mc.checkBox(label = 'Prune Weights', annotation = 'Removes unused points in deformer', onc = self.weightPrune,p=self.UIElements['guiFlowLayout'])
        self.UIElements['BindBtn'] = mc.button(label='Bind', width=buttonWidth, height=buttonHeight, enable=True,
        annotation='Bind Skin based off selection', bgc=[.5, .5, .5], p=self.UIElements['guiFlowLayout'], c=self.skeletonBind)

        """ Edit Bind elements """
        self.UIElements['Separator'] = mc.separator(height=34, style='none', p=self.UIElements['guiFlowLayout'])
        self.UIElements['EditBindText'] = mc.text(label='Edit Bind:' , align='left', p=self.UIElements["guiFlowLayout"])

        """Unbind skin drop down menu"""
        self.UIElements['DropDownMenu2'] = mc.optionMenu(ni=4, width=buttonWidth, height=buttonHeight, enable=True,
            p=self.UIElements['guiFlowLayout'])
        self.UIElements['DropDownItem2'] = mc.menuItem(label='Detach w/ Hist.', p=self.UIElements['DropDownMenu2'])
        self.UIElements['DropDownItem2'] = mc.menuItem(label='Detach w/o Hist.',  p=self.UIElements['DropDownMenu2'])
        
        self.UIElements['EditBindBtn'] = mc.button(label='Unbind Skin', width=buttonWidth, height=buttonHeight, enable=True,
        annotation='Edit Skin based off of selection', bgc=[.5, .5, .5], p=self.UIElements['guiFlowLayout'], c=self.editBind)

        self.UIElements['Separator'] = mc.separator(h=20, style='none', p=self.UIElements['guiFlowLayout'])
        self.UIElements['EditJntsBtn'] = mc.button(label='Move Joints Off', width=buttonWidth, height=buttonHeight, enable=True,
        annotation='Put the skin in edit joint mode', bgc=[.5, .5, .5], p=self.UIElements['guiFlowLayout'], c=self.moveJoints)
        self.UIElements['Separator'] = mc.separator(h=20, style='none', p=self.UIElements['guiFlowLayout'])
        self.UIElements['DeleteSkinBtn'] = mc.button(label='Delete SkinCluster', width=buttonWidth, height=buttonHeight, enable=True,
        annotation='Deletes all SkinCluster history', bgc=[.5, .5, .5], p=self.UIElements['guiFlowLayout'], c=self.deleteSkin)
        """ Now we have an empty flow layout to use for something else like a text scroll list of influences """
        self.UIElements['Separator'] = mc.separator(h=20, style='none', p=self.UIElements['guiFlowLayout2'])
        
        """ A text Scroll List.  Now you can make a method to find all the influences associated with the selected skinCluster """
        self.UIElements['influenceList'] = mc.textScrollList( numberOfRows=8, w=210, h=200, bgc=[.4, .4, .4], allowMultiSelection=True, p=self.UIElements['guiFlowLayout2'])
        
        """ We need a way to populate the text scroll list once we have a selection.  Maya handles this in the 
        skinning tools by having a selection callback that runs when one of those windows are open.
        We can do the same, but let's start simple by making a button to load this info.
        """
        self.UIElements['Separator'] = mc.separator(h=20, style='none', p=self.UIElements['guiFlowLayout2'])
        self.UIElements['loadInfBtn'] = mc.button(label='Load Influences', width=buttonWidth, height=buttonHeight, enable=True,
        annotation='Load Influences', bgc=[.5, .5, .5], p=self.UIElements['guiFlowLayout2'], c=self.popInfluenceList)
        
        """ Show the window"""

        mc.showWindow(self.windowName)
        
    def popInfluenceList(self, *args):
        selection = self.getSelectedMesh()

        if selection == None:
            return(mc.headsUpMessage("Select Geometry"))
        
        # Doing this to verify we have a skin cluster
        sknCluster = self.getSelectionSkinClusters(selection)

        if sknCluster == None:
            return(mc.headsUpMessage('skinCluster Not Found'))
        
        # Get the list of verts   
        vertList = self.listVertices(selection)
        print vertList
        mc.textScrollList(self.UIElements['influenceList'], edit=True, append=vertList)



    def listVertices(self, selection, *args):
        #get vtx influences
        listVerts = (mc.ls ([selection[0] + '.vtx[*]'], flatten=True))
        
        return listVerts        


    def saveSkin(self, *args):
        print 'In Save Skin'
        print 'In Save Skin'
        selection = self.getSelectedMesh()

        if selection == None:
            return(mc.headsUpMessage("Select Geometry"))

        sknCluster = self.getSelectionSkinClusters(selection)

        if sknCluster == None:
            return(mc.headsUpMessage('skinCluster Not Found'))

        # Add a file browser

        basicFilter = "*.xml"
        fdir = mc.fileDialog2(fileFilter=basicFilter, dialogStyle=3)

        fileName = fdir[0].rpartition('/')[2]

        filePath = fdir[0].rpartition('/')[0]

        mc.deformerWeights (fileName, ex=True, deformer=sknCluster[0], p=filePath)
        mc.headsUpMessage("Skin Exported")


    def loadSkin(self, selection, *args):
        
        print "In Load Skin"

        #Open Browser
        basicFilter = "*.xml"
        fdir = mc.fileDialog2(fileFilter=basicFilter, cap='Import weights:',
            okCaption='Load', dialogStyle=2)

        fileName = fdir[0].rpartition('/')[2]

        filePath = fdir[0].rpartition('/')[0]
        selection = self.getSelectedMesh()

        print filePath
        sknCluster = self.getSelectionSkinClusters(selection)
        if sknCluster == None:
            return(mc.headsUpMessage('skinCluster Not Found'))

        #import weights
        print sknCluster
        importSkin = mc.deformerWeights (fileName, im=True, deformer=sknCluster[0], m="index", p=filePath)

        mc.headsUpMessage(fileName + ' Imported Successfully')
#------------------------------------------------------------------------------------------------
    def getSelectedMesh(self, *args):
        # Identify the selection 
        sel = mc.ls(sl=True, et='transform')
        if sel == []:
            return
        return sel

    def getSelectedShape(self, selection, *args):
        shp = mc.listRelatives(selection[0], s=True, type="shape")
        print shp
        return shp


    def getSelectedJoints(self, *args):
        sel = mc.ls(sl=True, typ='joint')
        if sel == []:
            return
        return sel


    def getSelectionSkinClusters(self, selection, *args):
        print selection
        # I added this to verify a skin cluster exists
        rel = self.getSelectedShape(selection)

        # findRelatedSkinCluster does not have a return value so let's try a new method.
        #skin = mel.eval('findRelatedSkinCluster($mesh);')
        skin = mc.listConnections(rel[0], t="skinCluster")
        print "SKIN"
        print skin

        if skin == None:
            return
        return skin


    def unBindSkin(self, *args):
        print "In Unbind"
        #unbind skin keep history/keep weight values
        self.getSelectedMesh()

        # Maya has bindSkin and skinCluster.  This is of course redundant.  After switching to skinCluster, this function works fine.
        try:
            mc.skinCluster(edit=True, unbindKeepHistory=True)
        except: pass


    def detachSkin(self, *args):
        print "In Detach"
        self.getSelectedMesh()
        try:
            mc.skinCluster(edit=True, unbind=True)
        except: pass

    def moveJoints(self, *args):
        print 'In Edit'
        self.getSelectedMesh()
        try:
            mc.skinCluster(edit =True,moveJointsMode = True)
        except: pass


    def bindToSurface(self, selection, *args):
        #bind each object by closest point on selection
        sel = mc.ls(sl=True)
        if sel == []:
            mc.headsUpMessage("Select desired joints then geometry")
            return sel
        else:
            mc.bindSkin(bcp=True)


    def skeletonBind(self, *args):

        # Find the mesh and joint selection

        selection = self.getSelectedMesh()


        if selection == None:

            return(mc.headsUpMessage("Select Geometry"))


        selJnts = self.getSelectedJoints()


        if selJnts == None:

            return(mc.headsUpMessage("Select Joints"))


        # Check to see if the skin is already bound

        # This is tricky because the joints may have been unbound with keep history on

        # This means the mesh shape is disconnected from the joint set, but the skinCluster still exists

        # This should be OK, but you could try doing some checks.


        sknCluster = self.getSelectionSkinClusters(selection)


        if sknCluster != None:

            print "Skin Information Exists"



        # Now we can bind the skin based off the option selected in bind method. 

        # First we need to query the active item in the drop down menu.

        ddVal = mc.optionMenu(self.UIElements['DropDownMenu1'], q=True, v=True)

        print ddVal

        # Once we know which item is active, we can do a few if statements to get our skinCluster settings.
        if ddVal =='Skeleton':

        #Bind to selected joints

            # Going to do a try and except until we develop a better verification method.

            try:

                mc.skinCluster(tsb=True, sm=0)

            except:

                return(mc.headsUpMessage("The Skin Was Already Bound"))

        if ddVal == 'Selected Joints':

            #Bind to selected joints

            # Going to do a try and except until we develop a better verification method.

            try:

                mc.skinCluster(tsb=True, sm=0)

            except:

                return(mc.headsUpMessage("The Skin Was Already Bound"))



        mc.headsUpMessage("Skin Bound")



    def weightNormalize(self,selection, *args):
        sel = mc.ls(sl=True, et='transform')
        if sel == []:
            return (mc.headsUpMessage("Please select a deformer"))
        else:
            mc.skinCluster(edit = True, normalizeWeights = 2)
            #Normalize in post = default
            return (mc.headsUpMessage("Weights normalized"))


    def weightPrune(self, selection, *args):
        sel = mc.ls(sl=True, et='transform')

        if sel == []:
            return (mc.headsUpMessage("Please select a deformer"))
        else:
            mc.skinCluster(edit = True, prune = True)
        return (mc.headsUpMessage("Unused Points removed"))

    """Removes any points not being deformed by the deformer in its current configuration
    from the deformer set"""

    def editBind(self,selection, *args):

        selection = self.unBindSkin()
        if selection == None:

            return(mc.headsUpMessage("skin detached"))




        sknCluster = self.getSelectionSkinClusters(selection)

        delSkin = self.detachSkin()

        if delSkin == None:
            return(mc.headsUpMessage("Skin Detached"))

        if sknCluster != False:

            print "skin information exists"




        #query active item in drop Down
        ddVal2 = mc.optionMenu(self.UIElements['DropDownMenu2'], q=True, v=True)

        print ddVal2

        if ddVal2 == 'detach w/ Hist.':
            try:
                mc.skinCluster(edit=True, unbindKeepHistory=True)
            except:

                return (mc.headsUpMessage("Skin is Detached with History"))

        if ddVal2 == "Detach w/o Hist.":
            #unbinds joints in edit mode, can move joints without effecting skinCluster
            try:
                mc.skinCluster(edit =True, ubk= True)

            except:
                return (mc.headsUpMessage("Skin Detached Without History"))

       
    def toggleJoints(self, *args):

    # Verify we have a mesh selected

        selection = self.getSelectedMesh()

        if selection == None:

            return(mc.headsUpMessage("Select Geometry"))

            # Verify we have a skin cluster

        sknCluster = self.getSelectionSkinClusters(selection)

        if sknCluster == None:

            return(mc.headsUpMessage('skinCluster Not Found'))


            # This would be a good time to check if the mesh is already in edit mode so we can make sure our button is in the correct state.

            # I will need to look into how to do this as the mjm flag is not queryable


            # Query the button state

        buttonState = mc.button(self.UIElements['EditJntsBtn'], q=True, label=True)

        # Toggle the button state and run the skinCluster command

        if buttonState == 'Move Joints Off':

            mc.button(self.UIElements['EditJntsBtn'], edit=True, label='Move Joints On')

            mc.skinCluster(edit=True, mjm=True)

        if buttonState == 'Move Joints On':

            mc.button(self.UIElements['EditJntsBtn'], edit=True, label='Move Joints Off')

            mc.skinCluster(edit=True, mjm=False)

    def deleteSkin(self, *args):
        selection = self.getSelectedMesh()

        if selection == None:

            return(mc.headsUpMessage("Select Geometry"))
        
        sknCluster = self.getSelectionSkinClusters(selection)
        if sknCluster == None:
            return(mc.headsUpMessage('skinCluster Not Found'))
        
        delSkin=mc.delete(sknCluster)
        
        if delSkin ==True:
            return(mc.headsUpMessage('skinCluster Deleted'))  
        
Skin_Utils()