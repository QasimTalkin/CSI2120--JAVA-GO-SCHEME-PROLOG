#lang racket

(let ((a 2) (b 3)) ; local variables a and b
  (+ a b))      ; expression where the variables are bound

; a
; b

(define (f x y) 
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    (+ (* x a a) (* y b) (* a b))))

(f 1 2)

(let ((a 3)
      (b 4)
      (square (lambda (x) (* x x)))
      (plus +)) ; end of definitions
  ; applied to
  (sqrt (plus (square a) (square b))))	

(define x 'a)
(define y 'b)
(list x y)		

(let ((x y) (y x)) (list x y)) 

(let* ((x 1) (y (+ x 1)))
  (list x y))

(let ((x 2) (y 3)) 
  (let ((x 7) 
	(z (+ x y))) 
    (* z x)))

(let ((x 2) (y 3)) 
  (let* ((x 7) 
	 (z (+ x y))) 
    (* z x)))


(define seconds-set
  (lambda (h m s)
    (let ((sh 0) (sm 0) (total 0))
      (set! sh (* 60 (* 60 h)))
      (set! sm (* 60 m))
      (set! total (+ s (+ sh sm)))
      total)))

(seconds-set 1 5 3)


(define seconds
  (lambda (h m s)
    (let ((sh (* 60 (* 60 h)))
	  (sm (* 60 m)))
	  (+ s (+ sh sm)))))

(seconds 1 5 3)


(letrec ((fact (lambda (n)
		 (if (= n 1)
		     1
		     (* n (fact (- n 1)))))))
  (fact 5))


(define double-ele (lambda(x) (+ x x))) 
(define (apply-f fct L)
(letrec ((app
	  (lambda (L)  
	    (if (null? L)
		'()
		(cons (fct (car L)) (app (cdr L)))))))
  (app L))
)

(apply-f double-ele '(1 2 3 4))



(let ft ((k 5)) 
  (if (<= k 0)
      1
      (* k (ft (- k 1)))))


; (letrec ((name (lambda (var ...) exp1 exp2 ...)) (name val) ...)

(letrec ((ft (lambda (k)   
	       (if (<= k 0)
		   1
		   (* k (ft (- k 1))))))) (ft 5))



(define divisors
  (lambda(n)
    (let f ((i 2))
      (cond
       ((>= i n) '())
       ((integer? (/ n i))
	(cons i (f (+ i 1)))) ; call body with i=i+1
       (else (f (+ i 1))))))); call body with i=i+1


(divisors 63)


(let loop ((numbers '(3 -2 1 6 -5)) 
	   (nonneg '()) 
	   (neg '())) 
  (cond ((null? numbers) (list nonneg neg)) 
	((>= (car numbers) 0) 
	 (loop (cdr numbers) 
	       (cons (car numbers) nonneg) 
	       neg)) 
	((< (car numbers) 0) 
	 (loop (cdr numbers) 
	       nonneg 
	       (cons (car numbers) neg))))) 

		      

(define num-calls 0)

(define kons
   (lambda (x y)
      (set! num-calls (+ num-calls 1))
      (cons x y)))
 
(kons 3 5)

(display num-calls)
(* 1 num-calls)

(char=? #\a #\A) 
(char-ci=? #\a #\A) 

(char->integer #\a) 
(integer->char (+ 1 (char->integer #\a))) 

(string=? "Foo" "foo") 
(string-ci=? "Foo" "foo")

(string-length "Hello") 
(string->list "Hello") 
(substring "computer" 3 6)

(define (abc-count char k) 
  (if (char-alphabetic? char) 
      (let ((base (if (char-upper-case? char)  
		      (char->integer #\A) 
		      (char->integer #\a))))
	(integer->char 
	 (+ base 
	    (modulo 
	     (+ k 
		(- (char->integer char) base)) 
	     26)))) 
      char)) ; apply let to char
 
(abc-count #\b 5)

 
