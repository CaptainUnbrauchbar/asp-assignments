% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
%Luise Strietzel
%Nico Manthey
%Neele Kinkel

% cell(1,1).

% number(1,5,5).       cell 1,5 has number 5

% area(1,1,1).         cell 1,1 has area and number of that area is 1

% goal(1,6).           all numbers that are in area 1 must sum up to 6

%                       if an area has no goal/2 associated,
%                       then the numbers in it may sum up to an arbirary sum.


%target is the movement of a number at field X,Y into a field of an area
% we choose exactly 1 target for a number on field X,Y
1={target(X,Y,X',Y'):area(X',Y',A)}:- number(X,Y,V).

%we have line from X',Y to X,Y' if we have a target(X,Y,X',Y')
lines(X'..X, Y..Y',X,Y):- target(X,Y,X',Y').
%we have line from X,Y to X',Y' if we have a target(X,Y,X',Y')
lines(X..X', Y..Y',X,Y):- target(X,Y,X',Y').
%we have line from X,Y' to X',Y if we have a target(X,Y,X',Y')
lines(X..X', Y'..Y,X,Y):- target(X,Y,X',Y').
%we have line from X',Y' to X,Y if we have a target(X,Y,X',Y')
lines(X'..X, Y'..Y,X,Y):- target(X,Y,X',Y').

%make sure that diagonal moves are not possible:
%it cannot be the case that we move a number to a field where BOTH coordinates are different
:- target(X,Y,X',Y'), X!=X', Y!=Y'.

%disallow crossing of lines:
%maybe this should be
% :- lines(X,Y,X',_), lines(X,Y,X'',_), X''= X'. instead ?!
:- lines(X,Y,X',_), lines(X,Y,X'',_), X''!= X'.
:- lines(X,Y,_,Y'), lines(X,Y,_,Y''), Y''!= Y'.

%make sure we reached the goal given for every area by adding up the numbers that were assigned to the area fields
% one of the following two constraints seems to be obsolete, since both make sure that the goal of an area is reached
%that is, it cannot be the case that the sum we reached in the area is UNEQUAL to the goal N, that we were given for that area
:- S = #sum{1,A: area(X',Y',A)}, N = #sum{1,I:target(X,Y,X',Y'), area(X',Y',I),number(X,Y,V)}, S!=N.
% constraints to ensure goal matching
:- S!=G, goal(A,G), S=#sum{V,X,Y:target(X,Y,X',Y'), area(X',Y',A),number(X,Y,V)}.

% line obsolete since move is not defined anywhere else?
target(X,Y,X',Y') :- move(X,Y,_,X',Y',_).

#show target/4.
