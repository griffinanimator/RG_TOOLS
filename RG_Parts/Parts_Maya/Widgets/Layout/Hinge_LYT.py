import maya.cmds as cmds
import os
import RG_Parts.Parts_Maya.Utils.Utils_Part as partUtils

CLASS_NAME = "Hinge_LYT"

TITLE = "Hinge"
DESCRIPTION = "Create a hinge LYT"
#ICON = os.environ["GEPPETTO"] + "/Icons/singleChain_button.bmp"

class Hinge_LYT:

    def __init__(self):
        print "In BuildArm"
        # Dictionary to store info about the layout object
        self.lyt_info = {}
        self.jnt_info = {}
        self.arm_info = {}
        # Path to the control objects
        self.ctrlPath = "C:/Users/Griffy/Google Drive/RG_ARTTOOLS/RG_Parts/Parts_Maya/Controls/"

    def install(self, *args):
        print "Hinge"
		# create a hierachy of parts
		# Parent them under a master control
		# Name the parts
		# Put the parts into a namespace
		# Put the parts into an asset