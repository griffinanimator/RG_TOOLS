import Utils.Utils_JSON as utils_json

# Define a path to the data file
filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'
partInfo = {}
tmpDict = {}

# Define some data to save

# Leg
tmpDict['rootname'] = ('Leg')
tmpDict['names'] = ('hip', 'knee', 'ankle', 'ball', 'toe')
tmpDict['positions'] = ([1.0, 5.0, 0.0], [1.0, 3.0, 1.0], [1.0, 1.0, 0.0], [1.0, 0.5, 1.0], [1.0, 0.0, 2.0], [1.0, 0.0, -1.0])
tmpDict['jointnames'] = ('jnt_hip', 'jnt_knee', 'jnt_ankle', 'jnt_ball')
tmpDict['pjntnames'] = (['pjnt_hip', 'pjnt_hipEnd'], ['pjnt_knee', 'pjnt_kneeEnd'], ['pjnt_ankle', 'pjnt_ankleEnd'], ['pjnt_ball', 'pjnt_ballEnd'], ['pjnt_toe', 'pjnt_toeEnd'])
tmpDict['fkcontrols'] = ('ctrl_hip', 'ctrl_knee', 'ctrl_ankle', 'ctrl_ball', 'ctrl_toe')
tmpDict['partcontrols'] = (['pctrl_hip', 'pctrl_hipEnd'], ['pctrl_knee', 'pctrl_kneeEnd'], ['pctrl_ankle', 'pctrl_ankleEnd'], ['pctrl_ball', 'pctrl_ballEnd'], ['pctrl_toe', 'pctrl_toeEnd'])
tmpDict['ikcontrol'] = (['ctrl_s_leg', 'pv_ctrl_s_arm'])
tmpDict['setcontrol'] = ('ctrl_leg_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Leg'] = tmpDict

tmpDict = {}

# Arm
tmpDict['rootname'] = ('Arm')
tmpDict['names'] = ('shoulder', 'elbow', 'wrist')
tmpDict['positions'] = ([2.0, 8.0, 0.0], [4.0, 8.0, -1.0], [6.0, 8.0, 0.0], [8.0, 8.0, 0.0])
tmpDict['jointnames'] = ('jnt_shoulder', 'jnt_elbow', 'jnt_wrist')
tmpDict['pjntnames'] = (['pjnt_shoulder', 'pjnt_shoulderEnd'], ['pjnt_elbow', 'pjnt_elbowEnd'], ['pjnt_wrist', 'pjnt_wristEnd'])
tmpDict['fkcontrols'] = ('ctrl_shoulder', 'ctrl_elbow', 'ctrl_wrist')
tmpDict['partcontrols'] = (['pctrl_shoulder', 'pctrl_shoulderEnd'], ['pctrl_elbow', 'pctrl_elbowEnd'], ['pctrl_wrist', 'pctrl_wristEnd'])
tmpDict['ikcontrol'] = (['ctrl_s_arm', 'pv_ctrl_s_arm'])
tmpDict['setcontrol'] = ('ctrl_arm_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Arm'] = tmpDict

tmpDict = {}

# Clavicle
tmpDict['rootname'] = ('Clavicle')
tmpDict['names'] = (['clavicle'])
tmpDict['positions'] = ([1.5, 8.0, 1.0], [2.0, 8.0, 0.0])
tmpDict['jointnames'] = ('jnt_clavicle')
tmpDict['pjntnames'] = (['pjnt_clavicle', 'pjnt_clavicleEnd'])
tmpDict['fkcontrols'] = ('ctrl_s_clavicle')
tmpDict['partcontrols'] = (['pctrl_clavicle', 'pctrl_clavicleEnd'])
tmpDict['ikcontrol'] = (['ctrl_s_clavicle'])
tmpDict['setcontrol'] = ('ctrl_arm_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Clavicle'] = tmpDict

tmpDict = {}

# Head
tmpDict['rootname'] = ('Head')
tmpDict['names'] = ('neck', 'head')
tmpDict['positions'] = ([0.0, 12.0, 0.0], [0.0, 13.0, 0.0], [0.0, 14.0, 0.0])
tmpDict['jointnames'] = ('jnt_neck', 'jnt_head')
tmpDict['pjntnames'] = (['pjnt_neck', 'pjnt_neckEnd'], ['pjnt_head', 'pjnt_headEnd'])
tmpDict['fkcontrols'] = ('ctrl_s_neck', 'ctrl_s_head')
tmpDict['partcontrols'] = (['pctrl_neck', 'pctrl_neckEnd'], ['pctrl_head', 'pctrl_headEnd'])
tmpDict['ikcontrol'] = (['ctrl_s_head'])
tmpDict['setcontrol'] = ('ctrl_head_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Head'] = tmpDict

tmpDict = {}

# Root
tmpDict['rootname'] = ('Root')
tmpDict['names'] = ('ANIM', 'Motion', 'CHARACTER_ROOT')
tmpDict['positions'] = ([0.0, 0.0, 0.0], [0.0, 4.0, 0.0], [0.0, 4.0, 0.0], [0.0, 5.0, 0.0])
tmpDict['jointnames'] = ('jnt_ANIM', 'jnt_Motion', 'jnt_CHARACTER_ROOT')
tmpDict['pjntnames'] = (['pjnt_ANIM', 'pjnt_ANIMEnd'], ['pjnt_Motion', 'pjnt_MotionEnd'], ['pjnt_CHARACTER_ROOT', 'pjnt_CHARACTER_ROOTEnd'])
tmpDict['fkcontrols'] = ('ANIM_CHAR', 'Motion', 'CHARACTER_ROOT')
tmpDict['partcontrols'] = (['pctrl_ANIM', 'pctrl_ANIMEnd'], ['pctrl_Motion', 'pctrl_MotionEnd'], ['pctrl_CHARACTER_ROOT', 'pctrl_CHARACTER_ROOTEnd'])
tmpDict['ikcontrol'] = (['ctrl_s_root'])
tmpDict['setcontrol'] = ('ctrl_root_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Root'] = tmpDict

tmpDict = {}

# Finger
tmpDict['rootname'] = ('Finger')
tmpDict['names'] = ('finger1', 'finger2', 'finger3', 'finger4')
tmpDict['positions'] = ([8.5, 8.0, 0.0], [9.0, 8.0, 0.0], [9.5, 8.0, 0.0], [10.0, 8.0, 0.0], [10.5, 8.0, 0.0])
tmpDict['jointnames'] = ('jnt_finger1', 'jnt_finger2', 'jnt_finger3', 'jnt_finger4')
tmpDict['pjntnames'] = (['pjnt_finger1', 'pjnt_finger1End'], ['pjnt_finger2', 'pjnt_finger2End'], ['pjnt_finger3', 'pjnt_finger3End'], ['pjnt_finger4', 'pjnt_finger4End'])
tmpDict['fkcontrols'] = ('ctrl_s_finger1', 'ctrl_s_finger2', 'ctrl_s_finger3', 'ctrl_s_finger4')
tmpDict['partcontrols'] = (['pctrl_s_finger1', 'pctrl_s_finger1End'], ['pctrl_s_finger2', 'pctrl_s_finger2End'], ['pctrl_s_finger3', 'pctrl_s_finger3End'], ['pctrl_s_finger4', 'pctrl_s_finger4End'])
tmpDict['ikcontrol'] = (['ctrl_s_finger'])
tmpDict['setcontrol'] = ('ctrl_finger_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Finger'] = tmpDict

tmpDict = {}

# Spine
tmpDict['rootname'] = ('Spine')
tmpDict['names'] = ('pelvis', 'spine1', 'spine2', 'spine3', 'spine4')
tmpDict['positions'] = ([0.0, 6.0, 0.0], [0.0, 7.0, 0.0], [0.0, 8.0, 0.0], [0.0, 9.0, 0.0], [0.0, 10.0, 0.0], [0.0, 11.0, 0.0])
tmpDict['jointnames'] = ('jnt_pelvis', 'jnt_spine1', 'jnt_spine2', 'jnt_spine3', 'jnt_spine4')
tmpDict['pjntnames'] = (['pjnt_pelvis', 'pjnt_pelvisEnd'], ['pjnt_spine1', 'pjnt_spine1End'], ['pjnt_spine2', 'pjnt_spine2End'], ['pjnt_spine3', 'pjnt_spine3End'], ['pjnt_spine4', 'pjnt_spine4End'])
tmpDict['fkcontrols'] = ('ctrl_s_pelvis', 'ctrl_s_spine1', 'ctrl_s_spine2', 'ctrl_s_spine3', 'ctrl_s_spine4')
tmpDict['partcontrols'] = (['pctrl_pelvis', 'pctrl_pelvisEnd'], ['pctrl_spine1', 'pctrl_spine1End'], ['pctrl_spine2', 'pctrl_spine2End'], ['pctrl_spine3', 'pctrl_spine3End'], ['pctrl_spine4', 'pctrl_spine4End'])
tmpDict['ikcontrol'] = ('ctrl_spine')
tmpDict['setcontrol'] = ('ctrl_spine_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['Spine'] = tmpDict
tmpDict = {}

# chain
tmpDict['rootname'] = ('Chain')
tmpDict['names'] = ('chain1', 'chain2', 'chain3', 'chain4')
tmpDict['positions'] = ([0.0, 0.0, 0.0], [0.0, 0.0, 1.0], [0.0, 0.0, 2.0], [0.0, 0.0, 3.0], [0.0, 0.0, 4.0])
tmpDict['jointnames'] = ('jnt_chain1', 'jnt_chain2', 'jnt_chain3', 'jnt_chain4')
tmpDict['pjntnames'] = (['pjnt_chain1', 'pjnt_chain1End'], ['pjnt_chain2', 'pjnt_chain2End'], ['pjnt_chain3', 'pjnt_chain3End'], ['pjnt_chain4', 'pjnt_chain4End'])
tmpDict['fkcontrols'] = ('ctrl_s_chain1', 'ctrl_s_chain2', 'ctrl_s_chain3', 'ctrl_s_chain4')
tmpDict['partcontrols'] = (['pctrl_s_chain1', 'pctrl_s_chain1End'], ['pctrl_s_chain2', 'pctrl_s_chain2End'], ['pctrl_s_chain3', 'pctrl_s_chain3End'], ['pctrl_s_chain4', 'pctrl_s_chain4End'])
tmpDict['ikcontrol'] = (['ctrl_s_chain'])
tmpDict['setcontrol'] = ('ctrl_chain_s_settings')
tmpDict['jntorient'] = ('xyz', 'yup') 
tmpDict['ctrlro'] = ('xyz') 
partInfo['chain'] = tmpDict
tmpDict = {}

# Write to the file
utils_json.writeJson(filename, partInfo)