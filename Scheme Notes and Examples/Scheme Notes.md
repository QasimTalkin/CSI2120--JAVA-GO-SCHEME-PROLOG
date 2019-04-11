# Scheme Notes

### Scheme Overview (1960)

#### Facts 
* Derived form lambda calculus (function as values)
* Lisp, Scheme, Common Lisp
  
#### Key Points 
* Conditions (if else)
* Function as data types
* Recursion 
* Variable as pointers 
* Auto garbage collection
* Program is an expressions n not serries of statements 
* Symbols or atoms
* read eval print! 

Functional programing : function is composition of functions, depends only on parameters passed only recursion and if then elses. 

Applications : AI, Automated Reasons, Games, Symbolic Computations. 

#### Key Concepts 

* list an imp data structure
* Atom : number, string, symbols 
* Expression : Atom or list
* list : series of expression in parenthesis (empty list ( ) )
* Function : can be created, assigned as variable, passed as parameter and returned as a value.

#### Simple Examples 

```Scheme 
;READ-EVAL-PRINT programming model (REPL)

#lang racket
;2 => 2
;"Hello" => "Hello"
;Scheme uses prefix expressions with brackets give importance 
>(+ 3 4)
7
>(+3 (* 4 5))
;goes down to (+ 3 20) first 
23
```
List evaluation : First the head, and then the rest of the tail
  * Special Syntactic Forms : Do not obey normal evaluation rule. evaluation is differed until required values are known.
    * if 
      * condition branching
    * creating local scope
    * quotation
##### Basic If Statement. 
```Scheme 
(if (= x 0) infini (/ 1 x))
;if evaluated first if is true then second argument else the third. 
```
##### Basic Conditional Branching 
if any one them evaluates to true (#t) then last expression is returned else nil is returned. 
```Scheme
(cond ((< x xmin) xmin) ((> x xmax) xmax) (#t x))
(define (showIt pts)
    (cond ((or (<= pts 3) (>= pts 65) ) 0) 
            ((<= 4 pts 6) 0.5)  
            ((<= 10 pts 12) 1)
            (else 2.0))`
)
>(showIt 25)
2
```
##### Creating Lexical Scope
first argument of le to is list of links created between values and variable 
These links are only valid for the evaluation of the following expression 

•  There can be several to allow the execution of a sequence.

•  However, it evaluates to the last expression.
```Scheme
>(let ((a 3) (b 4))(* a b))
12
>(let ((a 3) (b 4)) (* a b) (+ a b))
7
```

##### Quotations
Ensures that argument list is **not evaluated** 
```Scheme
>(quote (+ 2 3))
(+ 2 3)
>'(+ 2 3)
(+ 2 3)
```
**cons** dot operator that pusts first expression as head and next one as tail. 
```Scheme
>(let ((a '(1 2 3)) (b '(4 5 6))) (cons a  b) )
((1 2 3) 3 4 5)
```
#### List building 
```Scheme 
>(list 'a 'b' 'c 'd)
(a b c d)
>(list '(a b c))
((a b c))
```

#### Lambdas

* Lambda expression are 'local functions'
* the expression (lambda(var1, var2, ....) exp1 exp2 .. )  returns after applying the variables as parameter to the function expression. 

```Scheme
>((lambda (x) (* x x)) 3)
9
>((lambda (f x y) (f x x) (f x y) (f y y)) + 2 3)
6
```
Multiple variables and multiple expression (result of last expression is the evaluation result)

#### Function definition 
Two ways to define function!
  1. (define square (lambda (x) (* x x)))
  2. (define squre(x)(* x x))
```Scheme 
>(square 2)
4
```
### Some Simple Examples! 

#### Factorial 
```Scheme
(define (fact n)
  ( if (> n 0)
    (* n (fact (- n 1)) 1
  )
)
> (fact 35)
10333147966386144929666651337523200000000
```
#### Ferrite to Celsius
```Scheme
(define (f-2-c temp)
  (/ (- temp 32) 1.8)
)
>(f-2-c 32)
0
```
#### Functions with lambdas 
```Scheme
(define func (lambda (f x) (f x x)))
>(func + 12)
24
>(func * 2)
4
```
#### Functions with lambdas and let binding!
```Scheme
>(let ((x 'a))
  (let ((f (lambda (y) (list x y)))
  (f 'b)  
  )
)
(a b)

> (let ((x 2) (x 3)) (+ x y))
5
;same as 
>((lambda (x y) (+ x y)) 2 3)
5
```
basically
**((let (var val) ...) expr...)≡((lambda (var ...) expr...) val...)**

#### GCD 
```Scheme
( define gcd 
    (lambda (a b) 
        (if (= a b) a
            (if (> a b) 
                (gcd (- a b) b) 
                (gcd a (- b a))
            )
        )
    )
)
>(gcd 12 15)
3
```