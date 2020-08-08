b(1..2).
{ a(X) : b(X) }.
c(X):- a(X).
:- 2 #sum{X: a(X), c(X)}.
#show c/1.
