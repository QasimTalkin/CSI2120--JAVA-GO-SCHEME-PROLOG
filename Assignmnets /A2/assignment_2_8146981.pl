%DATABASE FOR Q1 and Q2
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
%finds all basketball players
% findall([], sport(X, basketball), L).
% bbpl(X) :- sport(X, basketball).
% ontteams(X) :- city(Y,ontario), team(X, Y), print(X).
% (d)  

%(1a : list of all basketball players)
pls(BPlist):- 
    setof(X, sport(X, basketball), BPlist).

%(1b :  list of Ontario teams)
onT(Tlist) :- 
    setof(OT, X^(city(X, ontario), team(OT,X)), Tlist).

%(1c :  list of players that play more than one sport)
allP(Plist):-
    findall(X, (setof(Y, Y^sport(X,Y),Xs), length(Xs, 2)), Plist).


%(1d :  list of players for Ottawa teams and their sport )
ott(L):-
    findall((Y,Z), (team(X, ottawa), player(Y,X), sport(Y,Z)), L). 


% ~ (1e : Unique list of players for Ottawa teams and their sport )
%marie comes twice previously cuz we are saying find all which generates the most N solutions
uott(Lan):- 
    setof((Name,Game), Team^(sport(Name,Game), player(Name,Team), team(Team, ottawa)),Lan).

%__________________________________________________________________

myanswer :- write("BP List : "), pls(BPlist), write(BPlist), nl,
write("OT List : "), onT(Tlist), write(Tlist), nl,
write("MS Players : "), allP(TPlist), write(TPlist), nl,
write("OT&S List : "), ott(L), write(L), nl,
write("Unique list : "),uott(Lan1), write(Lan1), nl.
%__________________________________________________________________

interest(X):- 
    sport(X, ski). 

interest(X):- 
    sport(X, S), 
    S \= ski,
    player(X, T),
    team(T, C),
    city(C, quebec).

%Illegal cases 
area([[],[],[_]], _ ) :- ! , fail . % not a triangle.
area([[],[_],[_]], _ ) :- ! , fail . % not a triangle.
area([[_],[],[_]], _ ) :- ! , fail . % not a triangle.
area([[_],[_],[]], _ ) :- ! , fail . % not a triangle.
area([[_],[],[]], _ ) :- ! , fail . % not a triangle.
area([[],[_],[]], _ ) :- ! , fail . % not a triangle.
%Area calculate. 
area([[PX1|PY1], [PX2|PY2], [PX3|PY3]], Area) :- 
    Area is abs((((PX2-PX1)*(PY3-PY1))-((PX3-PX1)*(PY2-PY1)))/2).
%Tree
treeEx(X) :-   X = t(73,
    t(31,
        t(5,nil,nil),nil),
    t(101,
        t(83,nil,t(97,nil,nil)),nil)
    ).
%tree to list
single(t(_, nil,nil), []) :- !.
single(t(V,L,nil),[V|Vs]) :- single(L, Vs).
single(t(V,nil,R),[V|Vs]) :- single(R, Vs).
single(t(_, X, Y), L) :-
    single(X, L1),
    single(Y, L2),
    append(L1, L2, L).

% Boundry case
single(t(_, nil, nil), Key, t(Key, nil, nil)). 

single(Key, nil, t(Key, nil, nil)).
single(t(Root, Left, Right), Key, t(Root, LeftPlus, Right)):- 
single( Left, Key, LeftPlus).
single(t(Root, Left, Right), Key, t(Root, Left, RightPlus)) :-
single(Key, Right, RightPlus).