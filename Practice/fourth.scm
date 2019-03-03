#lang racket

(display "Hello World")
(newline)

;(display (begin (display "Enter: ") (read)))
;(newline)

(define (ask-number)
  (display "Enter a number: ")
  (let ((n (read)))
    (if (number? n)
	n	
	(ask-number))))

;(ask-number)

(define (find-sqrt)
  (let ((n (ask-number)))
    (display "The sqrt of ")
    (display n)
    (display " is ")
    (display (sqrt n))
    (newline)))

; (find-sqrt)


; File io check your working directory and set it
; This will work under MIT Scheme, not Racket
;(pwd)
;(cd "c:\\teaching\\csi2120\\demoCode\\scheme")
;(cd "c:/teaching/csi2120/demoCode/scheme") ; will convert correspondingly

; Below is (a small part of) racket's OS interface
(current-directory) ; current setting for relative path names
(current-directory-for-user) ; path where the current process was started

(current-directory "c:/teaching/csi2120/demoCode/scheme") ; will convert correspondingly



(let ((p (open-input-file "short.in")))
  (let f ((x (read p)))
    (if (eof-object? x)
	(begin
	  (close-input-port p)
	  '())
	(cons x (f (read p))))))


(define proc-in-file 
  (lambda (filename proc)
    (let ((p (open-input-file filename)))
      (let ((v (proc p)))
	(close-input-port p)
	v))))


(proc-in-file "short.in"
  (lambda (p)
    (let f ((x (read p)))
      (if (eof-object? x)
	  '()
	  (cons x (f (read p)))))))



(define proc-out-file
  (lambda (filename proc)
    ; Optional arguments are a racket extension 
    (let ((p (open-output-file filename #:exists 'replace)))
      (let ((v (proc p)))
	(close-output-port p)
	v))))


(proc-out-file "newList.out"	       
  (lambda (p)
    (let ((list-to-be-printed '(1 2 3 4))) 
    (let f ((l list-to-be-printed))
      (if (not (null? l))
          (begin
            (write (car l) p)
            (newline p)
            (f (cdr l)))
          null)))))


(define light-switch (let ((lit #f)) (lambda () 
	(set! lit (not lit)) 
	(if lit 'on 'off)))) 

;(light-switch)

;(display lit)


(define a-stack '())

(define (empty?)
  (null? a-stack))

(define (push e)
  (begin 
    (set! a-stack (cons e a-stack))
    a-stack
    ))
  
(define (pop)
  (if (empty?)
      '()
      (begin 
	(set! a-stack (cdr a-stack))
	a-stack)))

(define (top)
  (if (empty?)
      '()
      (car a-stack)))


; (empty?)
; (push 5)
; (top)
; (pop)

; (display a-stack)
; (set! a-stack ())


; 0 1 1 2 3 5 8 13 21 34 ...
; F_n = F_n-1 + F_n-2 with F_0 = 0 and F_1 = 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define fibonacci
  (lambda (n)
    (if (= n 0)
        0
        (do ((i n (- i 1)) (a1 1 (+ a1 a2)) (a2 0 a1))
            ((= i 1) a1))))) 

; (fibonacci 3)

; vectors
;;;;;;;;;;;;;;;;;;;;;;

; (vector 'a 'b 'c)
(define v (vector 1 (+ 1 2)))
; v

;(vector-ref v 0)
;(vector-length v)

(vector-set! v 1 10)
; v

(let ((v (vector 'a 'b 'c 'd 'e)))
  (vector-set! v 2 'x) v)  


(define vector-fill!
  (lambda (v x)
    (let ((n (vector-length v)))
      (do ((i 0 (+ i 1)))
	  ((= i n))
	(vector-set! v i x))))) 

(let ((v (vector 1 2 3)))
  (vector-fill! v 0) v) 


; list processing library conversions
(list->vector '(1 2 3 4))

(vector->list (list->vector '(1 2 3 4)))

(define vec->li
  (lambda (s)
    (do ((i (- (vector-length s) 1) (- i 1))
        (ls '() (cons (vector-ref s i) ls)))
        ((< i 0) ls))))

(vec->li '#(a b c))  


; apply function call for reduction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((v '#(1 2 3 4 5)))
  (apply * (vec->li v)))  


(let ((v '#(1 2 3 4 5)))
  (let ((ls (vector->list v)))
    (list->vector (map * ls ls))))


(define vector-sum 
  (lambda (vec) 
    (let ((size (vector-length vec))
	  (position 0) (total 0)) 
      (do () ((= position size) total) 
	(set! total (+ total (vector-ref vec position))) 
	(set! position (+ position 1))))))

(define vector-sum-b 
  (lambda (vec) 
    (let ((size (vector-length vec)))
      (do ((position 0) (total 0)) ((= position size) total) 
	(set! total (+ total (vector-ref vec position))) 
	(set! position (+ position 1))))))

(define vector-sum-c 
  (lambda (vec) 
    (let ((size (vector-length vec)))
      (do ((position 0 (+ position 1)) 
	   (total 0 (+ total (vector-ref vec position)))) 
	  ((= position size) total))))) 


(define vector-sum-d 
  (lambda (vec) 
    (do ((remaining (vector-length vec) (- remaining 1)) 
	 (total 0 (+ total (vector-ref vec (- remaining 1))))) 
	((zero? remaining) total)))) 

; (vector-sum #( 2 5 7 3 4))
; (vector-sum-b #( 2 5 7 3 4))
; (vector-sum-c #( 2 5 7 3 4))
; (vector-sum-d #( 2 5 7 3 4))


; Test of sorting predicate
; (and (< x y) (< y x)) must be false!
(and (< 1 2) (< 2 1))

; extract elements start to stop into a list 
(define (sub L start stop ctr) 
  (cond ((null? L) L) 
	((< ctr start) (sub (cdr L) start stop (+ ctr 1))) 
	((> ctr stop) '()) 
	(else (cons (car L) (sub (cdr L) start stop (+ ctr 1)))))) 


(sub '(a b c d e f g h) 3 4 1)

; split the list in half: 
; returns ((first half)(second half)) 

(define (split L) 
  (let ((len (length L))) 
    (cond ((= len 0) (list L L) ) 
	  ((= len 1) (list L '() )) 
	  (else (list (sub L 1 (quotient len 2) 1)
		      (sub L (+ (quotient len 2) 1) len 1))))))

; (split '(a b c d e f g))


; assume L and M are sorted lists 

(define (mergelists L M) 
  (cond ((null? L) M) 
	((null? M) L) 
	((< (car L)(car M)) (cons (car L) (mergelists (cdr L)M))) 
	(else (cons (car M) (mergelists L (cdr M))))))

; (mergelists '(1 5 10) '(2 6 7))


(define (mergesort L) 
  (cond ((null? L) '()) 
	((= 1 (length L)) L) 
	((= 2 (length L)) (mergelists (list (car L))(cdr L))) 
	(else (mergelists (mergesort (car (split L)) ) 
			  (mergesort (car (cdr (split L))))))))


; (mergesort  '(3 4 2 1 8 6 10))


(define (qsort L)
  (if (or (null? L) (<= (length L) 1)) 
      L   ; no need to sort
      (let loop ((left '()) (right '()) (pivot (car L)) (rest (cdr L)))
	(if (null? rest)
	    (append (qsort left) (list pivot) (qsort right))
	    (if (<= (car rest) pivot)
		(loop (append left (list (car rest))) right pivot (cdr rest))
		(loop left (append right (list (car rest))) pivot (cdr rest)))))))


; (qsort  '(7 4 2 1 8 6 10))

; Built-in sorts MIT Scheme
;(quick-sort  '#(3 4 2 1 2 5) <)
;(merge-sort '(0.5 1.2 1.1) >) 

; Racket has sort which is stable
; needs a list
(sort '(3 4 2 1 2 5) <)





