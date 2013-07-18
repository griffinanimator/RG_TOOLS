# General utility functions

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