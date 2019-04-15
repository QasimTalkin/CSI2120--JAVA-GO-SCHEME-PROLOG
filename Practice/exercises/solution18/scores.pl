highscore( 'Emma', 'FIFA18', 3 ).
highscore( 'Benjamin', 'Minecraft', 387 ).
highscore( 'Liam',  'The Legend of Zelda', 2200 ).
highscore( 'Ethan', 'Super Mario Odyssey', 15100 ).
highscore( 'Ava', 'Minecraft', 410 ).
highscore( 'Liam', 'Minecraft', 222 ).
highscore( 'Ava',  'The Legend of Zelda', 100 ).
highscore( 'Aha',  'The Legend of Zelda', 1500 ).
highscore( 'Alva',  'The Legend of Zelda', 19700 ).
highscore( 'Aa',  'The Legend of Zelda', 19440 ).


% Use setof/3 to find a sorted list of all highscores in Minecraft

% setof( X, Y^highscore( _,'Mincraft',X), L).
% L = [222, 387, 410].

% Use findall/3 to find a list of all games played by Liam

% findall(X,highscore('Liam', X,_),L).
%L = ['The Legend of Zelda', 'Minecraft'].

% Write a predicate that finds the game with the largest number of players
popular( P ) :- findall( G, highscore(_,G,_),L),
				setof( G, N^S^highscore(N,G,S),LL),
				findMax( L, LL, P, _ ).

countGames( [], _, 0 ) :- !.

countGames( [O|T], G, C ) :- O \== G, !, 
							countGames( T, G, C ).

countGames( [G|T], G, C ) :- countGames( T, G, CN ),
							C is CN + 1.


max( MG, MC, _, CC, MG, MC ) :- MC>CC, !.

max( _, _, G, C, G, C ) :- !.


findMax( _, [], 'None', 0 ) :- !.

findMax( L, [G|OG], M, C ) :- findMax( L, OG, MG, MC ),
							countGames( L, G, CC ),
							max( MG, MC, G, CC, M, C ).
