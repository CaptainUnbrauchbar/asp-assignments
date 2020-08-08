import os

displayed = False
show = False
init = []
erg = []
timep = ""

def setup():
    global init, erg
    
    offset = 50
    
    size(700,700)
    frameRate(60)
    background(255)
  
    drawBase()    
    
    init = getStartValues()
    erg = solve()

def drawBase():
    offset = 50
    fill(0, 102, 153)
    textSize(25)
    text("Sudoku Solver logic by Clingo", 50, 35)
  
    stroke(1)
    strokeWeight(4)
    fill(240)
    rect(50,50,600,600)

    strokeCap(SQUARE)

    line(offset+200,offset,offset+200,offset+600)
    line(offset+400,offset,offset+400,offset+600)
  
    line(offset,offset+200,offset+600,offset+200)
    line(offset,offset+400,offset+600,offset+400)

    strokeWeight(1)
    for i in range(0,600*3,200):
        line(offset+i/3,offset,offset+i/3,offset+600);
        line(offset,offset+i/3,offset+600,offset+i/3);

def display():
    global init, erg, displayed, show

    for elem in init:
        if elem in erg:
            erg.remove(elem)
            
    if not displayed:
        fill(1)
        for x in range(0,len(init)):
            fill(1)
            textSize(20)
            text(init[x][2],(50+100/3+200/3*(init[x][1]-1))-2,(50+100/3+200/3*(init[x][0]-1))+10)
        displayed = True
        show = True
    else:
        fill(1)
        if show:
            for y in range(0,len(erg)):
                fill(1)
                textSize(25)
                text(timep,450,35)
                fill(255,1,1)
                textSize(20)
                text(erg[y][2],(50+100/3+200/3*(erg[y][1]-1))-4,(50+100/3+200/3*(erg[y][0]-1))+10)
                show = False
        else:
            for y in range(0,len(erg)):
                fill(240)
                noStroke()
                rect((50+100/3+200/3*(erg[y][1]-1))-20,(50+100/3+200/3*(erg[y][0]-1))-20,50,50)
                show = True
def draw():
    global displayed
    rect(550,10,100,30)
    
    if (displayed):
        fill(0)
    else:
        fill(255)

def mousePressed():
    global button
    if mouseX>550 and mouseX <550+100 and mouseY>15 and mouseY <15+25:
        display()
        
            

def getStartValues():
    stream = os.popen("gringo C:\\Users\\daflo\\OneDrive\\ASP\\ex05.lp --text")
    output = stream.read()

    res = [i for i in range(len(output)) if output.startswith("initial", i)] 

    init = [[]]
    for i in range(0,len(res)):
        init[i].append(int(output[res[i]+8]))
        init[i].append(int(output[res[i]+10]))
        init[i].append(int(output[res[i]+12]))
        if i < len(res)-1:
            init.append([])
    
    return init

def solve():
    global timep
    stream = os.popen("clingo  C:\\Users\\daflo\\OneDrive\\ASP\\sudoku.lp  C:\\Users\\daflo\\OneDrive\\ASP\\ex05.lp 1")
    output = stream.read()

    res = [i for i in range(len(output)) if output.startswith("sudoku", i)]
    res.pop(0)
    
    timep = output[output.find("CPU Time")+15:]
    
    erg = [[]]
    for i in range(0,len(res)):
        erg[i].append(int(output[res[i]+7]))
        erg[i].append(int(output[res[i]+9]))
        erg[i].append(int(output[res[i]+11]))
        if i < len(res)-1:
            erg.append([])
            
    return erg
        
    
    
    
