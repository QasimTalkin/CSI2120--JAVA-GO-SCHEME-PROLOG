#lang racket

; Use map to replace every number by their reciprocal value. Use 0 for 1/0
; (1over '(0 2 3 4 12 0 0 1 0))
; => '(0 1/2 1/3 1/4 1/12 0 0 1 0))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (1over L)
  (map (lambda (x)
         (if (eqv? x 0)
             0
             (/ 1 x)))
       L)
)

; Example
(1over '(0 2 3 4 12 0 0 1 0))


(define TOL 1e-6)

; Newton-Rhapson's method in 1D							;
; x_{n+1} = x_n - f(x_n)/f'(x_n)
; (newtonRhap x f fx)
; Examples:
; (newtonRhap 0.1 sin cos)
; => 0
; Examples:
; (newtonRhap 2.0 (lambda (x) (- (* x x) x 6)) (lambda (x) (- (* 2 x) 1)))
; => 3.0
; (newtonRhap -20.0 (lambda (x) (- (* x x) x 6)) (lambda (x) (- (* 2 x) 1)))
; => -2.000000000000118
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (newtonRhap x f fx)
  (let ((y (- x (/ (f x) (fx x)))))
    (if (< (abs (- y x)) TOL)
        y
        (newtonRhap y f fx))))

; Examples
(newtonRhap 0.1 sin cos)
(newtonRhap 2.0 (lambda (x) (- (* x x) x 6)) (lambda (x) (- (* 2 x) 1)))
(newtonRhap -20.0 (lambda (x) (- (* x x) x 6)) (lambda (x) (- (* 2 x) 1)))



; Product approximation of cosine
; cosx=product_(n=1)^infty[1-(4x^2)/(pi^2(2n-1)^2)].
; Use as many terms until the next term is less than TOL
; (define TOL 1e-6)
; (p_cos 0)
; => 1
; (p_cos (/ pi 2))
; => 0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (p_cos x)
  (let ((pTerm (lambda (n) (- 1 (/ (* 4 x x) (let ((d (* pi (- (* 2 n) 1)))) (* d d)))))))
        (letrec ((mult_terms (lambda (cnt res)
                            (if (< (- res (* res (pTerm cnt))) TOL)
                                res
                                (mult_terms (+ cnt 1) (* res (pTerm cnt)))))))
          (mult_terms 1 1))
    )
  )

; Examples
(p_cos 0)
(p_cos (/ pi 2))


; Word replacement in a list of characters
; You are not allowed to use any of the built-in string processing function. Your replacement will be case-sensitive.
; Note that characters can be compared with char=?
; (list->string (replace (string->list "a bird eats a tomato") (string->list "a") (string->list "the")))
; => "the bird eats the tomato"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (replace LC LO LI)
  (if
   (or (eqv? LC '()) (eqv? LO '()))
   LC			
   ; helper predicate to test for separators
   (let ((separator? (lambda (chr) 
                       (if (or (char=? chr #\space)
                               (char=? chr #\tab)
                               (char=? chr #\newline))
                           #t
                           #f))))
		; helper predicate to copy rest until separator
     (letrec ((cpy (lambda (L) (if (or (eqv? L '()) (separator? (car L)))
                                   '()
                                   (cons (car L) (cpy (cdr L)))))))
       (letrec ((drop (lambda (L) (cond
                                    ((eqv? L '()) '())
                                    ((separator? (car L)) (cdr L))
                                    (else (drop (cdr L)))))))
         (letrec ((same? (lambda (L LO)
                           (cond
                             ((or (eqv? L '()) (eqv? LO '())) #t)
                             ((eqv? L '()) #f)
                             ((eqv? LO '()) #f)
                             ((char=? (car L) (car LO))
                              (same? (cdr L) (cdr LO)))
                             (else #f)))))
           (if (same? LC LO)
               (append LI (cons #\space '()) (replace (drop LC) LO LI))
               (let ((res (replace (drop LC) LO LI)))
                 (if (eqv? res '())
                     (cpy LC)
                     (append (cpy LC) (cons #\space '()) res))))
           ))))))

; Example
(list->string (replace (string->list "a bird eats a tomato") (string->list "a") (string->list "the")))


; Global helper functions to make it easier
(define (separator? chr) 
  (if (or (char=? chr #\space)
          (char=? chr #\tab)
          (char=? chr #\newline))
      #t
      #f))

(define (cpy L)
  (if (or (eqv? L '()) (separator? (car L)))
      '()
      (cons (car L) (cpy (cdr L)))))

(define (drop L) (cond
                   ((eqv? L '()) '())
                   ((separator? (car L)) (cdr L))
                   (else (drop (cdr L)))))

(define (same? L LO)
  (cond
    ((or (eqv? L '()) (eqv? LO '())) #t)
    ((eqv? L '()) #f)
    ((eqv? LO '()) #f)
    ((char=? (car L) (car LO))
     (same? (cdr L) (cdr LO)))
    (else #f)))