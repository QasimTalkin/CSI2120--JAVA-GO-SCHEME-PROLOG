canalOpen( saturday ).
canalOpen( monday ).
canalOpen( tuesday ).

raining( saturday ).

melting( saturday ).
melting( sunday ).
melting( monday ).


weather( X ) :- melting( X ),
    !, fail.
weather( X ) :- raining( X ),
    !, fail.
weather( _ ).  


winterlude( X ) :- canalOpen( X ),
    weather( X ).

