myElem(X, [X|_]).
myElem(X, [_|Tail]) :-
    myElem(X, Tail).

myHead(X, [X|_]).

myLast(X, [X]).
myLast(X, [_|Tail]) :-
    myLast(X, Tail).

myTail(X, [_|X]).

myAppend(A, B, C) :-
    append(A, B, C).

myReverse([], []).
myReverse([Head|Tail], Rev) :-
    myReverse(Tail, RevTail),
    append(RevTail, [Head], Rev).

myDelete(X, [X|L], L).
myDelete(X, [Y|Tail], [Y|Tail1]) :-
    myDelete(X, Tail, Tail1).
