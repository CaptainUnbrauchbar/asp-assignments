b(1..2).
1 { a(X) : b(X) }. 
c(X) :- a(X).
#minimize{ X: a(X), c(X)}.
#show c/1.
