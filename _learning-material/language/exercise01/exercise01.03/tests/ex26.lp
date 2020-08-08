1 { a; b } 1.
c :- a.
d :- b.
c :- d, not a.
d :- c, not b.
