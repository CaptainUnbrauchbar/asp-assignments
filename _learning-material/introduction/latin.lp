% We let constant 'n', which is 2 by default, stand for the size of a Latin
% square, in which each cell should be assigned with a number from '1' to 'n'
% such that no number is repeated in any row or column.

#const n = 2.

% Based on 'n', we represent the available numbers by (auxiliary) facts.

number(1..n).

% The following choice rule, including the cardinality restriction '= 1', is
% used to pick exactly one number per cell.

{latin(X,Y,N) : number(N)} = 1 :- number(X), number(Y).

% - TODO 1: Invoke the command
%   clingo latin.lp
% to see some answer set (the one found first by clingo) representing an
% assignment of numbers to cells. How many such answer sets exist?

% - TODO 2: Let us double-check the number of answer sets by running
%   clingo latin.lp 0

% The following integrity constraint aims to assert that no number should be
% repeated in any row, but unfortunately it is buggy :-(

% :- latin(X,Y1,N), latin(X,Y2,N).

% - TODO 3: Uncomment the integrity constraint and invoke
%   clingo latin.lp
% to see what happens.

% - TODO 4: Let us inspect the text output of clingo, using the command
%   clingo latin.lp --text
% to (hopefully) spot what is going wrong.

% - TODO 5: Fix the above integrity constraint by adding a suitable condition
% in its body. You may take advantage of a built-in comparison relation like
% '=', '!=', '<', or '>' for this purpose.

% - TODO 6: Reinspect the text output of clingo by again invoking
%   clingo latin.lp --text

% - TODO 7: Let us take a look at all answer sets by running, e.g.,
%   clingo latin.lp 0
% and tell which of them represent proper Latin squares and which do not.

% - TODO 8: Add an integrity constraint like the one above, yet addressing
% columns instead of rows, and see that all answer sets fit by again invoking
%   clingo latin.lp 0

% - TODO 9: The conditions on rows and columns may also be expressed in terms
% of integrity constraints including #count aggregates, or choice rules being
% quite similar to the one above for assigning exactly one number per cell.
% Consider to rewrite the integrity constraints on rows and columns by means
% of such more space-efficient (regarding the instantiation size) constructs
% and check that you still get the same answers sets as before.
