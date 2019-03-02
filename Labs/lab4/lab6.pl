addSecond(List,Result) :- addSecond(List,0,Result).

addSecond([],A,A).             % Empty list
addSecond([_],A,A).            % One element left in list
addSecond([_,H|T],A,R) :-      % Accumulate sum of second element
    A2 is A+H,
    addSecond(T,A2,R).



what who when  (knowledge)

why how when
