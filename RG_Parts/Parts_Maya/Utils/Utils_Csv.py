""" csv_utils.py """
""" Author: Ryan Griffin 2011 """
""" Functions saving and loading data from .csv format """

import maya.cmds as cmds
import csv

def csvWrite():
    """ This is the path where the csv will be written.  Change this to a path on your local machine. """
    path = "R:/System/CSV_files/armCsv.csv" 
    
    """ Open the csv in maya for writing """
    writer = csv.writer(open(path, 'wb'), delimiter=',')
    
    """ Create a new list based off your selection """
    selectionList = cmds.ls(sl=True)
   
    """ Clear the selection """
    cmds.select(clear=True)
  
    for selection in selectionList:
        """ An empty list to hold both the joint names and the positions """
        jointInfo = []
  
        pos = cmds.xform(selection, q=True, t=True, ws=True)
       
        """ Append the name of the locator and it's position to a new list"""  
        """ I am splitting the positions into seperate variables to make things easier when I try read them later """     
        jointInfo.append(selection)
        jointInfo.append(pos[0])
        jointInfo.append(pos[1])
        jointInfo.append(pos[2])
        """ At this point you could use the joint info to build joints """
        """ Write the data to csv """
        writer.writerow(jointInfo)

    """ Print the joint info so you can see what is happening """
    print jointInfo
    


def csvRead(path):
    
    """ Empty lists to store name and position info """
    
    nodeInfo = []
    
    """ Open the csv """
    reader = csv.reader(open(path, 'rb'), delimiter=';', quotechar='"')
    
    """ Read each row in the csv to get the name and position """
    """ I will talk more about cvs in the forum, but for now just know that it returns values in a way that is not friendly with creating a list """
    """ Because of this I will be doing some formatting. """
    for row in reader:
        """ Get the value from the row and split it into variables we can use to build joints """
        positions = []
        nodeName = row[0]
        for i in range(len(row)):
        	if i != 0:
        		positions.append(row[i])
 
        """ Append the values to lists outside the for loop """
        nodeInfo.append([nodeName, positions])      

    """ return the list for use in another function """    
    return (nodeInfo)