ptTree(T) :- T = t(2,-3,
                   [t(5,1,[t(7,2,[])]),
                    t(-3,4,[]),
                    t(2,4,[t(-1,1,[]),
                           t(-2,3,[])])]
                  ).


traverse(t(X,Y,[])) :- write(X), tab(1), write(Y), nl.


traverse(t(X,Y,[H|T])) :- traverse(H),
    write(X), tab(1), write(Y), nl,
    traverseTail(T).

traverseTail([]) :- !.

traverseTail([H|T]) :- traverse(H),
    traverseTail(T).


findPoint(t(U,V,_),U,V) :- !.

findPoint(t(_,_,[H|_]),U,V) :- findPoint(H, U, V).

findPoint(t(_,_,[_|T]),U,V) :- findPointTail(T,U,V).

findPointTail([H|_],U,V) :- findPoint(H,U,V).

findPointTail([_|T],U,V) :- findPointTail(T,U,V).


% ptTree(T),traverse(T).

% ptTree(T),findPoint(T,-1,1).

