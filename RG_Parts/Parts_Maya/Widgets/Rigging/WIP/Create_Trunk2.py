# Draw the joints
# Selct the joints and save to a list
rJntList = []
sel = cmds.ls(sl=True)
cmds.select(d=True) 
rJntList.append(sel)

loftSurface(rJntList)

createAndGrpBindJoint(rJntList)

createPOSNodes(rJntList)

# TODO: Create folicles
# TODO: Create controls
ctrls = cmds.ls(sl=True, type='transform')



def loftSurface(sel):
    crvList = []  
    posList = collectPosInfo(sel)
    crvA = drawCurves(posList, 0.1)
    crvList.append(crvA)
    crvB = drawCurves(posList, 0.1)
    crvList.append(crvB)
    surf = cmds.loft(crvList[0], crvList[1], ch=1, u=1, c=0, ar=1, d=3, ss=1, rn=0, po=0, rsn=True)
    return surf

def collectPosInfo(sel):
    posList = []
    for i in sel:
        pos = cmds.xform(i, q=True, ws=True, t=True)
        posList.append(pos)
        
    return posList


def drawCurves(positions, offset):
    posList = []
    for each in positions:
        posList.append([offset, each[1], each[2]])
    crv = cmds.curve( p=posList )
    return crv

def createAndGrpBindJoints(sel):
    for jnt in sel:
        jntPos = cmds.xform(jnt, q=True, ws=True, t=True)
        grpCount = 3
        grpList = []
        
        for g in range(grpCount):
            grpName = jnt.replace('joint', 'grp_jnt' + str(g) + '_' )
            grpPos = cmds.xform(jnt, q=True, ws=True, t=True)
            grp = cmds.group(name=grpName, em=True)
            cmds.xform(grp, ws=True, t=grpPos)
            grpList.append(grp)
            if g != 0:
                cmds.parent(grp, grpList[g-1])
            if g == 2:
                cmds.parent(jnt, grpList[2])
       
                
        bindJntName = ('bind_' + jnt)
        bjnt = cmds.joint(name=bindJntName, p=jntPos)
        cmds.parentConstraint(jnt, bjnt, mo=True)

        return grpList


def createPOSNodes(sel):
    # Create point on surface nodes.
    posNodes = []
    for jnt in sel:
        p = cmds.xform(jnt, q=True, ws=True, t=True)   
        cpsNode_name = ('posNode' + jnt)
        cpsNode = cmds.shadingNode("closestPointOnSurface", asUtility=True,  n=cpsNode_name) 
        cmds.connectAttr('loftedSurfaceShape1.worldSpace', cpsNode + '.inputSurface')
        cmds.setAttr(cpsNode + '.inPositionX', p[0])
        cmds.setAttr(cpsNode + '.inPositionY', p[1])
        cmds.setAttr(cpsNode + '.inPositionZ', p[2])
        posNodes.append(cpsNode)
    return posNodes

def connectControlToFolicle(sel):
    for each in ctrls:
        pmaNode_name = each.replace('ctrl_', 'pmaNode_')
        folNode = ('follicle_' + each)
        pval = cmds.getAttr(folNode + '.parameterU')
        
        print pval
        pmaNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaNode_name)
        cmds.setAttr(pmaNode + '.input1D[2]', pval)
        cmds.addAttr(each, shortName='position', longName='position', minValue=0, maxValue=1, defaultValue=0, k=True)
        cmds.addAttr(each, shortName='falloff', longName='falloff', minValue=0, maxValue=1, defaultValue=0, k=True)
        cmds.addAttr(each, shortName='number_joints', longName='number_joints', minValue=0, maxValue=1, defaultValue=0, k=True)
        cmds.connectAttr(each + '.position', pmaNode + '.input1D[1]')
        #grpName = ('grp_' + each)
        cmds.connectAttr(pmaNode + '.output1D', folNode + '.parameterU')
        cmds.setAttr(pmaNode + '.operation', 1)

def setupFalloff():
    #Setup falloff
    mdivNode_name = each.replace('ctrl_', 'mdivNode_')
    mdivNode = cmds.shadingNode("multiplyDivide", asUtility=True, n=mdivNode_name)
    cmds.setAttr(mdivNode + '.input2X', 2)
    srNode_name = each.replace('ctrl_', 'srNode_')
    srNode = cmds.shadingNode("setRange", asUtility=True, n=srNode_name)
    cmds.connectAttr(mdivNode + '.outputX', srNode + '.valueX')
    cmds.connectAttr(srNode + '.outValueX', each + '.number_joints')
    
    # Find controls position on surface and subtract falloff value
    pmaPosANode_name = each.replace('ctrl_', 'pmaPosANode_')
    pmaPosANode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaPosANode_name)
    
    pmaLessANode_name = each.replace('ctrl_', 'pmaLessANode_')
    pmaLessANode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaLessANode_name)
    
    pmaGrtANode_name = each.replace('ctrl_', 'pmaGrtANode_')
    pmaGrtANode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaGrtANode_name)
    
    mdivLessNode_name = each.replace('ctrl_', ' mdivLessNode_')
    mdivLessNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n= mdivLessNode_name)
    
    
    ###########################################
    pmaPosBNode_name = each.replace('ctrl_', 'pmaPosBNode_')
    pmaPosBNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaPosBNode_name)
    
    pmaLessBNode_name = each.replace('ctrl_', 'pmaLessBNode_')
    pmaLessBNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaLessBNode_name)
    
    pmaGrtBNode_name = each.replace('ctrl_', 'pmaGrtBNode_')
    pmaGrtBNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n=pmaGrtBNode_name)
       
    mdivGrtNode_name = each.replace('ctrl_', ' mdivGrtNode_')
    mdivGrtNode = cmds.shadingNode("plusMinusAverage", asUtility=True, n= mdivGrtNode_name)
    


    cmds.connectAttr(each + '.position', pmaPosANode + '.input1D[0]')
    cmds.connectAttr(each + '.falloff', pmaPosANode + '.input1D[1]')
    cmds.setAttr(pmaPosANode + '.operation', 2)
    cmds.connectAttr(pmaPosANode + '.output1D', pmaLessANode + '.input1D[1]') 