% The facts below represent a (directed) graph looking like this:

%*
  1 <-> 2
  ^ \   ^
  |  \  |
  |   \ |
  |    \|
  |     v
  4 <-> 3
*%

node(1).
node(2).
node(3).
node(4).

edge(1,2). edge(1,3).
edge(2,3). edge(2,1).
edge(3,4). edge(3,2).
edge(4,1). edge(4,3).
