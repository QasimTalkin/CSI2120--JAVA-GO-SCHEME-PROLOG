city(ottawa,ontario).
city(guelph,ontario).
city(kingston,ontario).
city(gatineau,quebec).
city(montreal,quebec).
team(ravens,ottawa).
team(ggs,ottawa).
team(gryphons,guelph).
team(queens,kingston).
team(torrents,gatineau).
team(stingers,montreal).
sport(annie,lacrosse).
sport(paul,crosscountry).
sport(suzy,ski).
sport(robert,basketball).
sport(tom,lacrosse).
sport(tim,ski).
sport(annie,ski).
sport(joe,basketball).
sport(robert,basketball).
sport(jane,basketball).
sport(marie,crosscountry).
sport(suzy,crosscountry).
sport(jack,ski).
sport(simon,lacrosse).
player(annie,gryphons).
player(tom,torrents).
player(jane,stingers).
player(marie,ggs).
player(joe,ravens).
player(jack,queens).
player(simon,ravens).
player(suzy,torrents).
player(paul,ggs).
player(marie,ggs).
player(simon,gryphons).


myAnswer :- 
	answer1,
	answer2,
	answer3,
	answer4,
	answer5.

% L = [jane, joe, robert].
answer1 :-	
	setof(P,sport(P,basketball),L),
	write(L), nl.

% L = [ggs, gryphons, queens, ravens].
answer2 :-	
	setof(T,C^(team(T,C),city(C,ontario)),L),
	write(L), nl.

% L = [annie, suzy].
answer3 :- 
	setof(P,S^T^(sport(P,S),sport(P,T),S\=T),L),
	write(L), nl.

% L = [(paul, crosscountry),  (joe, basketball),  (marie, crosscountry),  (marie, crosscountry),  (simon, lacrosse)].
answer4 :- 
	findall((P,S),(sport(P,S),player(P,T),team(T,ottawa)),L),
	write(L), nl.
	
% L = [(joe, basketball),  (marie, crosscountry),  (paul, crosscountry),  (simon, lacrosse)].
answer5 :-
	setof((P,S),T^(sport(P,S),player(P,T),team(T,ottawa)),L),
	write(L), nl.


interest(X) :- 
	sport(X, ski).

interest(X) :- 
	sport(X,S), 
	S \= ski, 
	player(X, T), 
	team(T, C), 
	city(C, quebec).
