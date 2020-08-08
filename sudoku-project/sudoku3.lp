% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
%
%

subgrid_size(1).

% HINTS:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...

x(1..3) :- subgrid_size(N).                         % get number of x (rows)
y(1..3) :- subgrid_size(N).                         % get number of y (columns)

fields(X,Y) :- x(X), y(Y).      

z(1..3) :- subgrid_size(N).                         % get all possible Values for field z
fields(X,Y,Z) :- fields(X,Y), z(Z).                 % get all fields in all subgrids with all possible Values

filled(X,Y) :- initial(X,Y,Z).

sudoku(X,Y,Z) :- fields(X,Y,Z), not filled(X,Y).    % sudoku now contains all fields that have to be filled with all its possible Values

%1{sudoku(X,Y,Z) : z(Z)}1 :- x(X), y(Y).

:- sudoku(X,Y,Z), initial(X',Y,Z), X!=X'.
:- sudoku(X,Y,Z), initial(X,Y',Z), Y!=Y'.

%:- sudoku(X,Y,Z), sudoku(X',Y',Z), Y!=Y', X!=X', ((X-1)/N)*N+(Y-1)/N == ((X'-1)/N)*N+(Y'-1)/N, subgrid_size(N).
   

%fields(X,Y,Z) :- not initial(X,Y,Z).

#show sudoku/3.


initial(1,1,1).
initial(2,2,3).
initial(3,3,2).