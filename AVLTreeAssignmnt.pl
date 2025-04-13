/* insert -> balance -> rotateLeft/rotateRight -> heightUpdate -(height) -> balanceFactor*/

% Inserting into the tree
insert(X, empty, bt(X, empty, empty, 1)). % Insert into an empty tree, creating a new node with height 1
insert(X, bt(N, L, R, _), T2) :-
    (X =< N -> % If the value to insert is less than or equal to the current node's value:
        insert(X, L, L1); 
        insert(X, R, R1),
        ) 
        balance(bt(N, L1, R, _), T2). 


% Get the height of a tree
height(empty, 0). % The height of an empty tree is 0
height(bt(_, _, _, H), H).


% Update the height of a tree node
heightUpdate(bt(N, L, R, _), bt(N, L, R, H)) :- 
    height(L, LH), 
    height(R, RH), 
    max(LH, RH, MaxHeight),
    H is MaxHeight + 1. 

% Get the balance factor of a tree
balanceFactor(empty, 0). % The balance factor of an empty tree is 0
balanceFactor(bt(_, L, R, _), BF) :-
    height(L, LH), 
    height(R, RH), 
    BF is LH - RH. % The balance factor is the difference between the left and right heights

/* Balancing the tree*/
% Balance the tree
balance(T, T1) :- 
    heightUpdate(T, T0),
    balanceFactor(T0, BF), % Get bf of the tree
    (BF > 1 -> % If the bf is more then 1 then the tree needs a right roatation
        (T0 = bt(N, L, R, _), balanceFactor(L, LBF), % Check the balance factor of the left subtree
         (LBF >= 0 -> % If the left subtree is balanced or left-heavy, perform a right rotation
             rotateRight(T0, T1);
             rotateLeft(L, L1), % Otherwise, perform a left rotation on the left subtree
             heightUpdate(bt(N, L1, R, _), T2), % Update the height after rotation
             rotateRight(T2, T1)
         )
        );
     BF < -1 -> % If the bf is less then -1 then the tree needs a left roatation
        (T0 = bt(N, L, R, _), balanceFactor(R, RBF), 
         (RBF =< 0 -> % 
             rotateLeft(T0, T1);
             rotateRight(R, R1), 
             heightUpdate(bt(N, L, R1, _), T2),
             rotateLeft(T2, T1) 
         )
        );
     T1 = T0 % No changes are needed if its already balanced
    ).

/* Rotations */
% Left Rotation
rotateLeft(bt(X, A, bt(Y, B, C, _), _), R) :-
    heightUpdate(bt(X, A, B, _), T1), % Update the height of the left subtree after rotation
    heightUpdate(bt(Y, T1, C, _), R). % Update the height of the new root after rotation

% Right Rotation
rotateRight(bt(Y, bt(X, A, B, _), C, _), R) :- 
    heightUpdate(bt(Y, B, C, _), T1), 
    heightUpdate(bt(X, A, T1, _), R).


% Display the tree
display(Tree) :- display(Tree, 0). % Start displaying the tree from depth 0.

display(empty) :- write('Tree is empty'), nl. % Do nothing for an empty tree.
display(bt(N, L, R, _), Depth) :- 
    write('TREE:'), nl,
    D1 is Depth + 1, % Increment the depth for the subtrees
    display(R, D1), % Display the right subtree
    tab(Depth * 4), write(N), nl, % Indent based on the depth and print the current node
    display(L, D1). % Display the left subtree
