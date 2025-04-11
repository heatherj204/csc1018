child(anna, dede).
child(dede, carol).
child(carol, mary).
child(mary, sam).

descend(X, Y) :-
    child(X, Y).

descend(X, Y) :-
    child(X, Z),
    descend(Z, Y).