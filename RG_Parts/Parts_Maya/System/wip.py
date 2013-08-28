jntGrp = partParent[0].replace('PartRoot', 'PartJoints')
        partJoints = cmds.listRelatives(jntGrp, c=True, type='joint')
        print partJoints

        partRoot = Utils_Part.rigNodeRoot(numParts, userDefinedName, pos, num)

        tmpMirorJnts = []
        tmpNodes = []
        pos = []
        for each in partJoints:
            j = cmds.mirrorJoint(each, mirrorYZ=True, mirrorBehavior=True, searchReplace=('_l', '_r') ) 
            tmpMirorJnts.append(j[0])
            tmpNodes.append(j)

            p = cmds.xform(j[0], q=True, ws=True, t=True)
            pos.append(p)
        
        numParts = len(partJoints)   
        parts = Utils_Part.rigNode(userDefinedName, numParts, partRoot, pos, num)



