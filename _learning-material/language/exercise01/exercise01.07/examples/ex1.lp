
a. b. c.

a(V) :- V = #sum{ 1: a;     2: b;     5: c     }.
b(V) :- V = #sum{ 1: a;     2: b;     5: not c }.
c(V) :- V = #sum{ 1: a;     2: not b; 5: not c }.
d(V) :- V = #sum{ 1: not a; 2: not b; 5: not c }.

e(V) :- V = #sum{ 1: a;     1: b;     1: c     }.
f(V) :- V = #sum{ 1: a;     1: b;     1: not c }.
g(V) :- V = #sum{ 1: a;     1: not b; 1: not c }.
h(V) :- V = #sum{ 1: not a; 1: not b; 1: not c }.

i(V) :- V = #sum{ 1: a;     1: b;     5: c     }.
j(V) :- V = #sum{ 1: a;     5: b;     5: c     }.
k(V) :- V = #sum{ 5: a;     5: b;     5: c     }.

l(V) :- V = #sum{ 1,x: a;     1,y: b;     1,z: c     }.
m(V) :- V = #sum{ 1,x: a;     1,y: b;     1,z: not c }.
n(V) :- V = #sum{ 1,x: a;     1,y: not b; 1,z: not c }.
o(V) :- V = #sum{ 1,x: not a; 1,y: not b; 1,z: not c }.

p(V) :- V = #sum{ 1,x: a;     1,y: b;     5,z: c     }.
q(V) :- V = #sum{ 1,x: a;     5,y: b;     5,z: c     }.
r(V) :- V = #sum{ 5,x: a;     5,y: b;     5,z: c     }.

s(V) :- V = #sum{ 1,x: a;     1,x: b;     1,x: c     }.
t(V) :- V = #sum{ 1,x: a;     1,x: b;     1,x: not c }.
u(V) :- V = #sum{ 1,x: a;     1,x: not b; 1,x: not c }.
v(V) :- V = #sum{ 1,x: not a; 1,x: not b; 1,x: not c }.

w(V) :- V = #sum{ 1,x: a;     1,x: b;     5,x: c     }.
x(V) :- V = #sum{ 1,x: a;     5,x: b;     5,x: c     }.
y(V) :- V = #sum{ 5,x: a;     5,x: b;     5,x: c     }.

