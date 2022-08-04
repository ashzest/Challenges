        
#!/usr/bin/env python
import re
# Open a file
datafile=open("../datafiles/hosts.real")

# Read the file line by line

count=1
lines=[]
for line in datafile:
    line = re.sub('([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})','',line)
    line = re.sub('#.*','',line)
    line = line.rstrip()
    print(line)
    if count != 1:
        lines.append(line)
    count = count+1

    

datafile.close()




             
