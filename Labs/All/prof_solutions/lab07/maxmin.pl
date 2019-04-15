maxmin([H|T],Max,Min) :-
    maxmin(T,H,H,Max,Min), !.

% new max
maxmin([H|T],MX,MN,Max,Min) :-
    H > MX,
    maxmin(T,H,MN,Max,Min).

% new Min
maxmin([H|T],MX,MN,Max,Min) :-
    H < MN,
    maxmin(T,MX,H,Max,Min).

% just recurse
maxmin([_|T],MX,MN,Max,Min) :-
    maxmin(T,MX,MN,Max,Min).

% Base case
maxmin([],Max,Min,Max,Min).

