import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_ASpine"
TITLE = "Spine"
DESCRIPTION = "Create an awesome spine"


class Create_ASpine:
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.tmpRigElements = []
        self.rig_info = {}


    def install(self, part_data, namespace, instance, partData, *args):
        print part_data
        # Collect the first joint from each pjoint key
        jntInfo = []
        for j in range(len(part_data['pjntnames'])):
            pos = cmds.xform(namespace+part_data['pjntnames'][j][0], q=True, ws=True, t=True)
            rot = cmds.xform(namespace+part_data['pjntnames'][j][0], q=True, ws=True, ro=True)
            jntInfo.append([part_data['names'][j], pos, rot])

        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_' + instance, jntInfo)
        # Create an ik joint chain
        self.jnt_info['iksJnts'] = part_utils.createJoints('ikSj_' + instance, jntInfo)
        self.jnt_info['ikrJnts'] = part_utils.createJoints('ikRj_' + instance, jntInfo)
        # Create the bind skeleton
        #self.jnt_info['bindJnts'] = part_utils.createJoints('Bone_' + instance, jntInfo)

        # Add all of the joints to rig_info{}
        for each in self.jnt_info['rigJnts']:
            self.tmpRigElements.append(each)
        for each in self.jnt_info['iksJnts']:
            self.tmpRigElements.append(each)
        for each in self.jnt_info['ikrJnts']:
            self.tmpRigElements.append(each)
        #for each in self.jnt_info['bindJnts']:
            #self.tmpRigElements.append(each)

        spl = len(self.jnt_info['iksJnts']) -1

        # Create a new joint at the root, the mid, and the top of the iksJoint chain.
        rootJointList = (['ikBRoot_' + instance, cmds.xform(self.jnt_info['iksJnts'][0], q=True, ws=True, t=True)], ['ikMRoot_' + instance, cmds.xform(self.jnt_info['iksJnts'][2], q=True, ws=True, t=True)], ['ikTRoot_' + instance, cmds.xform(self.jnt_info['iksJnts'][spl], q=True, ws=True, t=True)])
       
        rootJoints = []
        for i in rootJointList:
            cmds.select(d=True)
            rootJoints.append(cmds.joint(n=i[0], p=i[1]))
            cmds.select(d=True)
            self.tmpRigElements.append(i)
        self.jnt_info['rootJnts'] = rootJoints

        
        # Define names for components involved in ik setup
        ikHandleName = 'ikh_'+ instance + 'arm'
        ctrlName = partData['ikcontrol'][0].replace('s_', instance)

        # Draw a splineIK from the root to the last iksJnt.
        ikSol = cmds.ikHandle(n='spine_Ik'+instance, solver='ikSplineSolver', sj=self.jnt_info['iksJnts'][0], ee=self.jnt_info['iksJnts'][spl], ccv=True)
        self.tmpRigElements.append(ikSol)
        cmds.select(d=True)
        
        # Bind the splineIK curve to those 2 new joints.
        cmds.select('curve1', rootJoints)
        sc = cmds.skinCluster(n='skinCluster'+instance, tsb=True)
        self.tmpRigElements.append(sc)
        
        #Rename the curve
        cmds.setAttr('curve1.inheritsTransform', 0)
        cmds.rename('curve1', 'aSpine_curve'+instance)
        self.tmpRigElements.append('aSpine_curve'+instance)

        # Draw an iKhandle between each self.jnt_info['ikrJnts']
        ikHandles = []
        for j in range(spl):
            if j < spl:
                ikh = cmds.ikHandle( n='ikH_'+ self.jnt_info['ikrJnts'][j], sol='ikRPsolver', sj=self.jnt_info['ikrJnts'][j], ee=self.jnt_info['ikrJnts'][j+1] )
                cmds.parent(ikh, self.jnt_info['iksJnts'][j]) 
                ikHandles.append(ikh)
                self.tmpRigElements.append(ikh)

        # Point constrain 1st iks to 1st ikb
        for j in range(spl+1):
            pca = cmds.pointConstraint(self.jnt_info['iksJnts'][j], self.jnt_info['ikrJnts'][j], mo=True)
            self.tmpRigElements.append(pca)
        for j in range(1,4):    
            pcb = cmds.pointConstraint(self.jnt_info['ikrJnts'][j], self.jnt_info['rigJnts'][j], mo=True)
            self.tmpRigElements.append(pcb)
            oca = cmds.orientConstraint(self.jnt_info['iksJnts'][j], self.jnt_info['rigJnts'][j], mo=True)
            self.tmpRigElements.append(oca)
        pcc = cmds.pointConstraint(self.jnt_info['ikrJnts'][0], self.jnt_info['rigJnts'][0], mo=True)
        self.tmpRigElements.append(pcc)
        pcd = cmds.pointConstraint(self.jnt_info['ikrJnts'][4], self.jnt_info['rigJnts'][4], mo=True)
        self.tmpRigElements.append(pcd)

        # Create a locator for each ikh
        locator_groups = []
        for i in range(spl+1):
            bPos = cmds.xform(self.jnt_info['iksJnts'][i], q=True, ws=True, t=True)
            nPos = [bPos[0], bPos[1], bPos[2]+1.0]
            lctr = cmds.spaceLocator(name='lctr_'+self.jnt_info['iksJnts'][i], a=True)
            self.tmpRigElements.append(lctr)
            cmds.xform(lctr, ws=True, t=nPos)
            grp = cmds.group(name='grp_lctr_'+self.jnt_info['iksJnts'][i], em=True)
            self.tmpRigElements.append(grp)
            cmds.xform(grp, ws=True, t=bPos)
            cmds.parent(lctr, grp)
            # Create pole vector constraints
            if i < spl:
                cmds.poleVectorConstraint(lctr, ikHandles[i][0])
            cmds.parent(grp, self.jnt_info['iksJnts'][i]) 
            cmds.makeIdentity( grp, apply=True )
            locator_groups.append(grp)
            self.jnt_info['locator_groups'] = locator_groups

        # Create PMA nodes to control the twist
        # NOTE:  This is tricky if we want to allow for more joints.  For now I am coding for 5 but need a solution for more.
        pma_nodes = []
        for i in range(spl+1):
            if spl > 5: 
                print " I currently only support 5 joints"
                return
            else:
                pmaNode_Name = self.jnt_info['iksJnts'][i].replace('ikSj', 'pmaTwist_') 
                pma = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaNode_Name)
                self.tmpRigElements.append(pma)
                cmds.setAttr(pma+'.operation', 3) #average
                pma_nodes.append(pma)

        
        # Now connect the Pma
        self.jnt_info['twistPma'] = pma_nodes
        cmds.connectAttr(self.jnt_info['rootJnts'][0] + '.ry', self.jnt_info['twistPma'][2]+'.input1D[0]')
        cmds.connectAttr(self.jnt_info['rootJnts'][1] + '.ry', self.jnt_info['twistPma'][2]+'.input1D[1]')
        cmds.connectAttr(self.jnt_info['twistPma'][2]+'.output1D', self.jnt_info['locator_groups'][2] +'.rx')

        cmds.connectAttr(self.jnt_info['twistPma'][0]+'.output1D', self.jnt_info['twistPma'][1]+'.input1D[0]')
        cmds.connectAttr(self.jnt_info['rootJnts'][0] + '.ry', self.jnt_info['twistPma'][1]+'.input1D[1]')
        cmds.connectAttr(self.jnt_info['twistPma'][1]+'.output1D', self.jnt_info['locator_groups'][1] +'.rx')

        cmds.connectAttr(self.jnt_info['rootJnts'][0] + '.ry', self.jnt_info['twistPma'][0]+'.input1D[0]')
        cmds.connectAttr(self.jnt_info['twistPma'][0]+'.output1D', self.jnt_info['locator_groups'][0] +'.rx')

        cmds.connectAttr(self.jnt_info['rootJnts'][0] + '.ry', self.jnt_info['twistPma'][3]+'.input1D[0]')
        cmds.connectAttr(self.jnt_info['twistPma'][2]+'.output1D', self.jnt_info['twistPma'][3]+'.input1D[1]')
        cmds.connectAttr(self.jnt_info['twistPma'][3]+'.output1D', self.jnt_info['locator_groups'][3] +'.rx')

        cmds.connectAttr(self.jnt_info['rootJnts'][1] + '.ry', self.jnt_info['twistPma'][4]+'.input1D[0]')
        cmds.connectAttr(self.jnt_info['twistPma'][4]+'.output1D', self.jnt_info['locator_groups'][4] +'.ry')

        # Make the spine stretch.
        # NOTE: Try the expression method
        # NOTE: Add stretch ammount attribute.
        #cmds.expression( s= 'surface1.sx = %s.arcLength' %  curveInfoNode )
        
        curveInfoNode = cmds.arclen('aSpine_curve'+instance, ch=True)
        
        mdsNode_Name = self.jnt_info['iksJnts'][0].replace('ikSj', 'mdStretch') 
        mds = cmds.shadingNode("multiplyDivide", asUtility=True, n=mdsNode_Name)
        self.tmpRigElements.append(mds)
  
        cmds.setAttr(mds+'.operation', 2) #divide
        cmds.connectAttr(curveInfoNode+'.arcLength', mds+'.input1X')
        #cmds.connectAttr(curveInfoNode+'.arcLength', mda+'.input2X')
        crvLen = cmds.getAttr(curveInfoNode+'.arcLength')
        cmds.setAttr(mds+'.input2X', crvLen)
       
        # Connect stretch to joints
        for i in range(len(self.jnt_info['iksJnts'])-1):
            cmds.connectAttr(mds+'.outputX', self.jnt_info['iksJnts'][i]+'.sx')


        cmds.rename(curveInfoNode, 'curveInfo'+instance)

        # Setup controls
        ctrlAttrs = []

        spineCtrls = []
        
        """
        spineCtrls contents
        [u'grp_Spine__c0_ctrl_hip', u'Spine__c0_ctrl_hip'] 0
        [u'grp_Spine__c0_ctrl_0', u'Spine__c0_ctrl_0'] 1
        [u'grp_Spine__c0_ctrl_1', u'Spine__c0_ctrl_1'] 2
        [u'grp_Spine__c0_ctrl_2', u'Spine__c0_ctrl_2'] 3
        [u'grp_Spine__c0_ik_ctrl_1', u'Spine__c0_ik_ctrl_1'] 4
        """
        
        # Create the hip control
        ctrlName = part_data['fkcontrols'][0].replace('s_', instance)
        ctrlPos = cmds.xform(self.jnt_info['rootJnts'][0], q=True, ws=True, t=True)
        
        spineControl = part_utils.setupControlObject("HipControl.ma", ctrlName, ctrlAttrs, jntInfo[0][1], jntInfo[0][2], os.environ['Parts_Maya_Controls'])
        cmds.parentConstraint(spineControl[1], self.jnt_info['rootJnts'][0])
        spineCtrls.append(spineControl)

        
        for i in range(len(self.jnt_info['rootJnts'])):
            ctrlName = part_data['fkcontrols'][i].replace('s_', instance)
            ctrlPos = cmds.xform(self.jnt_info['rootJnts'][i], q=True, ws=True, t=True)
            # NOTE: Dynamically generate the control objects
            spineControl = part_utils.setupControlObject("FkSpineControl.ma", ctrlName, ctrlAttrs, jntInfo[i][1], jntInfo[i][2], os.environ['Parts_Maya_Controls'])
            if i == 2:
                cmds.parentConstraint(spineControl, self.jnt_info['rootJnts'][i], mo=True)
            spineCtrls.append(spineControl)
        
        # Create the mid spine control
        ctrlName = part_data['fkcontrols'][3].replace('s_', instance)
        ctrlPos = cmds.xform(self.jnt_info['rootJnts'][1], q=True, ws=True, t=True)
        spineControl = part_utils.setupControlObject("spineControl.ma", ctrlName, ctrlAttrs, jntInfo[i][1], jntInfo[i][2], os.environ['Parts_Maya_Controls'])
        cmds.parentConstraint(spineControl, self.jnt_info['rootJnts'][1], mo=True)
        spineCtrls.append(spineControl)

        cmds.orientConstraint(self.jnt_info['rootJnts'][0], self.jnt_info['rigJnts'][0] , mo=True)
        cmds.orientConstraint(self.jnt_info['rootJnts'][2], self.jnt_info['rigJnts'][4] , mo=True)     
        
        cmds.parent(spineCtrls[4][0], spineCtrls[2][1])
        cmds.parent(spineCtrls[3][0], spineCtrls[2][1])
        cmds.parent(spineCtrls[2][0], spineCtrls[1][1])
        
        # Cleanup
        for each in spineCtrls:
            self.tmpRigElements.append(each)

        self.rig_info['rig_info'] = self.tmpRigElements

        # Add the rig to a container.
        rigContainer = part_utils.createRigContainer(instance, partData['rootname']) 

        # Group the arm under a master transform
        partLinkGrpName = ('Part_Link_' + instance + partData['rootname'])
        plGrp = cmds.group(n=partLinkGrpName, em=True)
        plGrpPos = cmds.xform(self.jnt_info['rigJnts'][0], q=True, ws=True, t=True)
        cmds.xform(plGrp, ws=True, t=plGrpPos)
        cmds.makeIdentity( plGrp, apply=True )
        
        cmds.parent(self.jnt_info['rigJnts'][0], plGrp)
        cmds.parent(self.jnt_info['iksJnts'][0], plGrp)
        cmds.parent(self.jnt_info['ikrJnts'][0], plGrp)
        cmds.parent(ikSol[0], plGrp)
        cmds.parent(spineCtrls[0][0], plGrp)
        cmds.parent('aSpine_curve'+instance, plGrp)

        for each in rootJoints:
            cmds.parent(each, plGrp)

        cmds.container(rigContainer, edit=True, addNode=plGrp, inc=True, ish=True, ihb=True, iha=True)


        for element in self.rig_info['rig_info']:
            try:
                cmds.container(rigContainer, edit=True, addNode=element, inc=True, ish=True, ihb=True, iha=True)
            except: pass
        