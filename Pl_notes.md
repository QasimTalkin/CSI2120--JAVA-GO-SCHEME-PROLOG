#### Declarative and logic programing. 
* AI, RDMS, Natural Language, Mathematics, Abstract, Design, symbolic equation solving

* Descriptive : knows facts and relationships about a problem as oppose to taking steps to solving a problem. 
  
#### Programing in Pl 

* Specify Facts! (always true,  Qasim likes JS Fact -> [Likes (qasim, js). ] )
* Relationship -> likes  (all lower case and relationship(predicate) is written first followed by arguments in parenthesis and ending in " . " )
* In predicate the order is impotent liker(qasim) first then liked(JS) in like fact. 
```prolog
domestic(cows). % cows are domestic animals.
faster(horses,cows). % horses run faster than cows
take(cats,milk,cows). % cats take milk from cows
isYellow(hay). % hay is yellow.
eat(cows,hay). % Cows eat hay.
```
* Facts are stored in database. 
* Define rules. 
* Run Queries 
```prolog 
Database 
like(horses,fish).
like(dogs,cats).
like(cats,mice).
like(dogs,mice).
like(horses,racing).
like(cats,horses).
like(tigers,cats).
like(cats,hay).
like(cows,grass).
like(cows,hay).
like(horses,hay).

Simple Queries 

?- like(dogs,bones).
?- like(cats,dogs).
?- like(cats,hay).
?- enjoy(horses,racing).
```
* Pl answers yes or no! 

#### Computing in PL 

* logical semantics 
* What future facts can be driven ?
* By what information has been supplied by the user. some form of imperative (giving an authoritative command; peremptory. )perspective 

#### Variables 
* use variable to ask prolog what it could be in database?  
```
like (cat, x)
%x = mice 
```