directNorth(a, f).
directNorth(f, k).
directNorth(k, p).
directNorth(b, g).
directNorth(g, l).
directNorth(l, q).
directNorth(c, h).
directNorth(h, m).
directNorth(m, r).
directNorth(d, i).
directNorth(i, n).
directNorth(n, s).
directNorth(e, j).
directNorth(j, o).
directNorth(o, t).

directWest(a, b).
directWest(b, c).
directWest(c, d).
directWest(d, e).
directWest(f, g).
directWest(g, h).
directWest(h, i).
directWest(i, j).
directWest(k, l).
directWest(l, m).
directWest(m, n).
directWest(n, o).
directWest(p, q).
directWest(q, r).
directWest(r, s).
directWest(s, t).


directSouth(X, Y) :- directNorth(Y, X).

directEast(X, Y) :- directWest(Y, X).

north(X, Y) :- directNorth(X, Y).
north(X, Y) :- directNorth(X, Z), north(Z, Y).

south(X, Y) :- directSouth(X, Y).
south(X, Y) :- directSouth(X, Z), south(Z, Y).

east(X, Y) :- directEast(X, Y).
east(X, Y) :- directEast(X, Z), east(Z, Y).

west(X, Y) :- directWest(X, Y).
west(X, Y) :- directWest(X, Z), west(Z, Y).

northWest(X, Y) :- north(X, Y), west(X, Y).
southWest(X, Y) :- south(X, Y), west(X, Y).

northEast(X, Y) :- north(X, Y), east(X, Y).
southEast(X, Y) :- south(X, Y), east(X, Y).