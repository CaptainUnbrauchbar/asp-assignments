a(1..2,1..2).
b(1..2,1..2).
c :- a(X,Y) :   b(X,Y),
              not c(X).
#show c/0.
