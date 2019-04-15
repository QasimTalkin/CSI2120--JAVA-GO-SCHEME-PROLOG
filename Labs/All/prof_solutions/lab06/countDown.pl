% will loop forever with the same number because it N is N-1 fails.
% Free variable cannot be assigned will not work.
countDown(N):- repeat, 
    writeln(N), 
    N is N-1, 
    N<0, !. 


% recursion instead
countDownR(N) :- N<0,!.
countDownR(N) :- writeln(N), 
    NN is N-1, 
    countDownR(NN).
