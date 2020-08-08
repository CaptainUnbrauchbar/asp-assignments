count(N,S) :-
  nb_setval(backtracks,0),
  csp(N,Vars,Constraints),
  findall(Solution,backtrack(Vars,Constraints,Solution,2),S),
  nl, write('BACKTRACKS: '), nb_getval(backtracks,B), writeln(B).

% backtrack([], _C, [], _I) :- writeln('SOLUTION').
backtrack([(X,N,D) | Vars], Constraints, [N=V | Ass], I) :-
  member(V,D),  
  tab(I), write(N), write('='), write(V), write(' '), 
  X=V,
  (test(Constraints,Rest) ->
    (Vars == [] ->
      ( writeln('SOLUTION'), Ass = [] )
    ;
      ( nl, backtrack(Vars,Rest,Ass,I+2) )
    )
  ;
    ( writeln(failure), nb_getval(backtracks,B), C is B+1, nb_setval(backtracks,C), fail )
  ).

test([], []).
test([(Scope,Call) | Constraints], Rest) :-
  scope(Scope, Unass),
  (Unass == [] ->
    (
      call(Call),
      test(Constraints, Rest)
    )
  ;
    (
      test(Constraints, Buffer),
      Rest = [(Unass,Call) | Buffer]
    )
  ).

scope([], []).
scope([X | S], R) :-
  scope(S, B),
  (var(X) ->
    R = [X | B]
  ;
    R = B
  ).

csp(1,
    [(A,'A',[1,2,3,4]),(B,'B',[1,2,3,4]),(D,'D',[1,2,3,4]),(C,'C',[1,2,3,4])],
    [([A,B],A=\=B),([A,C],A>C),([B,C],B<C),([B,D],B=\=D),([C,D],C>D)]).
csp(2,
    [(C,'C',[1,2,3,4]),(A,'A',[1,2,3,4]),(B,'B',[1,2,3,4]),(D,'D',[1,2,3,4])],
    [([A,B],A=\=B),([A,C],A>C),([B,C],B<C),([B,D],B=\=D),([C,D],C>D)]).
csp(3,[(A,'A',[1,2,3,4]),(B,'B',[1,2,3,4]),(C,'C',[1,2,3,4]),(D,'D',[1,2,3,4])],
    [([A,B],A mod 2 =:= B mod 2),([A,C],A>C),([A,D],A+D>6),([B,D],B>D),([C,D],C*D<7)]).
csp(4,[(A,'A',[1,2,3,4]),(D,'D',[1,2,3,4]),(B,'B',[1,2,3,4]),(C,'C',[1,2,3,4])],
    [([A,B],A mod 2 =:= B mod 2),([A,C],A>C),([A,D],A+D>6),([B,D],B>D),([C,D],C*D<7)]).
