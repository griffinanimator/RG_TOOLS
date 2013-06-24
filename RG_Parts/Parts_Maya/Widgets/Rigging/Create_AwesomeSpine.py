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
        self.jnt_info['ikJnts'] = part_utils.createJoints('ikj_', lytObs)

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
        for j in range(spl):
            cmds.pointConstraint(self.jnt_info['iksJnts'][j], self.jnt_info['ikrJnts'][j], mo=True)

        # Create a locator for each ikh
        for i in range(spl):
            bPos = cmds.xform(self.jnt_info['iksJnts'][i], q=True, ws=True, t=True)
            nPos = [bPos[0], bPos[1], bPos[2]+1.0]
            lctr = cmds.spaceLocator(name='lctr_'+self.jnt_info['iksJnts'][i], a=True)
            cmds.xform(lctr, ws=True, t=nPos)
            grp = cmds.group(name='grp_lctr_'+self.jnt_info['iksJnts'][i], em=True)
            cmds.xform(grp, ws=True, t=bPos)
            cmds.parent(lctr, grp)
            # Create pole vector constraints
            print ikHandles[i]
            cmds.poleVectorConstraint(lctr, ikHandles[i][0])
            cmds.parent(grp, self.jnt_info['iksJnts'][i]) 
            cmds.makeIdentity( grp, apply=True )

        # Create PMA nodes to control the twist
        # NOTE:  This is tricky if we want to allow for more joints.  For now I am coding for 5 but need a solution for more.
        pma_nodes = []
        for i in range(spl-1):
            if spl > 4: 
                print " I currently only support 5 joints"
                return
            else:
                pmaNode_Name = self.jnt_info['iksJnts'][i].replace('ikSj', 'pmaTwist_') 
                pma = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaNode_Name)
                cmds.setAttr(pma+'.operation', 3) #average
                pma_nodes.append(pma)


            # Now connect the Pma
            #cmds.connectAttr()
            self.jnt_info['rootJnts']




            print self.jnt_info['twistPma']

            

        




 