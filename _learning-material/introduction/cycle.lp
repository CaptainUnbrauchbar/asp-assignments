% The Hamiltonian cycle problem is about finding a round trip through a
% (directed) graph visiting each node exactly once. We can represent such a
% round trip by its edges, and use the following choice rule to pick edges.

{cycle(X,Y)} :- edge(X,Y).

% - TODO 1: Ask clingo for (up to) three answer sets by invoking the command
%   clingo cycle.lp square.lp 3
% and investigate especially their atoms of the predicate cycle/2.
% Can you tell how many answer sets there are in total?

% - TODO 2: Let us check how many answer sets there are by invoking
%   clingo cycle.lp square.lp 0 -q
% where the output of answer sets is suppressed, as there are quite a lot.

% The following integrity constraint with a #count aggregate in its body
% expresses that there should not be an answer set such that some node has
% no or several outgoing edges within a round trip.

:- node(X), #count{Y : cycle(X,Y)} != 1.

% - TODO 3: Uncomment the integrity constraint and invoke the command
%   clingo cycle.lp square.lp
% to see the answer set found first now. How many such answer sets exist?

% - TODO 4: Let us double-check the number of answer sets by again invoking
%   clingo cycle.lp square.lp 0 -q

% - TODO 5: In a round trip, each node should also have exactly one incoming
% edge, but the following integrity constraint still includes some question
% marks. Please replace them appropriately to assert that there must be
% exactly one incoming edge per node.

:- node(Y), #count{Y : cycle(X,Y)} != 1.

% - TODO 6: Investigate the answer sets that can be obtained now by invoking
%   clingo cycle.lp square.lp 0
% and tell which of them represent proper round trips and which do not.

% The following rules derive all nodes that are reached from the (arbitrary)
% starting node '1' via the edges picked for a round trip.

% reached(1).
% reached(Y) :- reached(X), cycle(X,Y).

% - TODO 7: Uncomment the rules and again invoke the command
%   clingo cycle.lp square.lp 0
% to compare the answer sets' atoms of the predicates cycle/2 and reached/1.

% The following integrity constraint asserts that each node must be reached
% from the starting node '1' via the edges of a round trip.

% :- node(X), not reached(X).

% - TODO 8: Uncomment the integrity constraint and invoke the command
%   clingo cycle.lp square.lp 0
% to see the answer sets that indeed match proper round trips.

% The following #show directive tells that the output of answer sets should
% be projected to atoms of the predicate cycle/2.

% #show cycle/2.

% - TODO 9: Uncomment the #show directive and reinspect the output, using
%   clingo cycle.lp square.lp 0 --stats
% to also see the search statistics in addition.

% - TODO 10: To compare the propositional rules generated by clingo, invoke
%   clingo cycle.lp square.lp --text
% and inspect the ground instances of the rules with variables written above.
