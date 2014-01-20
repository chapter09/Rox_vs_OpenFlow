import os, sys

s = sys.argv[1]
d = sys.argv[2]

fd = open('./%s'%s, 'r')
out_fd = open('./%s'%d, 'w')
l = []
for line in fd.readlines():

  rtt = float(line.split(',')[0][1:-2])
  t = float(line.split(',')[1][1:-2])

  l.append(rtt)

  if len(l) == 100:
    l.sort()
    out_fd.write(str(l[50])+'\n')
    l = []


out_fd.write(str(l[len(l)/2])+'\n')

fd.close()
out_fd.close()


  
