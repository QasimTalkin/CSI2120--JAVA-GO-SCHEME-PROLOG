% question 2: The predicate deleteBack is to delete the last occurence of a queried element R in a list. Complete the predicate below 

% element to be removed, input list, accumulator with R, result
deleteBack( _, [], [], [] ).
deleteBack( R, [R|LI], [R|A], L0) :- 
		\+member(R,LI), !,
		deleteBack( R, LI, A, L0 ).
deleteBack( R, [E|LI], [E|A], [E|LO] ) :- 
    deleteBack( R, LI, A, LO).


deleteBack( R, LI, LO ) :- deleteBack( R, LI, _, LO ).



% ?- deleteBack( 6, [3,6,5,6,7], L).
% L = [3, 6, 5, 7] ;
% false.




