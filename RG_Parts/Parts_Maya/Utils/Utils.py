# General utility functions
import maya.cmds as cmds

def findHighestTrailingNumber(names, basename):
    import re
       
    highestValue = 0
    
    for n in names:
        print n
        print basename
        if n.find(basename) == 0:

            suffix = n.partition(basename)[2]
            if re.match("^[0-9]*$", suffix):
                print suffix
                numericalElement = int(suffix)
                
                if numericalElement > highestValue:
                    highestValue = numericalElement
             
    return highestValue


def tempParent(self, *args):
    print 'tp'
    sel = cmds.ls(sl=True)
    constraint = cmds.parentConstraint(sel[0], sel[1], mo=False)
    cmds.delete(constraint)