import maya.cmds as cmds
import json
import tempfile

def writeJson(fileName, data):

	with open(fileName, 'w') as outfile:
		json.dump(data, outfile)

	file.close(outfile)

def readJson(fileName):
    with open(fileName, 'r') as infile:
        data = (open(infile.name, 'r').read())
    return data



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

"""
