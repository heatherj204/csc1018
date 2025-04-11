class(X, positive) :- X > 0, !.
class(X, negative) :- X < 0, !.
class(X, zero) :- X == 0, !.