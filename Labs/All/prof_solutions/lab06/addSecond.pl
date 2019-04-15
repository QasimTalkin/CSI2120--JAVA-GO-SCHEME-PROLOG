addSecond([], 0).

addSecond( [_,B|R], S ) :- 
	!,
	addSecond( R, RS ),
	S is RS + B.
	

addSecond( [_|R], S ) :-
	!,
	addSecond( R, S).