{ a; b }.
c :- a.
d :- b.
:- #sum{ 1,x: c; 1,x: d } 1.
