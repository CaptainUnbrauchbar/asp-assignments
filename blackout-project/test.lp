#const size=4.
#const time_horizon=4.

xcoordinate(1..size).
ycoordinate(1..size).
time(1..time_horizon).
cell(X,Y) :- xcoordinate(X), ycoordinate(Y).


%generator
1 {switch(X,Y,T) : cell(X,Y)} 1 :- time(T).                 % generiert alle möglichkeiten von 4 zellen mit einzigartigen T

%auxiliary
this(cell(X,Y),cell(XX,YY)) :- cell(X,Y), cell(XX,YY), X = XX, Y = YY.          % alle zellen mit gleichen X und Y werden als "liste" erzeugt
distance_one(cell(X,Y),cell(X+1,Y)) :- cell(X,Y), cell(X+1,Y).                  % alle distance_one für zellen erzeugen die einen nachbarn in x richtung haben
distance_one(cell(X,Y),cell(X,Y+1)) :- cell(X,Y), cell(X,Y+1).                  % alle distance_one für zellen erzeugen die einen nachbarn in y richtung haben
%distance_one(cell(X,Y),cell(X-1,Y)) :- cell(X,Y), cell(X-1,Y).                 
%distance_one(cell(X,Y),cell(X,Y-1)) :- cell(X,Y), cell(X,Y-1).                 
distance_one(cell(X,Y),cell(XX,YY)) :- distance_one(cell(XX,YY), cell(X,Y)).    % alle distance_one mit gespiegelten x,y also minus richtung

%effect
on(X,Y,T + 1) :- on(X,Y,T), switch(XX,YY,T), cell(X,Y),       cell(XX,YY), not distance_one(cell(X,Y), cell(XX,YY)), not this(cell(X,Y), cell(XX,YY)), time(T).
on(X,Y,T + 1) :- cell(X,Y), switch(X,Y,T),   not on(X,Y,T),   time(T).
on(X,Y,T + 1) :- cell(X,Y), cell(XX,YY),     switch(XX,YY,T), distance_one(cell(X,Y), cell(XX,YY)), not on(X,Y,T), time(T).



%Goal
:- on(X,Y,time_horizon + 1), cell(X,Y).
%precondition
:- switch(X,Y,T), not cell(X,Y), time(T).

black(2,2,1).
black(2,4,1).
black(3,1,1).
black(3,2,1).
black(3,4,1).
black(4,2,1).
black(4,4,1).

white(X,Y) :- cell(X,Y), not black(X,Y).

#show switch/3.