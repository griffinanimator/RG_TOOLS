# General utility functions

def findHighestTrailingNumber(names, basename):
    import re
       
    highestValue = 0
    
    for n in names:
        if n.find(basename) == 0:
            suffix = n.partition(basename)[2]
            if re.match("^[0-9]*$", suffix):
                numericalElement = int(suffix)
                
                if numericalElement > highestValue:
                    highestValue = numericalElement
             
    return highestValue