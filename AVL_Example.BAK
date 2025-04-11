% AVL Tree Node: bt(Value, Left, Right, Height)
% An empty tree is represented by the atom 'empty'.

% height(Tree, Height)
height(empty, 0).
height(bt(_, _, _, H), H).

% balance_factor(Tree, Factor)
balance_factor(empty, 0).
balance_factor(bt(_, L, R, _), BF) :-
    height(L, HL),
    height(R, HR),
    BF is HL - HR.

% update_height(Tree, NewTree)
update_height(bt(V, L, R, _), bt(V, L, R, H)) :-
    height(L, HL),
    height(R, HR),
    H is max(HL, HR) + 1.

% left_rotate(Tree, RotatedTree)
left_rotate(bt(X, A, bt(Y, B, C, _), _), R) :-
    update_height(bt(X, A, B, _), T1),
    update_height(bt(Y, T1, C, _), R).

% right_rotate(Tree, RotatedTree)
right_rotate(bt(Y, bt(X, A, B, _), C, _), R) :-
    update_height(bt(Y, B, C, _), T1),
    update_height(bt(X, A, T1, _), R).

% balance(Tree, BalancedTree)
balance(T, T1) :-
    update_height(T, T0),
    balance_factor(T0, BF),
    (
        BF > 1 -> (
            T0 = bt(V, L, R, _),
            balance_factor(L, LBF),
            (
                LBF >= 0 ->
                    right_rotate(T0, T1)
                ;
                    left_rotate(L, L1),
                    update_height(bt(V, L1, R, _), T2),
                    right_rotate(T2, T1)
            )
        )
    ;
        BF < -1 -> (
            T0 = bt(V, L, R, _),
            balance_factor(R, RBF),
            (
                RBF =< 0 ->
                    left_rotate(T0, T1)
                ;
                    right_rotate(R, R1),
                    update_height(bt(V, L, R1, _), T2),
                    left_rotate(T2, T1)
            )
        )
    ;
        T1 = T0
    ).

% insert(Value, Tree, NewTree)
insert(X, empty, bt(X, empty, empty, 1)).
insert(X, bt(V, L, R, _), T2) :-
    (
        X =< V ->
            insert(X, L, L1),
            balance(bt(V, L1, R, _), T2)
        ;
            insert(X, R, R1),
            balance(bt(V, L, R1, _), T2)
    ).

% display(Tree)
display(Tree) :-
    display(Tree, 0).

display(empty, _).
display(bt(V, L, R, _), Depth) :-
    D1 is Depth + 1,
    display(R, D1),
    tab(Depth * 4), write(V), nl,
    display(L, D1).

