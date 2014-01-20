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
    avg = sum(l) / 100.0
    out_fd.write(str(avg)+'\n')
    l = []

out_fd.write(str(sum(l)/len(l))+'\n')

fd.close()
out_fd.close()


  
