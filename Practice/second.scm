#lang racket

; Equality operators
(define hello "bonjour")
(eq? hello hello) 
(eq? "bonjour" "bonjour")

(eqv? 1 1)
(eqv? 2 (+ 1 1))
(eqv? 1 1.0)

(equal? '(a 1 2) '(a 1 2))
(equal? "bonjour" "bonjour")
(equal? (list 1 2) '(1 2))
(equal? 'a 'a)
(equal? 2 2)

; Sequence
(begin (display 'okay) (display '(great)))

; Lists
(cons `a `(b c))
(cons `(a b) `(b c))
(cons 'a 'b)

(car '(a b c))
(car '((a b) b c))

(cdr '(a b c))
(cdr '((a b) b c))
(cdr '(a (b c)))

(cdr (car (cdr '(a (b c d) e))))
(cdadr '(a (b c d) e))
(cons (car '(a b c)) (cdr '(a b c)))


(define (append-list L1 L2)
  (if (null? L1)
      L2
      (cons (car L1) (append-list (cdr L1) L2))))

(append-list '(a b) '(c d))

(define (invert-list L)
  (if (null? L)
      '()
      (append-list (invert-list (cdr L)) 
		   (list (car L)))))

(invert-list '(a b c d))


(define (member-list a L)
  (cond ((null? L) '())
	((equal? a (car L)) L)
	(#T (member-list a (cdr L)))))

(member-list 'a '(a b c))
(member-list 'b '(a b c))
(member-list 'd '(a b c))

(define (length-list L)
  (if (null? L)
      0
      (+ 1 (length-list (cdr L)))))

(length-list '(a b c))

(define (same-neighbours? L)
  (cond
   ((null? L) #f)
   ((null? (cdr L)) #f)
   ((equal? (car L)(cadr L)) #t)
   (else
    (same-neighbours? (cdr L)))))

(same-neighbours? '(1 2 3 3 5))


(define (number-list? x )
  (cond
   ((not ( list? x )) #f)
   ((null? x ) #t)
   ((not (number? (car x))) #f)
   (else (number-list? (cdr x )))))

(number-list? '(1 2 3 4))
(number-list? '(1 2 3 bad 4))


(define (eqExpr? x y)
  (cond
   ((symbol? x)  (eq? x y))
   ((number? x)  (eq? x y))
   ; x is a list:
   ((null? x)  (null? y))
   ; x is a non-empty list 
   ((null? y) #f)
   ; car and cdr have to be the same
   ((eqExpr? (car x) (car y))
    (eqExpr? (cdr x) (cdr y)))
   (else  #f)))

(eqExpr? '(1 2 3 4) '(1 2 '(3 4)))
(eqExpr? '(1 2 3 4) '(1 2 3 4))

(eqv? '(1 2 3 4) '(1 2 3 4))
(equal? '(1 2 3 4) '(1 2 3 4))


(define (repeated-elements L)
  (if (list? L)
      (do-repeated-elements L)
      'list-error))

(define (do-repeated-elements L)
  (cond
   ((null? L) '())
   ((member (car L) (cdr L))
    (do-repeated-elements (cdr L)))
   (else (cons (car L)
	       (do-repeated-elements (cdr L))))
   ))

(repeated-elements '(1 2 3 2 2))


(define (empty? stack)
   (null? stack))

(define (push e stack)
   (cons e stack))

(define (pop stack)
  (if (empty? stack)
      '()
      (cdr stack)))

(define (top stack)
  (if (empty? stack)
      '()
      (car stack)))

(empty? '())
(push 5 '(2 3 4))
(top '(2 3 4))
(pop '(2 3 4))


(define (min-list x)
  (if (null? x)
      x
      (min-list-aux (car x)(cdr x))))

(define (min-list-aux e l)
  (cond
   ((null? l) e)
   ((> e (car l))
    (min-list-aux (car l)(cdr l)))
   (else (min-list-aux e (cdr l)))))

(min-list '(4 8 9 2 8))

(define (min-list-aux-2 e l)
  (if (null? l) e
      ; else
      (let ((v1 (car l))
	    (v2 (cdr l)))
	(if
	 (> e v1)
	 (min-list-aux-2 v1 v2)
	 (min-list-aux-2 e v2)
	 ))
      ))

(define (quadruple x)
  (let ((double (lambda (x) (+ x x))))
    (double (double x))
))

(quadruple 8)
; (double 8)

(define (apply-list fct L)
   (if (null? L)
   '()
   (cons (fct (car L)) (apply-list fct (cdr L)))))

(apply-list (lambda(x) (+ x 4)) '(1 2 3 4))

(define (prefix-list p L)
   (apply-list 
      (lambda(e) (cons p e)) L))


(prefix-list 2 '(1 2 3))


(define (combine dim set)
  (cond
   ((= dim 0) '(()))
   ((null? set) '())
   (else
    (append (prefix-list (car set) (combine (- dim 1) (cdr set)))
	    (combine dim (cdr set))))
   ))

(combine 2 '(1 2 3))
(combine 3 '(1 2 3 4 5))


(define (reduce F F0 L)
  (if (null? L)
      F0
      (F (car L)
         (reduce F F0 (cdr L)))
))

(reduce * 1 '(1 2 3 4))


(define (loop P N)
  (cond ((zero? N) '())
  (#T (display P) (loop P (- N 1)))))

(loop 3 5)


(define (loop2 P inf sup)
  (cond ((> inf sup) '())
  (#T (display P) (loop2 P (+ inf 1) sup))))

(loop2 3 1 100)


(define (apply-list2 L Lacc)
  (if (null? L)
      Lacc
      (apply-list2 (cdr L)
		   (append Lacc (list (abs (car L)))))))

(define (apply-list-b L)
  (apply-list2 L '()))

(apply-list-b '(-3 -2.1 2 3.4))


(define (factorial n) 
  (if (<= n 0) 
      1  
      (* n (factorial (- n 1))))) 

(factorial 5)

(define (factorial-b n) (factorialb n 1)) 
(define (factorialb n answer) 
  (if (<= n 0) 
      answer 
      (factorialb (- n 1) (* n answer)))) 


(map abs '(1 -2 3 -4 5 -6))

(map (lambda (x y) (* x y))
	'(1 2 3 4) '(8 7 6 5))










