count(N,L) :-
  csp(N,Vars,Constraints,Point),
  violations(Point,Constraints,Violations),
  tab(2), nice_point(Point,[],Nice), write(Nice), write(' '), 
  write('Violations: '), write(Violations), write(' '),
  (Violations == 0 ->
    ( writeln('SOLUTION'), L=[(Nice,0)] )
  ;
    ( nl, findall((S,F),local_search(Point,Vars,Constraints,Violations,F,S,4),L) )
  ).

local_search(Point,Vars,Constraints,Violated,Flips,Solution,I) :-
  point(Point,Vars,New),
  violations(New,Constraints,Violations),
  (Violations < Violated ->
    (
      tab(I), nice_point(New,[],Nice), write(Nice), write(' '), 
      write('Violations: '), write(Violations), write(' '),
      (Violations == 0 ->
        ( writeln('SOLUTION'), Solution = Nice, Flips = 1 )
      ;
        ( nl, local_search(New,Vars,Constraints,Violations,Flipped,Solution,I+2), Flips is Flipped+1 )
      )
    )
  ;
    fail
  ).

point(Point,Vars,[(N=W,X) | Rest]) :-
  select((N=V,X),Point,Rest),
  ( W is V+1 ; W is V-1 ),
  memberchk((X,N,D),Vars),
  memberchk(W,D).

violations(_Point, [], 0).
violations(Point, [Call | Constraints], N) :-
  violations(Point, Constraints, M),
  (not(test(Point,Call)) ->
    N is M+1
  ;
    N = M
  ).

test([],Call) :-
  call(Call).
test([(_N=V,X) | Point], Call) :-
  X = V,
  test(Point,Call).

nice_point([],Vals,Nice) :-
  sort(Vals,Nice).
nice_point([(N=V,_X) | Point], Vals, Nice) :-
  nice_point(Point, [N=V | Vals], Nice).

csp(1,
    [(A,'A',[1,2,3,4]),(B,'B',[1,2,3,4]),(D,'D',[1,2,3,4]),(C,'C',[1,2,3,4])],
    [A=\=B,A>C,B<C,B=\=D,C>D],
    [('A'=1,A),('B'=1,B),('C'=1,C),('D'=1,D)]).
csp(2,
    [(A,'A',[1,2,3,4]),(B,'B',[1,2,3,4]),(D,'D',[1,2,3,4]),(C,'C',[1,2,3,4])],
    [A=\=B,A>C,B<C,B=\=D,C>D],
    [('A'=2,A),('B'=2,B),('C'=2,C),('D'=1,D)]).
csp(3,[(A,'A',[1,2,3,4]),(B,'B',[1,2,3,4]),(C,'C',[1,2,3,4]),(D,'D',[1,2,3,4])],
    [A mod 2 =:= B mod 2,A>C,A+D>6,B>D,C*D<7],
    [('A'=3,A),('B'=3,B),('C'=3,C),('D'=4,D)]).
csp(4,[(A,'A',[1,2,3,4]),(D,'D',[1,2,3,4]),(B,'B',[1,2,3,4]),(C,'C',[1,2,3,4])],
    [A mod 2 =:= B mod 2,A>C,A+D>6,B>D,C*D<7],
    [('A'=3,A),('B'=3,B),('C'=3,C),('D'=3,D)]).
