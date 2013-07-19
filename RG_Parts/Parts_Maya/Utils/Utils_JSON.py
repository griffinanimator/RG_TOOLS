import json
import tempfile

fileName = 'C:/Users/rgriffin/Documents/GitHub/RG_ARTTOOLS/RG_TOOLS/RG_Parts/Parts_Maya/Data/tmp.json'

data = [ { 'a':'A', 'b':(2, 4), 'c':3.0 } ]

with open(fileName, 'w') as outfile:
	json.dump(data, outfile)


print (open(outfile.name, 'r').read())