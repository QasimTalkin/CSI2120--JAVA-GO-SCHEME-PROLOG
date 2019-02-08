% Decision to go skiing

% trail conditions
condition( skyline, green ).
condition( burma, green ).
condition( fortune, green ).
condition( mcclosky, red ).
    
% no time tuesday thursday CSI2120
available( monday ).
available( wednesday ).
available( friday ).
    
% high temperatures
temperature( mild, monday ).
temperature( mild, tuesday ).
temperature( verycold, wednesday ).
temperature( cold, thursday ).
temperature( warm, friday ).

% available wax  
wax( green, verycold ).
wax( blueExtra, mild ).
wax( red, warm ).

route( Col ) :- condition( skyline, Col ),
		condition( burma, Col ),
		condition( fortune, Col ).

% hard-wired lights
connected(L) :- fuse(L, F),
		ok(F).

% plugged in ligh
connected(L) :- plug(L,S),
                fuse(S,F),
                ok(F).



%Answer Q3            
goSki(D,W) :- 
    available( D ),
    temperature( mild, D ),
    wax( W, mild ),
    condition( burma, green ).
