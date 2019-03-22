

zeroNodes(nil, t(1, nil, nil)):- !.

zeroNodes(t(0,L,R),T):- 
    zeroNodes(L, T),
    zeroNodes(R, T).
zeroNodes(t(key, L, R), t(key2, L, R), nil ):-
    zeroNodes(L, t(key2, L, R)),
    zeroNodes(R, t(key, L, R) , 1).

