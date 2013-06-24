import maya.cmds as cmds
import os
import pymel.core as pm

import Utils.Utils_Part as part_utils
reload(part_utils)

CLASS_NAME = "Create_ASpine"

TITLE = "Awesome Spine"
DESCRIPTION = "Create an awesome spine"



class Create_ASpine:
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}


    def install(self, *args):
        # Collect layout info
        print "Install"
        sel = cmds.ls(sl=True)

        userDefinedName = sel[0].partition('PartRoot_')[0]
  
        lytObs = part_utils.collectLayoutInfo(sel)

        # Find the side we are on
        #side = part_utils.getSide(self.lyt_info['layoutRoot'])
        # Create an rig joint chain
        self.jnt_info['rigJnts'] = part_utils.createJoints('rigj_', lytObs)
        # Create an ik joint chain
        self.jnt_info['iksJnts'] = part_utils.createJoints('ikSj_', lytObs)
        self.jnt_info['ikrJnts'] = part_utils.createJoints('ikRj_', lytObs)
        #self.jnt_info['ikJnts'] = part_utils.createJoints('ikj_', lytObs)

        spl = len(self.jnt_info['iksJnts']) -1

        # Create a new joint at the root and the top of the iksJoint chain.
        rootJointList = (['ikBRoot_'+userDefinedName, cmds.xform(self.jnt_info['iksJnts'][0], q=True, ws=True, t=True)], ['ikTRoot_'+userDefinedName, cmds.xform(self.jnt_info['iksJnts'][spl], q=True, ws=True, t=True)])
       
        rootJoints = []
        for i in rootJointList:
            cmds.select(d=True)
            rootJoints.append(cmds.joint(n=i[0], p=i[1]))
            cmds.select(d=True)
        self.jnt_info['rootJnts'] = rootJoints
        
        # Define names for components involved in ik setup
        #ikHandleName = "ikHandle_%s_leg" % (side)
        ikHandleName = userDefinedName + 'ikh'
        #ctrlName = "ctrl_%s_leg" % (side)
        ctrlName = userDefinedName + 'ctrl'

        # Draw a splineIK from the root to the last iksJnt.
        ikSol = cmds.ikHandle(n='iks_spine_Ik', solver='ikSplineSolver', sj=self.jnt_info['iksJnts'][0], ee=self.jnt_info['iksJnts'][spl], ccv=True)
        cmds.select(d=True)
        # Bind the splineIK curve to those 2 new joints.
        cmds.select('curve1', rootJoints)
        cmds.skinCluster(tsb=True)
        #Rename the curve
        cmds.rename('curve1', userDefinedName+'_aSpine_curve')

        # Draw an iKhandle between each self.jnt_info['ikrJnts']
        ikHandles = []
        for j in range(spl):
            if j < spl:
                ikh = cmds.ikHandle( n='ikH_'+ self.jnt_info['ikrJnts'][j], sol='ikRPsolver', sj=self.jnt_info['ikrJnts'][j], ee=self.jnt_info['ikrJnts'][j+1] )
                cmds.parent(ikh, self.jnt_info['iksJnts'][j]) 
                ikHandles.append(ikh)

        # Point constrain 1st iks to 1st ikb
        for j in range(spl+1):
            cmds.pointConstraint(self.jnt_info['iksJnts'][j], self.jnt_info['ikrJnts'][j], mo=True)
            cmds.pointConstraint(self.jnt_info['ikrJnts'][j], self.jnt_info['rigJnts'][j], mo=True)

        # Create a locator for each ikh
        locator_groups = []
        for i in range(spl+1):
            bPos = cmds.xform(self.jnt_info['iksJnts'][i], q=True, ws=True, t=True)
            nPos = [bPos[0], bPos[1], bPos[2]+1.0]
            lctr = cmds.spaceLocator(name='lctr_'+self.jnt_info['iksJnts'][i], a=True)
            cmds.xform(lctr, ws=True, t=nPos)
            grp = cmds.group(name='grp_lctr_'+self.jnt_info['iksJnts'][i], em=True)
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
        curveInfoNode = cmds.arclen(userDefinedName+'_aSpine_curve', ch=True)
        mdsNode_Name = self.jnt_info['iksJnts'][0].replace('ikSj', 'mdStretch') 

        mds = cmds.shadingNode("multiplyDivide", asUtility=True, n=mdsNode_Name)
  
        cmds.setAttr(mds+'.operation', 2) #divide
        cmds.connectAttr(curveInfoNode+'.arcLength', mds+'.input1X')
        #cmds.connectAttr(curveInfoNode+'.arcLength', mda+'.input2X')
        crvLen = cmds.getAttr(curveInfoNode+'.arcLength')
        print crvLen
        cmds.setAttr(mds+'.input2X', crvLen)
       
        # Connect stretch to joints
        for i in range(len(self.jnt_info['iksJnts'])-1):
            cmds.connectAttr(mds+'.outputX', self.jnt_info['iksJnts'][i]+'.sx')


        cmds.rename(curveInfoNode, userDefinedName+'_curveInfo')
        
        




            

            

        




 