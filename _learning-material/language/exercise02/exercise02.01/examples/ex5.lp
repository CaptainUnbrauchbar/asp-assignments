a(X) :- b(X), not c(X).
b(1). b(2). c(1).

% b(1), nicht c(1) False
% b(2), nicht c(2) True -> a(2), b(1), b(2), c(1)
