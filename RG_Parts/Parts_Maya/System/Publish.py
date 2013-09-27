import maya.cmds as cmds
import json
import tempfile
import Utils.Utils_JSON as utils_json
reload(utils_json)

import System.RigPart_Install as rigpart_install
reload(rigpart_install)
rigpart_install = rigpart_install.RigPart_Install()


charDef = {}

outfile = 'Z:/RG_Parts/Parts_Maya/Data/CharacterData/Layout_Defs_Flynn.json'
filename = 'Z:/RG_Parts/Parts_Maya/Widgets/Layout/Layout_Defs_New.json'

data = utils_json.readJson(filename)
info = json.loads( data )

def generateGameSkel(*args):
    data = utils_json.readJson(outfile)
    info = json.loads( data )

    jntDataList = []
    cmds.select(d=True)
    for key, value in info.iteritems():
        for j in range(len(value['jointnames'])):
            cmds.joint(name=value['jointnames'][j], p=value['positions'][j])

def rigIt(*args):
    lst=[]
    data = utils_json.readJson(outfile)
    info = json.loads( data )
    for key in info.iteritems():
        lst.append(key)
    for each in lst:
        rigpart_install.install(each)

        
    

def collectAST_Info(*args):
    AST_INFO = {}
    astName_list = []
    assets = cmds.ls(type='container')
    for c in assets:
        if c.endswith('_AST') == True:
            astName_list.append(c)
            
    # Collect info about each asset
    
    for a in astName_list:
        tmpDict = {}
        
        # Pull in info regarding base part from JSON.
        tns = a.partition(':')
        namespace = tns[0]+tns[1]  # Arm_L_01_:
        part = namespace.partition('_')[0] # Arm
        basename = namespace.replace(':', '')
       
        partInfo = info[part]

        # NOTE:  Some of the original JSON info like position, may have been changed
        """ Collect these keys...
        'partcontrols'
        'fkcontrols'
        'jntorient'
        'positions'
        'pjntnames'
        'jointnames'
        'setcontrol'
        'rootname'
        'names'
        'ctrlro'
        'ikcontrol'
        """
        tmpDict['partcontrols'] = partInfo['partcontrols']
        tmpDict['fkcontrols'] = partInfo['fkcontrols']
        tmpDict['jntorient'] = partInfo['jntorient']
        #tmpDict['positions'] = partInfo['positions']
        tmpDict['pjntnames'] = partInfo['pjntnames']
        tmpDict['jointnames'] = partInfo['jointnames']
        tmpDict['setcontrol'] = partInfo['setcontrol']
        tmpDict['rootname'] = partInfo['rootname']
        tmpDict['names'] = partInfo['names']
        tmpDict['ctrlro'] = partInfo['ctrlro']
        tmpDict['ikcontrol'] = partInfo['ikcontrol']
        tmpDict['namespace'] =  namespace
        jntPosList = []
        for p in range(len(partInfo['pjntnames'])):
            jntRoot = namespace+partInfo['pjntnames'][p][0]
            rootPos = cmds.xform(jntRoot, q=True, ws=True, t=True)
            jntPosList.append(rootPos)
            if p == len(partInfo['pjntnames']):
                jntEnd = namespace+partInfo['pjntnames'][p][1]
                endPos = cmds.xform(jntEnd, q=True, ws=True, t=True)
                jntPosList.append(endPos)
           
        tmpDict['positions']=jntPosList
        il = cmds.getAttr(a + '.in_link')
        ol =cmds.getAttr(a + '.out_link')
        tmpDict['links']=[il, ol]
        
        charDef[a]=tmpDict
    # Write to the file
    utils_json.writeJson(outfile, charDef)
        
collectAST_Info()
#generateGameSkel()
rigIt()