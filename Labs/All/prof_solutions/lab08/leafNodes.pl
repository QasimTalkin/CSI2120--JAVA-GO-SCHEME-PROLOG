leafNodes(T,L) :- leafNodes(T,[],L).

leafNodes(nil,L,L) :- !.

leafNodes(t(Root,nil,nil),L,[Root|L]) :- !.

leafNodes(t(_,Left,Right),L,LL) :-
      leafNodes(Left,L,LI),
      leafNodes(Right,LI,LL).
