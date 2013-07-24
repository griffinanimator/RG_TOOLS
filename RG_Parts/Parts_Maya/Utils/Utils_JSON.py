import json
import tempfile

def writeJson(fileName, data):

	with open(fileName, 'w') as outfile:
		json.dump(data, outfile)

	file.close(fileName)

def readJson(fileName):
	print (open(fileName.name, 'r').read())
