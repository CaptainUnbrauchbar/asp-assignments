a(1).
b(1..2).
c :- a(X) : b(X), c(X).
#show c/0.
