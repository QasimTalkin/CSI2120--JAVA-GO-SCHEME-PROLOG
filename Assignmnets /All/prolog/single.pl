% leave node - not single
single(t(_,nil,nil),[]).

% single missing right
single(t(E,L,nil),[E|S]) :- 
	single(L,S).

% single missing left
single(t(E,nil,R),[E|S]) :- 
	single(R,S).

% interior node - not single
single(t(_,L,R),S) :- 
	single(L,LS),
	single(R,RS),
	append(LS,RS,S).

% =======================================

% leave node - not single
single(t(E,nil,nil),_,t(E,nil,nil)).

% single missing right
single(t(E,L,nil),N,t(E,LN,t(N,nil,nil))) :- 
	single(L,N,LN).

% single missing left
single(t(E,nil,R),N,t(E,t(N,nil,nil),RN)) :- 
	single(R,N,RN).

% interior node - not single
single(t(E,L,R),N,t(E,LN,RN)) :- 
	single(L,N,LN),
	single(R,N,RN).


	
treeEx(X) :- 
 X = t(73,t(31,t(5,nil,nil),nil),t(101,t(83,nil,t(97,nil,nil)),nil)).
