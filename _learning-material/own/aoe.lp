    cool(franz).   aoeplayer(franz).
    cool(tom). not aoeplayer(tom).
    cool(wim). not aoeplayer(wim).
not cool(erikson). aoeplayer(erikson).

playaoenow(Person) :- cool(Person), aoeplayer(Person).
%  aoespielen     wenn    cool   und   aoespieler

#show playaoenow/1.