import maya.cmds as cmds
import json
import tempfile
import Utils.Utils_JSON as utils_json
reload(utils_json)
import time

class Part_Install:

    def __init__(self):
        print 'Install'
        self.part_info = {}

    def install(self, part, dm, ns, mirror, *args):
        pctrls = []
        self.pjntList = []
        partNodes = []
        # List for hidden nodes
        hideList = []

        # NOTE:  I do a bunch of renaming that should be done by editing the dict entries
        # List to hold pcontrols

        # See if the namespace exists.
        # NOTE:  be aware of the flag relativeNames(rel)
        cmds.namespace(set=':')
        if cmds.namespace(ex=ns) == True:
            # This is the place to do the gen new name thing
            return
        else:
            ns = ns
        # Move into a new namespace
        cmds.namespace(add=ns)
        cmds.namespace(set=ns)

        # Read the JSON file and store data to dict
        filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
        data = utils_json.readJson(filename)
        info = json.loads( data )
        self.partInfo = info[part]


        """
        for key, value in self.partInfo.iteritems() :
            print key, value
        """
        
        # Build the layout object from JSON Data
        # Create a root controller
        ctrlName = 'ctrl_'+ self.partInfo['rootname']
        ctrl = cmds.circle(n=ctrlName, nr=(1, 0, 0), c=(0, 0, 0), r=2.0 )
        ctrlGrp = cmds.group(n='grp_'+ ctrlName)
        
        if mirror == 0:  
            # Create the joints
            self.createPJnts()
        if mirror == 1:
            self.mirrorJnts() 

        for n in range(len(self.partInfo['names'])):                    
            if n == 0:
                tmpConstraint = cmds.parentConstraint(self.pjntList[n][0], ctrlGrp, mo=False)
                cmds.delete(tmpConstraint) 
                partNodes.append(ctrlGrp)
            
            
            # Generate a suffix
            # NOTE: put this in JSON
            suffix = self.partInfo['names'][n]
            
            # Create ik
            ikH = cmds.ikHandle(n='ikh_'+ dm + suffix, sj=self.pjntList[n][0], ee=self.pjntList[n][1], s='sticky', sol="ikRPsolver")
            hideList.append(ikH[0]) 
            
            # Stretch ----------------------------------------------------------
            mdEStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_EStretch_' + dm + suffix)
            hideList.append(mdEStretch)
            cmds.select(d=True)
            # NOTE: I need to change disDim transform name    
            lctrR = cmds.spaceLocator(n='lctrDis_Root_' + dm + suffix, p=self.partInfo['positions'][n], a=True)
            lctrE = cmds.spaceLocator(n='lctrDis_End_' + dm + suffix, p=self.partInfo['positions'][n+1], a=True)
            disDim = cmds.distanceDimension(sp=(self.partInfo['positions'][n]), ep=(self.partInfo['positions'][n+1]))
            hideList.append(lctrR[0]) 
            hideList.append(lctrE[0]) 
            
            # Sometimes this just happens.  Silly Maya
            try:
                cmds.connectAttr(lctrR[0] + 'Shape.worldPosition[0]', disDim  + '.startPoint', f=True)
                cmds.connectAttr(lctrE[0] + 'Shape.worldPosition[0]', disDim  + '.endPoint',f=True)
            except: pass
            
            cmds.connectAttr(disDim + '.distance', mdEStretch + '.input1X')
            cmds.rename(ns+':'+'distanceDimension1', 'disDimNode_Stretch'+ dm + suffix)
            hideList.append(ns+':'+ 'disDimNode_Stretch'+ dm + suffix) 
            # Determine the length of the joint chain in default position
            # NOTE: The axis could change depending on orientation
            # NOTE: It may make more sence to do this with scale so we can easily connect geo
            endLen = cmds.getAttr(self.pjntList[n][1] + '.tx')
            
            #Finally, we output our new values into the translateX of the knee and ankle joints.
            cmds.connectAttr( mdEStretch + '.outputX', self.pjntList[n][1]  + '.tx')
            
            # Create controls and connection points
            rctrlName = self.partInfo['partcontrols'][n][0]
            rctrl = cmds.circle(n=rctrlName, nr=(1, 0, 0), c=(0, 0, 0) )
            rctrlGrp = cmds.group(n='grp_'+ rctrlName)
            cmds.parent(rctrlGrp, ctrl)
            ectrlName = self.partInfo['partcontrols'][n][1]
            ectrl = cmds.circle(n=ectrlName, nr=(1, 0, 0), c=(0, 0, 0) )
            ectrlGrp = cmds.group(n='grp_'+ ectrlName)
            cmds.parent(ectrlGrp, ctrl)
            tmpConstraint = cmds.parentConstraint(self.pjntList[n][0], rctrlGrp, mo=False)
            cmds.delete(tmpConstraint) 
            tmpConstraint = cmds.parentConstraint(self.pjntList[n][1], ectrlGrp, mo=False)
            cmds.delete(tmpConstraint)
            cmds.setAttr(rctrl[0] + '.rotate', lock=True) 
            cmds.setAttr(rctrl[0] + '.scale', lock=True) 
            cmds.setAttr(ectrl[0] + '.rotate', lock=True) 
            cmds.setAttr(ectrl[0] + '.scale', lock=True) 
            pctrls.append([rctrl, ectrlGrp])
            partNodes.append(rctrlGrp)
            partNodes.append(ectrlGrp)

            # Parent the stretch locators and ik to the controls 
            cmds.parent(lctrR, rctrl[0])
            cmds.parent(lctrE, ectrl[0])
            cmds.parent(ikH[0], ectrl[0])
            
            # If more than on layout object, parent them in a chain
            plen = len(self.partInfo['names'])
            cmds.pointConstraint(pctrls[n][0], self.pjntList[n][0], mo=True)
            if n > 0 and n < plen:
                cmds.parentConstraint(pctrls[n][0], pctrls[n-1][1], mo=True)
                cmds.pointConstraint(pctrls[n][0], self.pjntList[n][0], mo=True)
            if n < plen:
                hideList.append(pctrls[n-1][1])
                
            # Hide and lock nodes
            # NOTE: Getting double nodes

        for each in hideList:
            try:
                cmds.setAttr(each + '.visibility', 0, l=True)
            except: pass
            partNodes.append(each)

        for each in self.pjntList:
            cmds.setAttr(each[0] + '.overrideEnabled', 1)
            cmds.setAttr(each[0] + '.overrideDisplayType', 1) 
            partNodes.append(each[0])
            cmds.setAttr(each[1] + '.overrideEnabled', 1)
            cmds.setAttr(each[1] + '.overrideDisplayType', 1) 
            partNodes.append(each[1])

            
        # Create a container and add stuff
        con = cmds.container(n=ns + 'AST') 
        for each in partNodes:
            cmds.container(con, e=True, an=each, ihb=True, iha=True, inc=True)

        cmds.addAttr(con, shortName='link', longName='Link', dt='string')
        cmds.addAttr(con, shortName='source', longName='Source', dt='string')

        # Reset the namespace to default
        cmds.namespace(set=':')

        # First check to see if a master widget container exists.  If not, create one.
        MasterWidgetContainerName = 'Master_Widget_Container'
        if cmds.objExists(MasterWidgetContainerName) == False:
            masterWidgetContainer = cmds.container(n=MasterWidgetContainerName)

        #cmds.container('Master_Widget_Container', edit=True, addNode=con)# , inc=True, ish=True, ihb=True, iha=True



    def createPJnts(self):
        for n in range(len(self.partInfo['names'])): 
            cmds.select(d=True)
            pjntRootName = self.partInfo['pjntnames'][n][0]
            pjntEndName = self.partInfo['pjntnames'][n][1]
            pjntRoot = cmds.joint(n=pjntRootName, p=self.partInfo['positions'][n])
            pjntEnd = cmds.joint(n=pjntEndName, p=self.partInfo['positions'][n+1])
            self.pjntList.append([pjntRoot, pjntEnd])
            # Orient the joints
            cmds.joint(pjntRoot, e=True, oj=self.partInfo['jntorient'][0], sao=self.partInfo['jntorient'][1])

    def mirrorJnts(self):
        # Get namespace of selected module.
        for n in range(len(self.partInfo['names'])):
            cmds.select(self.partInfo['pjntnames'][n], add=True)

            

    """
    This will run install
    import Widgets.Layout
    part = 'arm'
    # the part arg will be the name of the layout you want to build.
    # dm is some extra name like the side "L" or "R".  If the dm exists, generate a new dm.
    dm =  '_L_01_'
    # Example call to install
    install(part, dm)
"""     