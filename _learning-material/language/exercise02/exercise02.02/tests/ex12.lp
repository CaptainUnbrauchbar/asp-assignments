{ a(X) : b(X,Y), c(Y) }.
b(1,5). b(2,10). c(10).
d(X) :- a(X).
:- a(X), not d(X).
