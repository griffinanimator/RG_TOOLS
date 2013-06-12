import maya.cmds as cmds

import System.widgetUtils as widget_utils
reload(widget_utils)

CLASS_NAME = "Create_Arm"

TITLE = "Arm"
DESCRIPTION = "Create an arm rig"
#ICON = os.environ["GEPPETTO"] + "/Icons/singleChain_button.bmp"

class Create_Arm:
  
    def __init__(self):
        print "In BuildArm"
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.arm_info = {}
        # Path to the control objects
        self.ctrlPath = "C:/Users/Griffy/Google Drive/RG_ARTTOOLS/RG_Parts/Parts_Maya/Controls/"

    def install(self, *args):
        print "Install"

        """
        # Collect layout info
    	lytObs = widget_utils.collectLayoutInfo()
        self.lyt_info['layoutObjs'] = lytObs[0]
        self.lyt_info['layoutRoot'] = lytObs[1]

        # Find the side we are on
        side = widget_utils.getSide(self.lyt_info['layoutRoot'])

        # Create an ik joint chain
    	self.jnt_info['ikJnts'] = widget_utils.createJoints('ikj_', self.lyt_info['layoutObjs'])

        # Define names for components involved in ik setup
        ikHandleName = "ikHandle_%s_arm" % (side)
        ctrlName = "ctrl_%s_arm" % (side)

        pvName = "pv_%s_arm" % (side)
        suffix = "%s_arm" % (side)

        # Define foot attribute names
        ctrlAttrs = ('twist', 'stretch', 'twist_offset')
        armControl = widget_utils.setupControlObject("ArmControl.ma", ctrlName, ctrlAttrs, self.lyt_info['layoutObjs'][2][1], self.ctrlPath)

        # Create the stretchy ik chain
        ikInfo = widget_utils.createStretchyIk(armControl, ikHandleName, pvName, suffix, self.jnt_info['ikJnts'], self.lyt_info['layoutObjs']  )

        # Setup the ik foot
      
        ikJntPos = []
        for jnt in self.jnt_info['ikJnts']:
            pos = cmds.xform(jnt, q=True, t=True, ws=True)
            ikJntPos.append(pos)
        self.arm_info['armInfo'] = self.setupArm(suffix, armControl[1], ikJntPos, ikHandleName)
        """


    def setupFoot(self, suffix, footControl, ikJntPos, ikHandleName, *args):
        print 'In Setup Arm'