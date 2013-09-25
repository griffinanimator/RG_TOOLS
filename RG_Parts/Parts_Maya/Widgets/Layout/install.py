import maya.cmds as cmds
import json
import tempfile

def install(part, dm, *args):
    # NOTE:  I do a bunch of renaming that should be done by editing the dict entries
    # List to hold pcontrols
    pctrls = []
    pjntList = []
    partNodes = []
    # List for hidden nodes
    hideList = []
    # See if the namespace exists.
    cmds.namespace(set=':')
    if cmds.namespace(ex=part) == True:
        # This is the place to do the gen new name thing
        return
    else:
        part = part
    # Move into a new namespace
    cmds.namespace(add=part)
    cmds.namespace(set=part)
    
    # Read the JSON file and store data to dict
    data = readJson(filename)
    info = json.loads( data )
    partInfo = info[part]
    """
    for key, value in partInfo.iteritems() :
        print key, value
    """
    
    # Build the layout object from JSON Data
    # Create a root controller
    ctrlName = 'ctrl_' + dm + partInfo['rootname']
    ctrl = cmds.circle(n=ctrlName, nr=(1, 0, 0), c=(0, 0, 0), r=2.0 )
    ctrlGrp = cmds.group(n='grp_'+ ctrlName)
    

    for n in range(len(partInfo['names'])):       
        # New namespace
        #cmds.namespace(add=partInfo['partnames'][n])
        # Create the joints
        cmds.select(d=True)
        pjntRootName = partInfo['pjntnames'][n][0].replace('_s_', dm)
        pjntEndName = partInfo['pjntnames'][n][1].replace('_s_', dm)
        pjntRoot = cmds.joint(n=pjntRootName, p=partInfo['positions'][n])
        pjntEnd = cmds.joint(n=pjntEndName, p=partInfo['positions'][n+1])
        pjntList.append(pjntRoot)
        pjntList.append(pjntEnd)
        
        if n == 0:
            tmpConstraint = cmds.parentConstraint(pjntRoot, ctrlGrp, mo=False)
            cmds.delete(tmpConstraint) 
            partNodes.append(ctrlGrp)
        
        # Orient the joints
        cmds.joint(pjntRoot, e=True, oj=partInfo['jntorient'][0], sao=partInfo['jntorient'][1])
        
        # Generate a suffix
        # NOTE: put this in JSON
        suffix = partInfo['names'][n]
        
        # Create ik
        ikH = cmds.ikHandle(n='ikh_'+ dm + suffix, sj=pjntRoot, ee=pjntEnd, sol="ikRPsolver")
        hideList.append(ikH[0]) 
        
        # Stretch ----------------------------------------------------------
        mdEStretch = cmds.shadingNode("multiplyDivide", asUtility=True, n='mdNode_EStretch_' + dm + suffix)
        hideList.append(mdEStretch)
        cmds.select(d=True)
        # NOTE: I need to change disDim transform name    
        lctrR = cmds.spaceLocator(n='lctrDis_Root_' + dm + suffix, p=partInfo['positions'][n], a=True)
        lctrE = cmds.spaceLocator(n='lctrDis_End_' + dm + suffix, p=partInfo['positions'][n+1], a=True)
        disDim = cmds.distanceDimension(sp=(partInfo['positions'][n]), ep=(partInfo['positions'][n+1]))
        hideList.append(lctrR[0]) 
        hideList.append(lctrE[0]) 
        
        # Sometimes this just happens.  Silly Maya
        try:
            cmds.connectAttr(lctrR[0] + 'Shape.worldPosition[0]', disDim  + '.startPoint', f=True)
            cmds.connectAttr(lctrE[0] + 'Shape.worldPosition[0]', disDim  + '.endPoint',f=True)
        except: pass
        
        cmds.connectAttr(disDim + '.distance', mdEStretch + '.input1X')
        cmds.rename(part+':'+'distanceDimension1', 'disDimNode_Stretch'+ dm + suffix)
        hideList.append(part+':'+ 'disDimNode_Stretch'+ dm + suffix) 
        # Determine the length of the joint chain in default position
        # NOTE: The axis could change depending on orientation
        # NOTE: It may make more sence to do this with scale so we can easily connect geo
        endLen = cmds.getAttr(pjntEnd + '.tx')
        
        #Finally, we output our new values into the translateX of the knee and ankle joints.
        cmds.connectAttr( mdEStretch + '.outputX', pjntEnd  + '.tx')
        
        # Create controls and connection points
        rctrlName = partInfo['partcontrols'][n][0].replace('_s_', dm)
        rctrl = cmds.circle(n=rctrlName, nr=(1, 0, 0), c=(0, 0, 0) )
        rctrlGrp = cmds.group(n='grp_'+ rctrlName)
        cmds.parent(rctrlGrp, ctrl)
        ectrlName = partInfo['partcontrols'][n][1].replace('_s_', dm)
        ectrl = cmds.circle(n=ectrlName, nr=(1, 0, 0), c=(0, 0, 0) )
        ectrlGrp = cmds.group(n='grp_'+ ectrlName)
        cmds.parent(ectrlGrp, ctrl)
        tmpConstraint = cmds.parentConstraint(pjntRoot, rctrlGrp, mo=False)
        cmds.delete(tmpConstraint) 
        tmpConstraint = cmds.parentConstraint(pjntEnd, ectrlGrp, mo=False)
        cmds.delete(tmpConstraint)
        cmds.setAttr(rctrl[0] + '.rotate', lock=True) 
        cmds.setAttr(rctrl[0] + '.scale', lock=True) 
        cmds.setAttr(ectrl[0] + '.rotate', lock=True) 
        cmds.setAttr(ectrl[0] + '.scale', lock=True) 
        pctrls.append([rctrl, ectrlGrp])
        partNodes.append(rctrlGrp)
        partNodes.append(ectrlGrp)

        # Parent the stretch locators and ik to the controls 
        cmds.parent(lctrR, rctrl[0])
        cmds.parent(lctrE, ectrl[0])
        cmds.parent(ikH[0], ectrl[0])
        
        # If more than on layout object, parent them in a chain
        plen = len(partInfo['names'])
        cmds.parentConstraint(pctrls[n][0], pjntRoot, mo=True)
        if n > 0 and n < plen:
            cmds.parentConstraint(pctrls[n][0], pctrls[n-1][1], mo=True)
            cmds.parentConstraint(pctrls[n][0], pjntRoot, mo=True)
        if n < plen:
            hideList.append(pctrls[n-1][1])
            
        # Hide and lock nodes
        # NOTE: Getting double nodes
    for each in hideList:
        try:
            cmds.setAttr(each + '.visibility', 0, l=True)
        except: pass
        partNodes.append(each)
    for each in pjntList:
        cmds.setAttr(each + '.overrideEnabled', 1)
        cmds.setAttr(each + '.overrideDisplayType', 1) 
        partNodes.append(each)
        
    # Create a container and add stuff
    con = cmds.container(n=part + dm + 'AST') 
    for each in partNodes:
        cmds.container(con, e=True, an=each, ihb=True, iha=True, inc=True)

    # Reset the namespace to default
    cmds.namespace(set=':')


"""
This will run install
"""
part = 'arm'
# the part arg will be the name of the layout you want to build.
# dm is some extra name like the side "L" or "R".  If the dm exists, generate a new dm.
dm =  '_L_01_'
# Example call to install
install(part, dm)     