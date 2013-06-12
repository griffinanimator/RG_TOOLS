import maya.cmds as cmds

import System.widgetUtils as widget_utils
reload(widget_utils)

CLASS_NAME = "Create_Spine"

TITLE = "Spine"
DESCRIPTION = "Create a spine rig"

class Create_Spine:
  
    def __init__(self):
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.spine_info = {}
        # Path to the control objects
        self.ctrlPath = "C:/Users/Griffy/Google Drive/RG_ARTTOOLS/RG_Parts/Parts_Maya/Controls/"

    def install(self, *args):
        print "install"

        """
        # Collect layout info
    	lytObs = widget_utils.collectLayoutInfo()
        self.lyt_info['layoutObjs'] = lytObs[0]
        self.lyt_info['layoutRoot'] = lytObs[1]

        # Find the side we are on
        side = widget_utils.getSide(self.lyt_info['layoutRoot'])

        # Create an ik joint chain
    	self.jnt_info['iksJnts'] = widget_utils.createJoints('iksj_', self.lyt_info['layoutObjs'])
        self.jnt_info['ikrJnts'] = widget_utils.createJoints('ikrj_', self.lyt_info['layoutObjs'])

        # Draw a splineIK from the root to the last iksJnt.
        print self.jnt_info['iksJnts']
        spl = len(self.jnt_info['iksJnts']) -1
        print spl

        ikSol = cmds.ikHandle(n='iks_spine_Ik', solver='ikSplineSolver', sj=self.jnt_info['iksJnts'][0], ee=self.jnt_info['iksJnts'][spl], ccv=True, )
        print ikSol

        """

# Create a new joint at the root and the top of the iksJoint chain.

# Bind the splineIK curve to those 2 new joints.
