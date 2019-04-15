unionList1([],B,B).
	
unionList1([E|A],B,D) :-
	member(E,B),!,
	unionList1(A,B,D).

unionList1([E|A],B,[E|D]) :-
	unionList1(A,B,D).
	
unionList2(A,B,C) :- unionList2(A,B,[],C).	

unionList2(_,B,B,[]) :- !.

unionList2(A,B,C,[E|D]) :-
		\+member(E,A),
		unionList2(A,B,[E|C],D).

unionList2(A,B,C,[E|D]) :-
		member(E,A),
		unionList2(A,B,[E|C],D).

unionList2(A,B,C,[E|D]) :-
		member(E,A),
		unionList2(A,B,C,D).


unionList3([],[],[]).

unionList3([E|A],B,[E|D]) :-
	unionList3(A,B,D).
	
unionList3(A,[E|B],[E|D]) :-
	unionList3(A,B,D).

unionList3([E|A],[E|B],[E|D]) :-
	unionList3(A,B,D).

		
		
unionList(A,B,C) :- 
	is_list(A),
	is_list(B),
	unionList1(A,B,C).
		
unionList(A,B,C) :- 
	is_list(A),
	is_list(C),
	unionList2(A,B,C).
		
unionList(A,B,C) :- 
	is_list(B),
	is_list(C),
	unionList2(B,A,C).

unionList(A,B,C) :- 
	\+is_list(A),
	\+is_list(B),
	is_list(C),
	unionList3(A,B,C).
	
	
% ====================== Not Used ==================	
	
unionListA(A,B,C) :- unionListA(A,B,[],C).


unionListA([],[],[],[]) :- !.		
		
unionListA([E|A],B,C,D) :-
		member(E,C),
		unionListA(A,B,C,D).
				
unionListA([],[E|B],C,D) :-
		\+member(E,C),
		unionListA([],B,[E|C],D).
		
unionListA([],[E|B],C,D) :-
		member(E,C),
		unionListA([],B,C,D).

		
unique(A) :- is_list(A),unique(A,A), !.	
	
unique([],[]).	
	
unique([E|A],[E|B]) :- 
	\+member(E,A),
	unique(A,B).
	
unique([E|A],B) :- 
	member(E,A),
	unique(A,B).

	
	
	