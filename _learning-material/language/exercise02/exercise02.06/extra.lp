% python functions definition
#script(python)
def get_value():
    return 1
#end.

% #true and #false
true :- #true.
notfalse :- not #false.

% python functions usage
a(X) :- X = @get_value().

% constants
#const n=2.
a(n).

% intervals
a(3..4).

% show statements
#show.                                   % show no atoms if no predicate is #shown
#show a/1.                               % show true atoms of predicate a/1
#show hold("true and notfalse") : true,  % show term if condition holds
                              notfalse. 

%
% projection: use with options
%   0
% and
%   0 --project
%
{ b(1) }.
{ c(1) }.
#project b/1.
#show b/1.
#show c/1.
