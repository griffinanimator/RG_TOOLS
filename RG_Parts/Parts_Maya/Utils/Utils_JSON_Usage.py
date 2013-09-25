""" 
Use Examples

# Lets collect some info to a dictionary and write to json
# How can you collect this info from your maya scene?
# You would want to query the names and positions of all locators and store in a dictionary
filename = 'R:/Maya/Data/CharacterA_JointInfo.json'
lctrInfo = {}
lctrInfo['names'] = ('lctr_l_Root', 'lctr_l_arm1', 'lctr_l_arm2', 'lctr_l_wrist')
lctrInfo['positions'] = ([0.0, 5.0, 0.0], [0.0, 4.0, 0.0], [0.0, 2.0, 1.0], [0.0, 0.0, 0.0])
JsonUtils.writeJson(filename, lctrInfo)
 
# Now you have a character definition that can be read at any time.
# Read the data
data = JsonUtils.readJson(filename)
print json.loads( data )
lctrInfo = json.loads( data )
print lctrInfo['names']
print lctrInfo['positions']
 
# You can send this info to hinge_lyt
import Maya.Modules.Layout.Hinge_Lyt as Hinge_Lyt
reload(Hinge_Lyt)
Hinge_Lyt = Hinge_Lyt.Hinge_Lyt()
Hinge_Lyt.hinge_lyt(lctrInfo['names'], lctrInfo['positions'])



import Utils.Utils_JSON as utils_json

# Define a path to the data file
filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
partInfo = {}
tmpDict = {}

# Define some data to save

# Leg
tmpDict['rootname'] = ('leg')
tmpDict['names'] = ('hip', 'knee', 'ankle', 'ball', 'toe', 'heel')
tmpDict['positions'] = ([1.0, 5.0, 0.0], [1.0, 3.0, 1.0], [1.0, 1.0, 0.0], [1.0, 0.5, 1.0], [1.0, 0.0, 2.0], [1.0, 0.0, -1.0], [1.0, 0.0, -1.5])
tmpDict['jointnames'] = ('jnt_s_hip', 'jnt_s_knee', 'jnt_s_ankle', 'jnt_s_ball')
tmpDict['pjntnames'] = (['pjnt_s_hip', 'pjnt_s_hipEnd'], ['pjnt_s_knee', 'pjnt_s_kneeEnd'], ['pjnt_s_ankle', 'pjnt_s_ankleEnd'], ['pjnt_s_ball', 'pjnt_s_ballEnd'], ['pjnt_s_toe', 'pjnt_s_toeEnd'], ['pjnt_s_heel', 'pjnt_s_heelEnd'])
tmpDict['fkcontrol'] = ('ctrl_s_hip', 'ctrl_s_knee', 'ctrl_s_ankle', 'ctrl_s_ball', 'ctrl_s_toe')
tmpDict['partcontrols'] = (['pctrl_s_hip', 'pctrl_s_hipEnd'], ['pctrl_s_knee', 'pctrl_s_kneeEnd'], ['pctrl_s_ankle', 'pctrl_s_ankleEnd'], ['pctrl_s_ball', 'pctrl_s_ballEnd'], ['pctrl_s_toe', 'pctrl_s_toeEnd'], ['pctrl_s_heel', 'pctrl_s_heelEnd'])
tmpDict['ikcontrol'] = ('ctrl_s_leg')
tmpDict['setcontrol'] = ('ctrl_s_leg_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Leg'] = tmpDict

tmpDict = {}

# Arm
tmpDict['rootname'] = ('arm')
tmpDict['names'] = ('shoulder', 'elbow', 'wrist')
tmpDict['positions'] = ([2.0, 8.0, 0.0], [4.0, 8.0, -1.0], [6.0, 8.0, 0.0], [8.0, 8.0, 0.0])
tmpDict['jointnames'] = ('jnt_s_shoulder', 'jnt_s_elbow', 'jnt_s_wrist')
tmpDict['pjntnames'] = (['pjnt_s_shoulder', 'pjnt_s_shoulderEnd'], ['pjnt_s_elbow', 'pjnt_s_elbowEnd'], ['pjnt_s_wrist', 'pjnt_s_wristEnd'])
tmpDict['fkcontrols'] = ('ctrl_s_shoulder', 'ctrl_s_elbow', 'ctrl_s_wrist')
tmpDict['partcontrols'] = (['pctrl_s_shoulder', 'pctrl_s_shoulderEnd'], ['pctrl_s_elbow', 'pctrl_s_elbowEnd'], ['pctrl_s_wrist', 'pctrl_s_wristEnd'])
tmpDict['ikcontrol'] = ('ctrl_s_arm')
tmpDict['setcontrol'] = ('ctrl_s_arm_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Arm'] = tmpDict

tmpDict = {}

# Spine
tmpDict['rootname'] = ('spine')
tmpDict['names'] = ('pelvis', 'spine1', 'spine2', 'spine3', 'spine4')
tmpDict['positions'] = ([0.0, 6.0, 0.0], [0.0, 7.0, 0.0], [0.0, 8.0, 0.0], [0.0, 9.0, 0.0], [0.0, 10.0, 0.0], [0.0, 11.0, 0.0])
tmpDict['jointnames'] = ('jnt_s_hip', 'jnt_s_spine1', 'jnt_s_spine2', 'jnt_s_spine3', 'jnt_s_spine4')
tmpDict['pjntnames'] = (['pjnt_s_hip', 'pjnt_s_hipEnd'], ['pjnt_s_spine1', 'pjnt_s_spine1End'], ['pjnt_s_spine2', 'pjnt_s_spine2End'], ['pjnt_s_spine3', 'pjnt_s_spine3End'], ['pjnt_s_spine4', 'pjnt_s_spine4End'])
tmpDict['fkcontrols'] = ('ctrl_s_hip', 'ctrl_s_spine1', 'ctrl_s_spine2', 'ctrl_s_spine3', 'ctrl_s_spine4')
tmpDict['partcontrols'] = (['pctrl_s_hip', 'pctrl_s_hipEnd'], ['pctrl_s_spine1', 'pctrl_s_spine1End'], ['pctrl_s_spine2', 'pctrl_s_spine2End'], ['pctrl_s_spine3', 'pctrl_s_spine3End'], ['pctrl_s_spine4', 'pctrl_s_spine4End'])
tmpDict['ikcontrol'] = ('ctrl_s_arm')
tmpDict['setcontrol'] = ('ctrl_s_arm_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Spine'] = tmpDict

# Writ to the file
utils_json.writeJson(filename, partInfo)

"""