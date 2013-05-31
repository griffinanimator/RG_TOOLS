import os
import sys
import maya.cmds as cmds


def findAllFiles(fileDirectory, fileExtension):
    # Return a list of all file names, excluding the file extension
    print fileDirectory
    allFiles = os.listdir(fileDirectory)
    
    # Refine all files, listing only those of the specified file extension
    returnFiles = []
    for f in allFiles:
        splitString = str(f).rpartition(fileExtension)
        
        if not splitString[1] == "" and splitString[2] == "":
            returnFiles.append(splitString[0] + fileExtension)

    return returnFiles