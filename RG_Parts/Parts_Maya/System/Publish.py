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

def collectConnectionInfo(*args):
    connection_info = {}
    tmpCtrlList = []
    tmpJntList = []
    data = utils_json.readJson(outfile)
    info = json.loads( data )
    # This itterates through the dictionary to see if a link exists
    for key, value in info.iteritems():
        inLink = value['links'][0]
        asset = value['links'][1]
        # If a link exists we need to find coresponding joint and control
        if value['links'][0] != None:
            ns = inLink.partition(':')
            namespace = ns[0] + ns[1]
        if value['links'][1] != None:
            pinfo = info[asset]
            
            for i in range(len(pinfo['partcontrols'])):
                pjnt = inLink.partition(':')[2]
                if pjnt in pinfo['partcontrols'][i]:
                    index = i 

            pinfo = info[asset]
            pinfo['fkcontrols']
            print index
            linkControl = pinfo['fkcontrols'][index] 
            linkJnt = pinfo['jointnames'][index]

            # NOTE:  All of that previous shit seems error prone and difficult.  Find a new way.
            # Find the Part_Link  
            rigcontainer = value['rigcontainer']
            partLink = rigcontainer.replace('Rig_Container', 'Part_Link') 

            rootJnt = value['jointnames'][0] 
            
            tmpJntList.append([linkJnt, rootJnt]) 
            tmpCtrlList.append([linkControl, partLink])
                    
    connection_info['ctrls'] = tmpCtrlList
    connection_info['jnts'] = tmpJntList
    print connection_info
  
    return connection_info        
""" 
for key in info.keys():
   print "key: %s , value: %s" % (key,info[key])          
"""      

def makeConnections(*args):
    connectionInfo = collectConnectionInfo()
    for i in range(len(connectionInfo['jnts'])):
        cmds.parent(connectionInfo['jnts'][i][1],connectionInfo['jnts'][i][0])
        cmds.parentConstraint(connectionInfo['ctrls'][i][0], connectionInfo['ctrls'][i][1])
        
          

def generateGameSkel(*args):
    data = utils_json.readJson(outfile)
    info = json.loads( data )

    jntDataList = []
    
    for key, value in info.iteritems():
        cmds.select(d=True)
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
        dm = ('_' + basename.partition('_')[2])
        print dm
      
        partInfo = info[part]

        rigcontainername = 'Rig_Container' + dm + partInfo['rootname']

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
        controlNameList = []
        for c in partInfo['fkcontrols']:
            newName = c.replace('_s_', dm)
            controlNameList.append(newName)
        tmpDict['fkcontrols'] = controlNameList
        tmpDict['jntorient'] = partInfo['jntorient']
        #tmpDict['positions'] = partInfo['positions']
        tmpDict['pjntnames'] = partInfo['pjntnames']
        #tmpDict['jointnames'] = partInfo['jointnames']
        jointNameList = []
        for j in partInfo['jointnames']:
            newName = j.replace('_', dm)
            jointNameList.append(newName)

        tmpDict['jointnames'] = jointNameList
        tmpDict['setcontrol'] = partInfo['setcontrol']
        tmpDict['rootname'] = partInfo['rootname']
        tmpDict['names'] = partInfo['names']
        tmpDict['ctrlro'] = partInfo['ctrlro']
        tmpDict['ikcontrol'] = partInfo['ikcontrol']
        tmpDict['namespace'] =  namespace
        tmpDict['rigcontainer'] =  rigcontainername
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
        il = cmds.getAttr(a + '.link')
        ol =cmds.getAttr(a + '.source')
        tmpDict['links']=[il, ol]
        print a
        charDef[a]=tmpDict
        
    # Write to the file
    utils_json.writeJson(outfile, charDef)
        
collectAST_Info()
#generateGameSkel()
rigIt()
generateGameSkel()
makeConnections()