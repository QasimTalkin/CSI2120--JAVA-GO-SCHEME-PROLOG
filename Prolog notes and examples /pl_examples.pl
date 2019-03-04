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
interval(X, X, H) :- X=<H.
interval(X, L, H) :- L < H,
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