% AVL Tree implementation in Prolog

% empty tree
empty.

% binary tree node: bt(Value, Left, Right)
bt(N, L, R).

% height of a tree
height(empty, 0).
height(bt(_, L, R), H) :-
    height(L, H1),
    height(R, H2),
    H is max(H1, H2) + 1.

% balance factor of a node
balance_factor(bt(_, L, R), BF) :-
    height(L, LH),
    height(R, RH),
    BF is LH - RH.

% check if a tree is AVL
is_avl(empty).
is_avl(bt(_, L, R)) :-
    is_avl(L),
    is_avl(R),
    balance_factor(bt(_, L, R), BF),
    BF >= -1, BF =< 1.

% right rotation
rotate_right(bt(X, bt(Y, A, B), C), bt(Y, A, bt(X, B, C))).

% left rotation
rotate_left(bt(X, A, bt(Y, B, C)), bt(Y, bt(X, A, B), C)).

% left-right rotation
rotate_left_right(bt(Z, bt(X, A, bt(Y, B, C)), D), bt(Y, bt(X, A, B), bt(Z, C, D))).

% right-left rotation
rotate_right_left(bt(Z, A, bt(X, bt(Y, B, C), D)), bt(Y, bt(Z, A, B), bt(X, C, D))).

% rebalance tree after insertion
rebalance(T, T) :-
    balance_factor(T, BF),
    BF >= -1, BF =< 1.
rebalance(bt(X, L, R), Rebalanced) :-
    balance_factor(bt(X, L, R), BF),
    (BF > 1 ->  % left heavy
        balance_factor(L, LBF),
        (LBF >= 0 ->
            rotate_right(bt(X, L, R), Rebalanced)
        ;
            rotate_left_right(bt(X, L, R), Rebalanced)
        )
    ; BF < -1 ->  % right heavy
        balance_factor(R, RBF),
        (RBF =< 0 ->
            rotate_left(bt(X, L, R), Rebalanced)
        ;
            rotate_right_left(bt(X, L, R), Rebalanced)
        )
    ).

% insert into AVL tree
insert(I, empty, bt(I, empty, empty)).
insert(I, bt(Root, L, R), NewTree) :-
    (I =< Root ->
        insert(I, L, NewL),
        NewTree0 = bt(Root, NewL, R),
        rebalance(NewTree0, NewTree)
    ;
        insert(I, R, NewR),
        NewTree0 = bt(Root, L, NewR),
        rebalance(NewTree0, NewTree)
    ).

% display tree with indentation
display(T) :-
    display(T, 0).

display(empty, _).
display(bt(N, L, R), Depth) :-
    Depth1 is Depth + 1,
    display(R, Depth1),
    print_indent(Depth),
    write(N), nl,
    display(L, Depth1).

print_indent(Depth) :-
    Depth > 0,
    Depth1 is Depth - 1,
    print_indent(Depth1),
    write('   ').
print_indent(0).
