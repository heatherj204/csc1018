sumList([], 0). % base case
sumList([H|T], N) :- % Splitting the list into its head and tale
    sumList([T, N1]), % Recursive sending back the tale of the list and giving it the sum of N1
    N is H + N1. % Setting N to be N1 plus what ever H was orgionally