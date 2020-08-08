import os

stream = os.popen("gringo D:\\User\\Desktop\\ASP\\ex01.lp --text")
output = stream.read()

res = [i for i in range(len(output)) if output.startswith("initial", i)] 

values = [[]]
for i in range(0,len(res)):
    values[i].append(int(output[res[i]+8]))
    values[i].append(int(output[res[i]+10]))
    values[i].append(int(output[res[i]+12]))
    if i < len(res)-1:
        values.append([])

#print(values)

stream = os.popen("clingo  D:\\User\\Desktop\\ASP\\sudoku9.lp  D:\\User\\Desktop\\ASP\\ex01.lp 1")
output = stream.read()

res = [i for i in range(len(output)) if output.startswith("sudoku", i)]
res.pop(0)

erg = [[]]
for i in range(0,len(res)):
    erg[i].append(int(output[res[i]+7]))
    erg[i].append(int(output[res[i]+9]))
    erg[i].append(int(output[res[i]+11]))
    if i < len(res)-1:
        erg.append([])

uniquelist = []

for elem in values:
    if elem in erg:
        erg.remove(elem)
print(len(values))
print(len(erg))

print(output[output.find("CPU Time")+15:]) 
print()