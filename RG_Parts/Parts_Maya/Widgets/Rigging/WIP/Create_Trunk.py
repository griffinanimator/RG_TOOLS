
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

crvList = []
sel = cmds.ls(sl=True)    
posList = collectPosInfo(sel)
print posList
crvA = drawCurves(posList, 0.1)
crvList.append(crvA)
crvB = drawCurves(posList, 0.1)
crvList.append(crvB)
print crvList

cmds.loft(crvList[0], crvList[1], ch=1, u=1, c=0, ar=1, d=3, ss=1, rn=0, po=0, rsn=True)


for jnt in sel:
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