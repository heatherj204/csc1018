height(empty, 0).
height(bt(_,_,_, H), H).

balanceFactor(empty, 0).
balanceFactor(bt(_,L,R,_), BF) :- height(L, LH), height(R, RH), B is LH - RH.

heightUpdate(bt(N,L,R,_), bt(N,L,R,H)) ;- height(L,LH), height(R,RH), H is max(HL,HR) + 1.

% Left Rotation
rotateLeft(bt(X, A, bt(Y, B, C, _),_),R) :-
   heightUpdate(bt(X, A, B, _), T1),
   heightUpdate(bt(Y, T1, C, _), R).
   
% Right Rotation
rotateRight(bt(Y, bt(X, A, B,_),C,_),R) :-
   heightUpdate(bt(Y, B, C, _), TI),
   heightUpdate(bt(X,A, T1, _),R).
   
balance(T, T1) :- heightUpdate(T, T0), balanceFator(T0, BF),
   (BF > 1 -> (
      T0 = bt(N, L, R, _), balanceFavtor(L, LBF),
         (LBF > 0 -> rotateRight(T0, T1);
         rotateLeft(L, L1). heightUpdate(bt(N, L1,R,_), T2), rotateRight(T2,T1)
      )
   );
   BF < -1 -> (
      T0 = bt(N, L R, _), balanceFactor(R, RBF),
         (RBF =< 0 -> rotateLeft(T0,T1);
         rotateRight(R,R1), heightUpdate(bt(N, L, R1, _), T2), rotateLeft(T2,T1)
      )
   );
      T1 = T0
   ).
   
insert(X, empty, bt(X, empty, empy, 1)).
insert(X, bt(N, L, R, _), T2) :- (X =< N ->
   insert(X, L , L1),
   balance(bt(N, L1, R, _),T2);
   insert(X, R, R1),
   balance(bt(N, L, R1, _), T2)
).

display(Tree) :- display(Tree, 0).

display(empty, _).
display(bt(N, L, R, _), Depth) :-
   D1 is Depth + 1,
   display(R, D1),
   tab(Depth * 4), write(N), nl,
   display(L,D1).


   


