% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
%
%

% cell(1,1).        Feld 1,1
% number(1,1,4)     Auf Feld 1,1 ist eine Zahl "4"
% area(1,1,6)       Auf Feld 1,1 ist Bereich 5
% goal(6,5)         Die Summe aller Zahlen in Bereich 6 muss 5 betragen

dir(0,1). dir(0,-1). dir(1,0). dir(-1,0).                       % Not needed when you disallow diagonal target assignments?

% HINTS:
% - You may use the gaps of adjacent cells' coordinates to denote directions.
% - Develop your encoding incrementally and check the additions. If in doubt
%   whether rules are correct, the "--text" option of gringo/clingo allows
%   for investigating the instantiation, while small instances are advisable.

% Your implementation please...

1{target(X,Y,X',Y') : area(X',Y',Z)}1 :- number(X,Y,Z').        % Base rule: Target/4 exists for each number and area

:- target(X,Y,X',Y'), X!=X', Y!=Y'.                             % Prevent diagonal assignment: No target/4 where X and Y are different 

arrow(X'..X, Y..Y',X,Y) :- target(X,Y,X',Y'), dir(A,B).
arrow(X..X', Y..Y',X,Y) :- target(X,Y,X',Y'), dir(A,B).
arrow(X..X', Y'..Y,X,Y) :- target(X,Y,X',Y'), dir(A,B).
arrow(X'..X, Y'..Y,X,Y) :- target(X,Y,X',Y'), dir(A,B).

:- arrow(X,Y,X',_), arrow(X,Y,X'',_), X''!= X'.
:- arrow(X,Y,_,Y'), arrow(X,Y,_,Y''), Y''!= Y'.

:- S = #sum{1,A: area(X',Y',A)}, N = #sum{1,I:target(X,Y,X',Y'), area(X',Y',I),number(X,Y,V)}, S!=N.
:- S!=G, goal(A,G), S=#sum{V,X,Y:target(X,Y,X',Y'), area(X',Y',A),number(X,Y,V)}.

%#show arrow/4.
#show target/4.



number(1,1,8).
number(1,6,11).
number(1,10,11).
number(2,2,7).
number(2,8,11).
number(3,3,11).
number(3,9,11).
number(4,5,8).
number(5,1,4).
number(5,7,5).
number(6,4,7).
number(6,10,7).
number(7,6,6).
number(8,2,3).
number(8,8,5).
number(9,3,1).
number(9,9,6).
number(10,1,1).
number(10,5,4).
number(10,10,1).
area(1,3,1).
area(2,3,1).
area(1,7,2).
area(2,5,2).
area(2,7,2).
area(3,5,2).
area(3,6,2).
area(3,7,2).
goal(2,55).
area(3,2,3).
area(4,1,3).
area(4,2,3).
goal(3,10).
area(4,8,4).
area(5,8,4).
area(6,8,4).
goal(4,8).
area(4,10,5).
area(5,10,5).
goal(5,5).
area(5,3,6).
area(6,3,6).
area(7,3,6).
goal(6,6).
area(5,5,7).
area(5,6,7).
area(6,5,7).
area(6,6,7).
goal(7,14).
area(6,1,8).
area(7,1,8).
goal(8,5).
area(7,9,9).
area(7,10,9).
area(8,9,9).
goal(9,6).
area(8,4,10).
area(8,5,10).
area(8,6,10).
area(9,4,10).
area(9,6,10).
area(10,4,10).
area(9,8,11).
area(10,8,11).
goal(11,4).
cell(1,1).
cell(1,2).
cell(1,3).
cell(1,4).
cell(1,5).
cell(1,6).
cell(1,7).
cell(1,8).
cell(1,9).
cell(1,10).
cell(2,1).
cell(2,2).
cell(2,3).
cell(2,4).
cell(2,5).
cell(2,6).
cell(2,7).
cell(2,8).
cell(2,9).
cell(2,10).
cell(3,1).
cell(3,2).
cell(3,3).
cell(3,4).
cell(3,5).
cell(3,6).
cell(3,7).
cell(3,8).
cell(3,9).
cell(3,10).
cell(4,1).
cell(4,2).
cell(4,3).
cell(4,4).
cell(4,5).
cell(4,6).
cell(4,7).
cell(4,8).
cell(4,9).
cell(4,10).
cell(5,1).
cell(5,2).
cell(5,3).
cell(5,4).
cell(5,5).
cell(5,6).
cell(5,7).
cell(5,8).
cell(5,9).
cell(5,10).
cell(6,1).
cell(6,2).
cell(6,3).
cell(6,4).
cell(6,5).
cell(6,6).
cell(6,7).
cell(6,8).
cell(6,9).
cell(6,10).
cell(7,1).
cell(7,2).
cell(7,3).
cell(7,4).
cell(7,5).
cell(7,6).
cell(7,7).
cell(7,8).
cell(7,9).
cell(7,10).
cell(8,1).
cell(8,2).
cell(8,3).
cell(8,4).
cell(8,5).
cell(8,6).
cell(8,7).
cell(8,8).
cell(8,9).
cell(8,10).
cell(9,1).
cell(9,2).
cell(9,3).
cell(9,4).
cell(9,5).
cell(9,6).
cell(9,7).
cell(9,8).
cell(9,9).
cell(9,10).
cell(10,1).
cell(10,2).
cell(10,3).
cell(10,4).
cell(10,5).
cell(10,6).
cell(10,7).
cell(10,8).
cell(10,9).
cell(10,10).