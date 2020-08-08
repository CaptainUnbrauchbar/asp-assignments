#const size=4.

celln(1..4,1..4).

xcoordinate(1..size).
ycoordinate(1..size).
cell(X,Y) :- xcoordinate(X), ycoordinate(Y).

#show cell/2.