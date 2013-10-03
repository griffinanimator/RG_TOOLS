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
        self.pctrls = []
        self.pjntList = []
        self.partNodes = []
        # List for hidden nodes
        self.hideList = []
        # List for mirrored joints 
        self.mirrorJntList = []
        self.ikList = []

        self.partInfo(part)

        # Set mirror namespace variable
        if mirror == 1:
            mns = ns.replace('_L_', '_R_')

        # NOTE:  I do a bunch of renaming that should be done by editing the dict entries
        # List to hold pcontrols

        # See if the namespace exists.
        # NOTE:  be aware of the flag relativeNames(rel)
        cmds.namespace(set=':')
        if mirror == 0:
            if cmds.namespace(ex=ns) == True:
                # This is the place to do the gen new name thing
                return
            else:
                ns = ns
            cmds.namespace(add=ns)
            cmds.namespace(set=ns)

            # Create the joints
            self.createPJnts()

        if mirror == 1:
            # Get namespace of selected
            tns = cmds.ls(sl=True, sns=True)[1] + ':'
            ns = mns
            cmds.namespace(add=ns)
            cmds.namespace(set=ns)

            tmpPosList = []
            for i in range(len(self.partInfo['names'])):
                # NOTE: mirrorJoint is mirroring ik and not returning it
                mirrorJnt = cmds.mirrorJoint(tns + self.partInfo['pjntnames'][i][0], mirrorBehavior=True, myz=True)
                pjntRoot = mirrorJnt[0]
                pjntEnd = mirrorJnt[1]
                ikH = cmds.listConnections(pjntRoot, type='ikHandle')
                self.pjntList.append([pjntRoot, pjntEnd])
                self.hideList.append(ikH[0]) 
                self.ikList.append(ikH[0])
                # Define new positions                
                
            for i in range(len(self.pjntList)):
                tmpPosList.append(cmds.xform(self.pjntList[i][0], q=True, ws=True, t=True))
                if i == len(self.pjntList)-1:
                    tmpPosList.append(cmds.xform(pjntEnd, q=True, ws=True, t=True))
            self.partInfo['positions']=tmpPosList

        """
        for key, value in self.partInfo.iteritems() :
            print key, value
        """
        
        # Build the layout object from JSON Data
        # Create a root controller
        ctrlName = 'ctrl_'+ self.partInfo['rootname']
        ctrl = cmds.circle(n=ctrlName, nr=(1, 0, 0), c=(0, 0, 0), r=2.0 )
        ctrlGrp = cmds.group(n='grp_'+ ctrlName)
        
        for n in range(len(self.partInfo['names'])):                    
            if n == 0:
                tmpConstraint = cmds.parentConstraint(self.pjntList[n][0], ctrlGrp, mo=False)
                cmds.delete(tmpConstraint) 
                self.partNodes.append(ctrlGrp)
            
            
            # Generate a suffix
            # NOTE: put this in JSON
            suffix = self.partInfo['names'][n]
            
            # Create ik
            if mirror == 0:
                ikH = cmds.ikHandle(n='ikh_'+ dm + suffix, sj=self.pjntList[n][0], ee=self.pjntList[n][1], s='sticky', sol="ikRPsolver")
                self.hideList.append(ikH[0]) 
                self.ikList.append(ikH[0]) 
          
        # Create Stretch
        self.createStretch(ns, dm, ctrl, ctrlGrp, ikH)
        
        for each in self.hideList:
            try:
                cmds.setAttr(each + '.visibility', 0, l=True)
            except: pass
            self.partNodes.append(each)

        for each in self.pjntList:
            cmds.setAttr(each[0] + '.overrideEnabled', 1)
            cmds.setAttr(each[0] + '.overrideDisplayType', 1) 
            self.partNodes.append(each[0])
            cmds.setAttr(each[1] + '.overrideEnabled', 1)
            cmds.setAttr(each[1] + '.overrideDisplayType', 1) 
            self.partNodes.append(each[1])

            
        # Create a container and add stuff
        con = cmds.container(n=ns + 'AST') 
        for each in self.partNodes:
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
        
    def createStretch(self, ns, dm, ctrl, ctrlGrp, ikH, *args):
        for n in range(len(self.partInfo['names'])): 
            suffix = self.partInfo['names'][n]
            # Stretch ----------------------------------------------------------
            mdEStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_EStretch_' + dm + suffix)
            self.hideList.append(mdEStretch)
            cmds.select(d=True)
            # NOTE: I need to change disDim transform name    
            lctrR = cmds.spaceLocator(n='lctrDis_Root_' + dm + suffix, p=self.partInfo['positions'][n], a=True)
            lctrE = cmds.spaceLocator(n='lctrDis_End_' + dm + suffix, p=self.partInfo['positions'][n+1], a=True)
            disDim = cmds.distanceDimension(sp=(self.partInfo['positions'][n]), ep=(self.partInfo['positions'][n+1]))
            self.hideList.append(lctrR[0]) 
            self.hideList.append(lctrE[0]) 
            
            # Sometimes this just happens.  Silly Maya
            try:
                cmds.connectAttr(lctrR[0] + 'Shape.worldPosition[0]', disDim  + '.startPoint', f=True)
                cmds.connectAttr(lctrE[0] + 'Shape.worldPosition[0]', disDim  + '.endPoint',f=True)
            except: pass
            pval = cmds.getAttr(self.pjntList[n][1]  + '.tx')

            if pval < 0.0:
                cmds.setAttr(mdEStretch + '.input2X', -1)
            if pval > 0.0:
                cmds.setAttr(mdEStretch + '.input1X', 1)
            cmds.connectAttr(disDim + '.distance', mdEStretch + '.input1X')
            cmds.rename(ns+':'+'distanceDimension1', 'disDimNode_Stretch'+ dm + suffix)
            self.hideList.append(ns+':'+ 'disDimNode_Stretch'+ dm + suffix) 
            # Determine the length of the joint chain in default position
            # NOTE: The axis could change depending on orientation
            # NOTE: It may make more sence to do this with scale so we can easily connect geo
            endLen = cmds.getAttr(self.pjntList[n][1] + '.tx')
            
            #Finally, we output our new values into the translateX of the knee and ankle joints.
            cmds.connectAttr( mdEStretch + '.outputX', self.pjntList[n][1]  + '.tx')

            # Create controls and connection points
            #rctrlName = self.partInfo['partcontrols'][n][0]
            rctrl = cmds.circle(n=self.partInfo['partcontrols'][n][0], nr=(1, 0, 0), c=(0, 0, 0) )
            rctrlGrp = cmds.group(n='grp_'+ self.partInfo['partcontrols'][n][0])
            cmds.parent(rctrlGrp, ctrl)

            #ectrlName = self.partInfo['partcontrols'][n][1]
            ectrl = cmds.circle(n=self.partInfo['partcontrols'][n][1], nr=(1, 0, 0), c=(0, 0, 0) )
            ectrlGrp = cmds.group(n='grp_'+ self.partInfo['partcontrols'][n][1])
            cmds.parent(ectrlGrp, ctrl)

            tmpConstraint = cmds.parentConstraint(self.pjntList[n][0], rctrlGrp, mo=False)
            cmds.delete(tmpConstraint) 
            tmpConstraint = cmds.parentConstraint(self.pjntList[n][1], ectrlGrp, mo=False)
            cmds.delete(tmpConstraint)
            cmds.setAttr(rctrl[0] + '.rotate', lock=True) 
            cmds.setAttr(rctrl[0] + '.scale', lock=True) 
            cmds.setAttr(ectrl[0] + '.rotate', lock=True) 
            cmds.setAttr(ectrl[0] + '.scale', lock=True) 

            self.pctrls.append([rctrl[0], ectrlGrp])
            self.partNodes.append(rctrlGrp)
            self.partNodes.append(ectrlGrp)

            # Parent the stretch locators and ik to the controls 

            cmds.parent(lctrR, rctrl[0])
            cmds.parent(lctrE, ectrl[0])
            cmds.parent(self.ikList[n], ectrl[0])
            
            # If more than on layout object, parent them in a chain
            plen = len(self.partInfo['names'])
  
        for n in range(len(self.partInfo['names'])): 
            cmds.pointConstraint(self.pctrls[n][0], self.pjntList[n][0], mo=True)
            if n > 0 and n < plen:
                cmds.parentConstraint(self.pctrls[n][0], self.pctrls[n-1][1], mo=True)
                cmds.pointConstraint(self.pctrls[n][0], self.pjntList[n][0], mo=True)
            if n < plen-1:
                self.hideList.append(self.pctrls[n][1])
                
            # Hide and lock nodes
            # NOTE: Getting double nodes



    def partInfo(self, part, *args):
        # Read the JSON file and store data to dict
        filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
        data = utils_json.readJson(filename)
        info = json.loads( data )
        self.partInfo = info[part]


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