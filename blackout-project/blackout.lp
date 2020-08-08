% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
% Florian Frankreiter, frankreiter@uni-potsdam.de

% Your implementation please...

time(1..4).

cell(1..4,1..4).

black(2,2).
black(2,4).
black(3,1).
black(3,2).
black(3,4).
black(4,2).
black(4,4).


% get negative from black values (white)
white(X,Y,1) :- cell(X,Y), not black(X,Y).

% generate all switches with unique T from cells 
1 {switch(X,Y,T) : cell(X,Y)} 1  :- time(T).

%% Auxiliary
% define adjacent cells in positive directions +X and +Y
next_cell(cell(X,Y),cell(X+1,Y)) :- cell(X,Y), cell(X+1,Y).
next_cell(cell(X,Y),cell(X,Y+1)) :- cell(X,Y), cell(X,Y+1).          
% mirror adjacent cells to get negative directions -X and -Y
next_cell(cell(X,Y),cell(X',Y')) :- next_cell(cell(X',Y'), cell(X,Y)).

% define when cell is "itself"
itself(cell(X,Y),cell(X',Y'))    :- cell(X,Y), cell(X',Y'), X = X', Y = Y'.
%% /Auxiliary

% define whites after each "switch"
white(X,Y,T + 1) :-     white(X,Y,T), cell(X,Y), cell(X',Y'), switch(X',Y',T), not next_cell(cell(X,Y), cell(X',Y')), not itself(cell(X,Y), cell(X',Y')), time(T).
white(X,Y,T + 1) :- not white(X,Y,T), cell(X,Y), cell(X',Y'), switch(X',Y',T),     next_cell(cell(X,Y), cell(X',Y')), time(T).
white(X,Y,T + 1) :- not white(X,Y,T), cell(X,Y),              switch(X,Y,T),   time(T).

% whites that got maxTime + 1
:- white(X,Y,T), cell(X,Y), not time(T).

% invalid switches out of bounds
:- switch(X,Y,T), not cell(X,Y), time(T).

% show switch(X,Y,T)
#show switch/3.