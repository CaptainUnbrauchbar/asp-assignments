% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
% Florian Frankreiter, frankreiter@uni-potsdam.de

subgrid_size(3).

% HINTS:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...

v(1..N*N) :- subgrid_size(N).                           % v: all possible values for x,y,z

%1{initial(X,Y,Z) : v(X)}1 :- v(Y), v(Z).               % obsolete because of rules below
%1{initial(X,Y,Z) : v(Y)}1 :- v(X), v(Z).               % obsolete because of rules below
1{initial(X,Y,Z) : v(Z)}1 :- v(X), v(Y).                % get all stable sudoku models with exactly 1 value z for each possible field x,y

:- initial(A,B,C), initial(X,Y,Z), A=X, B!=Y, C=Z.                  % exclude all answers with duplicate z values per row X
:- initial(A,B,C), initial(X,Y,Z), A!=X, B=Y, C=Z.                  % exclude all answers with duplicate z values per column Y
:- initial(A,B,C), initial(X,Y,Z), B!=Y, A!=X, C=Z,                 % exclude all answers with duplicate z per subgrid N,
((A-1)/N)*N + (B-1)/N == ((X-1)/N)*N+(Y-1)/N, subgrid_size(N).      % (compare subgrids)

sudoku(X,Y,Z) :- initial(X,Y,Z).                                    % show output correctly as sudoku

#show sudoku/3.


