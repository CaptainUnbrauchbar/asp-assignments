% The facts below represent a (directed) graph looking like this:

%*
  1 ---> 2
  ^     /
   \   /
    \ v
     3
*%

% What you see above are a single- and a multi-line comment,
% and this here is commented out too.

node(1).
node(2).
node(3).

edge(1,2).
edge(2,3).
edge(3,1).
