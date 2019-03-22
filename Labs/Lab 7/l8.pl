

zeroNodes(nil, nil):- !.

zeroNodes(t(0,L,R),t(1, L1, L2)):- 
    zeroNodes(L, L1),
    zeroNodes(R, R1).
zeroNodes(t(key, L, R), t(key2, L1, R1) ):-
    zeroNodes(L, L1),
    zeroNodes(R, R1 ).

