% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
%
%

time(1..4).

cell(1..4,1..4).

black(2,2).
black(2,4).
black(3,1).
black(3,2).
black(3,4).
black(4,2).
black(4,4).


% Your implementation please...

white(X,Y) :- cell(X,Y), not black(X,Y).

%{switch(X,Y,T)} :- 

%{switch(X,Y,T) : time(T)} == 1 :- white(X,Y).

%:- switch(X,Y,T), switch(X',Y',T), X!=X', Y!=Y', T=T.

%{switch(X,Y,T); cell(X,Y); }.

%switch(X,Y,T) :- cell(X,Y), not black(X,Y), not black(X+1,Y), not black(X-1,Y), not black(X,Y+1), not black(X,Y-1), time(T).



%#show switch/3.

%{switch(X,Y,T); switch(X+1,Y,T); switch(X-1,Y,T); switch(X,Y+1,T); switch(X,Y-1,T)} = N.
%N \ 2==0 :- black(X,Y) , time(T).