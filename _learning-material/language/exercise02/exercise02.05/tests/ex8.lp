b(1..2).
1 { a(X) : b(X) }. 
c(X) :- a(X).
#minimize{ 1: c(X)}.
#show c/1.
