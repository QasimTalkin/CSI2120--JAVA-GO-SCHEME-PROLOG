## Scheme Lists 

#### Predicate formula. 
* symbol ? indicates true (#t) and false (#f)
* (symbol? x) -> gives true if x is symbol
* (number? x) -> gives true if x is number
* (eq? x y) -> true if x and y have same representation (i.e same pointer value.) 
* (equal? x y) -> true if x and y are same (structure and content)
* (null? x) -> true if x is empty list
* (pair? x) -> true if x is a list or pair 
* (procedure? x)-> true if its a procedure
* (list? x)-> true if x is a list

##### eq?
- compared pointer
- cannot compare number or character 
```Scheme
(define hello 'bonjour')
>(eq? hello hello) 
#t
(eq? "bonjour" "bonjour")
#t
```
##### eqv?
- same like eq? but can compare char and number by their value
- cannot compare list, strings and functions. 
```Scheme
(eqv? 1 1)
#t
(eqv? 2 (+ 1 1)) 
#t
(eq? 1 1.0)
#t
```
##### equal?
- works on all even to compare list, strings and functions. 
```Scheme
(equal? (list 1 2) '(1 2))
#t
```
### Control Structure
- Scheme has no loops! oly function and conditional expressions, and **sequence** 
- Sequence starts with being. 
```Scheme 
>(begin (display 'okay) (display 'great))
okaygreat
>(begin (+ 1 9) (- 1 2))
-1 ;last out put. 
```
### List representation. 
- consists of two pointer first one give the address of the atom and next one point to corresponding lis.
(a((b c) d)e)
### Pairs
#### CAR, CDR, CONS, CDADR
- dotard pair are not list.
- cons contracts a pair  
- we construct a list using cons first points to the parameter and second to the object.
- CAR Continent of Adders Register. 
- Content of Decedent Register. 
- can nest car and cdr and const
```scheme
>(cons 'a '(b c))
(a b c)
>
>(cons 'a '(b c))
(a b c)
>(cons `(a b) `(b c))
((a b) b c)
>(car '(a (b c)))
a
>(cdr '(a (b c)))
((b c))
>(cdr (car (cdr '(a (b c d) e))))
(c d)

(define (append-list L1  L2)
  (if ( null? L1)
    L2
    (cons (car L1) (append-list (cdr L1) L2))
  )
)
>(append-list '(a b) '(c d e f))
(a b c d e f)

;MEMBER LIST
(define (memebers-list a L)
  (cond ((null? L)  '())
        ((equal? a (car L)) L)
        (#t (memebers-list a (cdr L)))
  )
)
(memebers-list 'c '(a b c d e))
(c d e)
;members of a list same as member function
;LIST LEN
(define (list-len L)
  (if (null? L) 0 (+ 1 (list-len (cdr L)))
  )
)
>(list-len '(a b c d e))
5
;SameNeighbored
(define (sameNeig? L)
  (cond
      ((null? L) #f)
      ((null? (cdr L)) #f)
      ((equal? (car L) (car (cdr L))) #t)
      (else (sameNeig? (cdr L)))
  )
)
>(sameNeig? '(1 2 3 3 5))
#t
;Number only list. 
(define (numOnly? L)
  (cond
      ((not (list? L)) #f)
      ((null? L) #t)
      ((not (number? (car L))) #f)
      (else (numOnly? (cdr L)))
  )
)
>(numOnly? '(1 a 3 3 5))
#f
```
### Stack 
- (empty '()) -> #t
- (push 5 '(2 3 4)) -> (5, 2, 3, 4)
- (top '(2 3 4)) -> (2)
- (pop '(2 3 4)) -> (3, 4)
```Scheme
(define (min-list x)
  (if (null? x)
  x
  (min-list-aux (car x) (cdr x))
  )
)
(define (min-list-aux e l)
  (cond
  ((null? l)e)
  ((> e (cae l))
  (min-list)
  )
  x
  (min-list-aux (car x) (cdr x))
  )
)
```
#### Adding a Prefix to the Elements of a List

• Turn each element of a list into a pair (using cons) attaching the prefix parameter

```scheme
(define (prefix-list p L)
(apply-list (lambda(e) (cons p e)) L))
>(prefix-list 2 '(1 2 3))
((2 . 1)(2 . 2)(2 . 3))
```
#### Loops as Recursions
Loops as Recursions
•Looping N times
```scheme
(define (loop P N)
(cond ((zero? N) '())
(#T (display P) 
(loop P (- N 1)))))

(define (loop2 P inf sup)
(cond ((> inf sup) '())
(#T (display P) 
(loop2 P (+ inf 1) sup))))
;NOTE: These functions have a tail recursion (tail recursion) which is easier to optimize by a compiler
```
#### Map Procedure

•Map applies a function to every element of a list. It can be more convenient than an explicit loop

```Scheme
>(map abs ‘(1 -2 3 -4 5 -6))
(1 2 3 4 5 6 )
;Define a lambda in the same line–  function taking two arguments–  supply two lists
>(map (lambda (x y) (* x y))‘(1 2 3 4) ‘(8 7 6 5))
(8 14 18 20)
```

#### Traversal using a Tail Recursion
* Any recursive function can be in the form of tail recursion using an accumulator (variables) for intermediate results

* Tail recursion is function having to do noting but return the value 

* return results to the recusive call without any change there for the last valu

```scheme
;recursive factorial. 
(define (fact x)
(if (< x 0) 1 (* x fct (- x 1))))
; tail recurison with accumulator 
(define (fact n) (fact2 n 1)
  (define(fact2 n accum)
    (if (< = n 0) accum (fact 2 (-n 1 ) (* n accum)))
  )  
)
```
#### let

> (let ([x 5]) x)
5

> (let ([x 5])
    (let ([x 2]
          [y x])
      (list y x)))
'(5 2)

> (let* ([x 1]
         [y (+ x 1)])
    (list y x))
'(2 1)

sometimes it's useful to think of it the way they expand to understand the internal differences (which maybe you already do, but I'll post this for others as well).

>(let ([a 1] [b 2] [c 3]) body...)

That's equivalent to:

>((lambda (a b c) body...) 1 2 3)
And...

>(let* ([a 1] [b 2] [c 3]) body...)

Would expand to:

>(let ([a 1])
  (let ([b 2])
    (let ([c 3])
      body...)))

And finally...

>(letrec ([a 1] [b 2] [c 3]) body...)

Would be akin to:

>((lambda ()
   (define a nil)
   (define b nil)
   (define c nil)
   (set! a 1)
   (set! b 2)
   (set! c 3)
   body...))

Knowing this, you can now see how each of these have pros and cons with variable shadowing and potentially performance 


#### Types Characters
• Character constants:
#\a #\A #\( #\space #\newline

• Predicats:

>(char? obj) tests whether obj is a character. 
(char-alphabetic? char)
(char-numeric? char)
(char-whitespace? char)
(char-upper-case? char)
(char-lower-case? char)

• Character Comparisons

>(char=? char_1 char_2)
(char<? char_1 char_2)
(char>? char_1 char_2)
(char<=? char_1 char_2)
(char>=? char_1 char_2)

• Corresponding case insensitive functions with the ending
–ci exist.
>(char=? #\a #\A)
=> #f

>(char-ci=? #\a #\A)
=> #t
• Character Conversions
Character to ascii

>(char->integer #\a)
97

>(integer->char (1+ (char->integer #\a)))

#### Strings
• String constants are written in double quotation marks : 
"Hello"

• Boolean comparison functions for strings
>(string=? string_1 string_2)
(string<? string_1 string_2)
(string>? string_1 string_2)
(string<=? string_1 string_2)
(string>=? string_1 string_2)

• Examples

>(string=? "Foo" "foo")
#f
(string-ci=? "Foo" "foo")
#t


More String Functions
>(string-length "Hello")
=> 5

>(string->list "Hello")
=> (#\H #\e #\l #\l #\o)

>(substring "computer" 3 6) [3 4 5]
=> "put" 

### Input/Output

• display – prints to the screen (REPL buffer)
>(display "hello world")
 hello world

• read – function that returns keyboard entries
– Reads a line from the REPL buffer and returns; nothing
printed, e.g.:
>(read) type 234 return
– Combine with display
(display (read)) type "hello world“ return
prints hello world

• newline – for formatted output

### The function set!

• The function set! allows us to assign a value to a variable

>(set! a-num (+ 3 4))

>(set! a-num (+ 1 a-num))

• Note that in Scheme functions which modify their
arguments are given names that end with an exclamation
mark !

### Do
```scheme
(do ((i 0 (+ i 1)))
    ((= i 5) i)      ; maybe return the last value of the iteration
  (display i))
```
### Vectors in Scheme
• Vectors in Scheme are heterogeneous structures that allow
access to the various elements using an index.

– requires less memory than lists
– elements access is constant time

• Basic commands
– create a vector with k elements
>(make-vector
k )

– create with an initial value for the elements

>(make-vector k init
)

– test if an object is a vector

>(vector? obj )

– make a constant vector

>'#( element_0 ... element_k-1 )

>Ex: '#(0 (2 2 2 2) "Anna") 

# Vectors in Scheme

• Vectors in Scheme are heterogeneous structures that allow
access to the various elements using an index.
* requires less memory than lists
*  elements access is constant time
####  Basic commands
* create a vector with k elements
>(make-vector k )
* create with an initial value for the elements
>(make-vector k init)
* test if an object is a vector
>(vector? obj )
* *make a constant vector
> '#( element_0 ... element_k-1 )

• Ex: '#(0 (2 2 2 2) "Anna")

#### Constructors and Accessors
  
*  Top-level define for v
```scheme
(define v (vector 2 (+ 1 2)))
v
#(2 3)
(vector-ref v 0) ; index starts at 0
2
(vector-length v)
2
(vector-set! v 1 10)
=> #(2 10)
;Converting a List into a Vector
;Scheme functions for vector and list conversions
(list->vector '(1 2 3 4))
(vector->list (list->vector '(1 2 3 4)))
```

### Sorting Vectors and Lists

#### Sorting functions available in Scheme
* dialect dependent
* Racket has sort (while MIT Scheme has quick-sort and
merge-sort accepting a list or vector) with an order
predicate (here less-than). sort only accepts lists
* The predicate test must have the general form
  
>(and (test x y) (test y x))

• Examples
```scheme
(sort '(3 4 2 1 2 5) <)
=> (1 2 2 3 4 5)
(sort '(0.5 1.2 1.1) >)
=> (1.2 1.1 .5)
```