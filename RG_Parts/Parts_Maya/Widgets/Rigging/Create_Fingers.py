import maya.cmds as cmds

attrs = ('Arch', 'Splay', 'Fist', 'Split', 'Shear', 'Spread', 'Curl', 'Flex', 'Neutral', 'Thumb_Spread', 'Thumb_Curl', 'Slide', 'Scrunch', 'Thumb_Scrunch')

fingers = ('Finger1', 'Finger2', 'Thumb')
numJoints = 3

controler = 'ctrl_r_arm'

for a in attrs:
    cmds.addAttr(controler, shortName=a, longName=a, defaultValue=0, k=True)
    
for i in range(len(fingers)):
    attrName = (fingers[i] + '_Spread')
    cmds.addAttr(controler, shortName=attrName, longName=attrName, defaultValue=0, k=True)
    
for each in fingers:
    print each
    for i in range(numJoints):
        print i
        attrName =  (each + '_' + str(i) + 'Bend')
        cmds.addAttr(controler, shortName=attrName, longName=attrName, defaultValue=0, k=True)
  
  
newList1 = ('Bone_L_Finger0', 'Bone_L_Finger01', 'Bone_L_Finger02', 'Bone_L_Finger1', 'Bone_L_Finger11', 'Bone_L_Finger12', 'Bone_L_Finger2', 'Bone_L_Finger21', 'Bone_L_Finger22')   
newList2 = ('Bone_R_Finger0', 'Bone_R_Finger01', 'Bone_R_Finger02', 'Bone_R_Finger1', 'Bone_R_Finger11', 'Bone_R_Finger12', 'Bone_R_Finger2', 'Bone_R_Finger21', 'Bone_R_Finger22')   
for each in newList1:

    name = each.replace('Bone', 'Grp')
    ctrlName = each.replace('Bone', 'Ctrl')
    pos = cmds.xform(each, q=True, ws=True, t=True)
    rot = cmds.xform(each, q=True, ws=True, ro=True)

    grp = cmds.group(name=name, em=True)
    cmds.xform(grp, ws=True, t=pos)
    cmds.xform(grp, ws=True, ro=rot)
    c=cmds.circle(n=ctrlName, nr=(0, 0, 1), c=(0, 0, 0), sw=360, r=.4 )
    cmds.xform(c, ws=True, t=pos)
    cmds.xform(c, ws=True, ro=rot)
    print c
    cmds.parent(c, grp)
    cmds.makeIdentity(c)
    
    
    
        
cmds.circle( nr=(0, 0, 1), c=(0, 0, 0), sw=360, r=.4 )   
