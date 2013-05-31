import maya.cmds as cmds
 
import csv
 
""" Path to the csv file """
# Change this path
csvPath = "/User/TestCsv.csv"
 
def csvRead():
 
    """ Open the csv """
 
    reader = csv.reader(open(csvPath, 'rb'), delimiter=',', quotechar='"')
 
    """ Read each row in the TestCsv """
 
    for row in reader:
 
        print row
 
        print row[0]
 
        print row[1]
 
""" Run the csvRead function """
 
csvRead()