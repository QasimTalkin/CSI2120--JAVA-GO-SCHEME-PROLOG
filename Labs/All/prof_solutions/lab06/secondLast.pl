secondLast( H, [H|[_|[]]] ) :- !.

secondLast( X, [_|T] ) :- secondLast( X, T ). 
