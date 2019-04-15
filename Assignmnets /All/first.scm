#lang racket

(+ 3 4) ; simple expression

(+ 3 (* 4 5 )) ; compound expression


(let ((x 0.2))
  (cond ((< x 0) 'xmin) ((> x 1) 'xmax) (#t x))) ; last expression is true

(let ((x 3))
  (let ((xmin 1))
    (let ((xmax 2))
      (cond ((< x xmin) xmin) ((> x xmax) xmax) (#t x))))) ; lots of let bound variables
      

; top-level define for showIt
(define (showIt pts)
  (cond ((or (<= pts 3) (>= pts 65)) 0)
	((<= 4 pts 6) 0.5)
	((<= 7 pts 12) 1.0)
	((<= 13 pts 15) 1.5)
	((<= 16 pts 18) 1.8)
	(else 2.0)))
(showIt 25)


(let ((a 3) (b 4)) (* a b))

(quote (1 2 3))

(write 'pi)

; the following two expression have the same value
(let ((a '(1 2 3))(b '(3 4 5)))(cons a b))
(cons '(1 2 3) '(3 4 5))

; more quotations
(list 'a 'b 'c) ; a b c added to a list 
(list '(a b c)) ; list ( a b c ) added to a list

; top-level define for square 
(define (square x) (* x x)) 
(square 2)

; lambda function applied to 3
((lambda (x) (* x x)) 3)

; top-level define for fact 
(define (fact n) 
  ( if (> n 0) 
       ( * n (fact (- n 1)))  
       1
       )
  )

(fact 35)

; top-level define for F-a-C
(define (F-a-C temperature) 
      (/ (- temperature 32) 1.8))

(F-a-C 95)

; top-level define for freezing
(define freezing 32)

(F-a-C freezing)

; top-level define combined with a lambda
(define fct (lambda (f x) (f x x)))

(fct + 13)
(fct * 4)

; let bound varibles combined with a lambda
(let ((x 'a))
  (let ((f (lambda (y) (list x y))))
    (f 'b)))

; top level define for gcd function
(define gcd
  (lambda (a b)  
    (if (= a b) 
	a  
	(if (> a b) 
	    (gcd (- a b) b)
	    (gcd a (- b a))))))

(gcd 12 15)



