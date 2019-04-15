zeroNodes(nil,nil) :- !.

zeroNodes(t(0,L,R),t(1,LL,RR)) :- 
    zeroNodes(L,LL),
    zeroNodes(R,RR), !.
        
zeroNodes(t(Key,L,R),t(Key,LL,RR)) :-
    zeroNodes(L,LL),
    zeroNodes(R,RR).