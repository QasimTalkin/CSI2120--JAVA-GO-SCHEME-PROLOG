skip([],_,[]).

skip([E|I],S,L) :-
	member(E,S),!,
	noSkip(I,S,L).

skip([E|I],S,L) :-
	\+member(E,S),!,
	skip(I,S,L).
	
noSkip([],_,[]).
	
noSkip([E|I],S,[E|L]) :-
	member(E,S),!,
	skip(I,S,L).
	
noSkip([E|I],S,[E|L]) :-
	\+member(E,S),!,
	noSkip(I,S,L).
	
%====================================	

turn(I,T,L) :- turn(I,T,[],L).
	
turn([],_,O,O).

turn([E|I],T,L,O) :-
	member(E,T),!,
	noTurn(I,T,N),
	append([E|L],N,O).

turn([E|I],T,L,O) :-
	\+member(E,T),!,
	turn(I,T,[E|L],O).
	
noTurn([],_,[]).
	
noTurn([E|I],S,[E|L]) :-
	member(E,S),!,
	turn(I,S,[],L).
	
noTurn([E|I],T,[E|L]) :-
	\+member(E,T),!,
	noTurn(I,T,L).