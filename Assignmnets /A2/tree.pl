treeA(X) :-
	X = t(73, t(31, t(5,nil,nil), nil), t(101, t(83, nil, t(97,nil,nil)), t(2016,nil,nil))).

lca(K1,K2,t(Root,Left,Right)) :-
	(K1 is Root; K2 is Root),
	write(t(Root,Left,Right)).

lca(K1,K2,t(Root,Left,_)) :-
	K1 < Root, K2 < Root,
	lca(K1,K2,Left).

lca(K1,K2,t(Root,_,Right)) :-
	K1 > Root, K2 > Root,
	lca(K1,K2,Right).

lca(K1,K2,t(Root,Left,Right)) :-
	K1 < Root, K2 > Root,
	write(t(Root,Left,Right)).

lca(K1,K2,t(Root,Left,Right)) :-
	K1 > Root, K2 < Root,
	write(t(Root,Left,Right)).