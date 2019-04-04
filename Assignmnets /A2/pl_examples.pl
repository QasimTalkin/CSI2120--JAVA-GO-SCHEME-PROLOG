%Power of -> using recursion
%base case for power to 1 
pow(X, 1, X)
pow(X, Y, X) :- Y>1,
                Y1 is Y-1,
                pow(X, Y1, Z1),
                Z is X*Z1. 
