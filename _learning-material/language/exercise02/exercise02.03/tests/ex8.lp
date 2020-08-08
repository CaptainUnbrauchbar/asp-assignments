b(1..2).
{ a(X) : b(X) }.
c(X):- a(X).
:- 1 #sum{1: c(X)}.
#show c/1.
