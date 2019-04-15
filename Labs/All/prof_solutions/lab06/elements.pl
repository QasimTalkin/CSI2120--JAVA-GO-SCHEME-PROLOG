element(chlorine,'Cl').
element(helium,'He').
element(hydrogen,'H').
element(nitrogen,'N').
element(oxygen,'O').


lookUp(S) :-
    element( E, S ),
    write( S ),  write( ' is the symbol for: '), writeln(E), !.

lookUp(S) :-
    write( 'Don\'t know the symbol: ' ), writeln(S), !, fail. 

elements :- writeln('Elements in the Periodic Table '),
    repeat,
    write('Symbol to look-up: '),
    read(S),
    not(lookUp(S)),
    writeln('Exiting'),
    !, fail.


