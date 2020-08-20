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

% Get arrow for each target and dir (obsolete) 
arrow(X'..X, Y..Y',X,Y) :- target(X,Y,X',Y'), dir(A,B).         % X', Y  -> X , Y' 
arrow(X..X', Y..Y',X,Y) :- target(X,Y,X',Y'), dir(A,B).         % X , Y  -> X', Y'
arrow(X..X', Y'..Y,X,Y) :- target(X,Y,X',Y'), dir(A,B).         % X , Y' -> X', Y
arrow(X'..X, Y'..Y,X,Y) :- target(X,Y,X',Y'), dir(A,B).         % X', Y' -> X , Y

:- arrow(X,Y,X',Y'), arrow(X,Y,A,B), A!= X'.                    % Arrows cannot cross over each other
:- arrow(X,Y,X',Y'), arrow(X,Y,A,B), B!= Y'.                    % Arrows cannot cross over each other

:- S = #sum{1,A: area(X',Y',A)}, N = #sum{1,I:target(X,Y,X',Y'), area(X',Y',I),number(X,Y,V)}, S!=N.    % Constraints for area (sum of all numbers) goals
:- S!=G, goal(A,G), S = #sum{V,X,Y: target(X,Y,X',Y'), area(X',Y',A), number(X,Y,V)}.                   

%#show area/3.
%#show arrow/4.
#show target/4.

