import os
import P4
import shutil

"""
p4 = P4.P4()
p4.connect() 
desc = {"Description": "Fixing Hats","Change": "new"}
p4.input = desc
p4.run("changelist", "-i") 


edit_files = []

with open('C:\\Users\\rgriffin\Desktop\\replace.txt', 'r' )as f:
	for line in f:
		l = line.partition(',')[0]
		e = l.replace('#(', '')
		r = e.replace('U:\\', '//NovaStream/main/')
		q= r.replace('\\', '/')
		edit_files.append(q)	
f.close


for i in edit_files:
    f=i.replace('"','').strip()
    print (f)

    if len(f)>0:
      print ("Opening  ["+f+"]")
      p4.run("edit" , f)

"""
def replaceTarget():
	edit_filesA = []
	with open('C:\\Users\\rgriffin\Desktop\\replace2.txt', 'r' )as f:
		for line in f:
			l = line.partition(',')[0]
			e = l.replace('#(', '')
			r = e.replace('U:\\', 'F:\\')
			#q= r.replace('\\', '/')
			edit_filesA.append(r)	
		f.close
	
	sourceFile =  "F:/Data/anims/Skylanders/Sungirl/idle.hkx"
	for each in edit_filesA:
		#d = each.rpartition('\\')[0]
		#e = d+'\\'
		f=each.replace('"','').strip()

		try:
			shutil.copyfile(sourceFile, f)
		except:
			print (f)

replaceTarget()
