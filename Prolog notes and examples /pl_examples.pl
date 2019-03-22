%consult(pl_examples).

%Power of -> using recursion
%base case for power to 1 
pow(X, 1, X).
pow(X, Y, Z) :- Y>1,
                Y1 is Y-1,
                pow(X, Y1, Z1),
                Z is X*Z1. 

%Fib series 
%Fib base case
fib(0,1).
fib(1,1).
fib(N,F) :- N>1,
            N1 is N-1,
            N2 is N-2,
            fib(N1, F1), 
            fib(N2, F2),
            F is F1+F2.   

%crossed recusrsion Odd vs Even


odd(N):- N>0, 
        M is N-1, 
        even(M).

even(N) :- N>0, 
           M is N-1,
           odd(M).
even(0). 

% even(3) - odd(2) - even(1) - [F] 
% even(4) - odd (3) - even(2) - odd(1) - even(0) [T]

% Interval test 
intervalTest(X, L, H) :- X>=L, X=<H.
interval(X, L, H):- number(X), number(L), number(H), !, X>=L, X=<H.
interval(X, X, H) :- number(X), number(H), X=<H.
interval(X, L, H) :- number(L), number(H), L < H,
                     L1 is L+1,
                     interval(X, L1, H).


calculator :- repeat, 
              read(X),
              eval(X,Y),
              write(Y), nl,
              Y = end, !. 
eval(end, end) :-  !. 
eval(X, Y):- Y is X+13. 

main:- 
    write("The power of 10^10 is : "), pow(10,10,Q), print(Q), nl,
    write("The fib of 14 is : "), fib(14, F), print(F), nl,
    write("Test a numer for even :"),
    read(X),
    even(X).
%file 

writefile(X):- open('out.txt', append, F), 
               write(F, X), nl(F), 
               close(F).

%integer root of number. 

%Generator. 
int(0). %true. 
int(N) :- int(N1), N is N1+1, print(N).
%Root predicate. 
root(N,R):- int(K), print(K),
            K*K>N, !,
            R is K-1. 

max(X, Y, X) :- X >=Y, !.  
max(_,Y,Y). 


%Nagation Example 

sad(joe).
camper(jane).
happy(X) :- not(sad(X)),
            camper(X).
        
mylist(X, Y, [X|Y]).

%List insert 
lInsert(A, L, [A|L]). 
lInsert(A, [X|L], [X|LL]) :- lInsert(A, L, LL).

%nth elemnt of the list. 
take(1,[H|_],H):- !. % base case 
take(N,[_|T],X):- N1 is N-1, take(N1,T,X). % when you take n-1 it come to base case. 

%Reversie a list. 
reverList([], L, L) :-!.
reverList([H|T], L, R) :- reverList(T, [H|L], R). 
mirrroAcc(L,R) :- reverList(L, [], R). 

%sample run to cut.
posT([]). 
posT([a|Rate]):- posT(Rate), !, nl.
posT([X|Rate]):- posT(Rate), write(X).
posT([1,2,3,a,d,v,c,f,g,t]).


%Looping 
countDownR(N) :- N<0,!.
countDownR(N) :- writeln(N), 
    NN is N-1, 
    countDownR(NN).

%find and loop 
element(chlorine,'Cl').
element(helium,'He').
element(hydrogen,'H').
element(nitrogen,'N').
element(oxygen,'O').

elmt :-  repeat, writeln("Symbol ? :"), read(X), not(find(X)), nl, write("Bye"), !, fail. 
find(X):- element(A,X), writeln(" Element is  : "), writeln(A), !.
find(X):- writeln(X), writeln("not found"), !, fail.


%cut and fail 
canalOpen( saturday ).
canalOpen( monday ).
canalOpen( tuesday ).
raining( saturday ).
melting( saturday ).
melting( sunday ).
melting( monday ).

%return true if the Canal is open, it is not raining and not melting
weather( X ) :- melting( X ),
    !, fail.
weather( X ) :- raining( X ),
    !, fail.
weather( _ ).  
winterlude( X ) :- canalOpen( X ),
    weather( X ).
%list processing to finds the second last element of a list.
secondLast( H, [H|[_|[]]] ) :- !. 
secondLast( X, [_|T] ) :- secondLast( X, T ). 
%addsecond. 
addSecond([], 0).
addSecond( [_,B|R], S ) :- 
	addSecond( R, RS ),
	S is RS + B.
addSecond( [_|R], S ) :-
	addSecond( R, S).

%DB TO Perform some opertations 
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


findall(X, sport(X,_), Xlist).

bagof(X, Y^(sport(X,Y)), Xlist).

setof(Template, Goal, Set)

findall(X, (setof(Y, Y^sport(X,Y),Xs), length(Xs, 2)), ListofTwoPs)


setof(Y, Y^sport(X,Y),Xs)