oddEven( [], [] ).

oddEven( [E|T], [even|L]) :-
	0 is E mod 2, !, 
	oddEven( T, L ).

oddEven( [O|T], [odd|L]) :-
	1 is abs(O mod 2), !, 
	oddEven( T, L ).



