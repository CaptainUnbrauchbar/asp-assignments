a(X) :- b(X), Y=X+1, not b(Y).
b(1). b(2).

% b(1), Y = 2, nicht b(2) False
% b(2), Y = 3, nicht b(3) True -> a(2), b(1), b(2)
