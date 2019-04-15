%-------------------------------------------
% question 1a 
%-------------------------------------------

treeB(X) :- X=
t(58,
  t(31,
    t(16,
      t(5,
	t(2,nil,nil),
	nil),
      t(21,
	t(18,
	  nil,
	  t(19,nil,nil)),
	nil)),
    nil),
  t(67,
    t(63,
      nil,
      t(65,nil,nil)),
    nil)).

precedes(Key1, Key2) :-
            Key1 < Key2 .

inorder(nil).
inorder(t(Root,Left,Right)) :-
      inorder(Left),
      write(Root),
      write(' '),
      inorder(Right). 
	  
%-------------------------------------------
% question 1b
%-------------------------------------------

treeA(X) :- X=
t(73,
  t(31,
    t(5,nil,nil),
    nil),
  t(101,
    t(83,
      nil,
      t(97,nil,nil)),
    nil)).

% a
% binarySearch(K, t(K, _, _)).
% binarySearch(K, t(R, S, _)) :-
%     precedes(K, R),
%     binarySearch(S, K).
% binarySearch(K, t(R, _, S)) :-
%     precedes(R, K),
%     binarySearch(S, K).


% b
binarySearch(K, t(K, _, _)).
binarySearch(K, t(R, S, _)) :-
    precedes(K, R),
    binarySearch(K, S).
binarySearch(K, t(R, _, S)) :-
    precedes(R, K),
    binarySearch(K, S).

% c
% binarySearch(K, t(_, K, _)).
% binarySearch(K, t(_, _, K)).
% binarySearch(K, t(R, S, _)) :-
%     precedes(K, R),
%     binarySearch(K, S).
% binarySearch(K, t(R, _, S)) :-
%     precedes(R, K),
%     binarySearch(K, S).


% d
% binarySearch(K, t(K, _, _)).
% binarySearch(K, t(R, _, S)) :-
%     precedes(K, R),
%     binarySearch(K, S).
% binarySearch(K, t(R, S, _)) :-
%     precedes(R, K),
%     binarySearch(K, S).



% ?- treeA(X), binarySearch(83,X).


%-------------------------------------------
% question 2
%-------------------------------------------

link(0,1). 
link(1,2).
link(1,5).
link(2,3).
link(2,6).
link(3,7).
link(4,5).
link(4,8).
link(5,6).
link(6,7).
link(7,11).
link(8,9).
link(9,10).
link(10,11).

successor(A,B) :- link(A,B).
successor(A,B) :- link(B,A).

finish(11).

pathFinder([Last|Path],[Last|Path]) :-
	finish(Last).
pathFinder([Curr|Path],Solution) :-
	successor(Curr,Next),
 	\+member(Next,Path),
	pathFinder([Next,Curr|Path],Solution).



%--------------------------------------------
% question 3 -- not covered in 2015
%--------------------------------------------
:- dynamic userId/2.


userId(name(smith,[tony,a]), smith1 ).
userId(name(smith,[jane,m]), smith2 ).


% atomic_concat(+Atomic1, +Atomic2, -Atom) 
%     Atom represents the text after converting Atomic1 and Atomic2 to
%     text and concatenating the result:
%
%     ?- atomic_concat(name, 42, X).
%     X = name42.



createUserId( name(LastName,FirstNames) ) :-
    insertUserId( name(LastName,FirstNames), 1 ).


insertUserId( name(LastName,FirstNames), N ) :-
    atomic_concat(LastName,N,Id),
    \+userId( _,Id),    
    assert(userId(name(LastName,FirstNames),Id)).
 
insertUserId( name(LastName,FirstNames), N ) :-
    M is N+1,
    insertUserId( name(LastName,FirstNames), M ).
 

