#lang scheme
(printf "------Assignment 3------\n")
(printf "------Q 1------\n")
;First Method
(define (1over x) (map (lambda (x) (if (equal? x 0) 0 (/ 1 x))) x))
(1over '(0 2 3 4 12 0 0 1 0))

;Second Method just defining 1over and then mapping it.
;(define (over x) (if (equal? x 0) 0 (/ 1 x)))
;(define (1over x) (map over x))
;(1over '(0 2 3 4 12 0 0 1 0))

(printf "------Q 2------\n")
(define TOL 1e-6)
(define (newtonRhap x f fx)
  (let ((xn1 (- x (/ ( f x) (fx x)))))
    (if (< (abs (- x xn1)) TOL) xn1 (newtonRhap xn1 f fx ))))
(printf "-------newtonRhap 0.1--------\n")
(newtonRhap 0.1 sin cos)
(printf "-------newtonRhap 2.0--------\n")
(newtonRhap 2.0 (lambda (x) (- (* x x) x 6)) (lambda (x) (- (* 2 x) 1)))
(printf "-------newtonRhap -20.0--------\n")
(newtonRhap -20.0 (lambda (x) (- (* x x) x 6)) (lambda (x) (- (* 2 x) 1)))
#|
(printf "------Q 3------\n")
(define (p_cos x)
  (for/product ([n (in-range 1 100)])
    (p_cos_aux x n)))
(define (p_cos_aux x n)
  (- 1 (/ (* 4 (square x)) (* (square pi) (square (- (* 2 n) 1))))))
|#
(printf "------Q 4------\n")
(define (separator? x)
  (cond
    ((eqv? x #\space) #t)
    ((eqv? x #\tab)#t)
    ((eqv? x #\newline)#t)
    (else #f)
  )
)
(printf "--separator space--\n")
(separator? #\space)
(printf "--separator b--\n")
(separator? #\b)

(define (cpy x)
  (cond
    ((null?  x) '())
    ((separator? (car x))'())
    (else (cons(car x) (cpy (cdr x))))
  )
)
(printf "--cpy hello world --\n")
(cpy '(#\H #\e #\l #\l #\o #\space #\W #\o #\r #\l #\d))

(define (drop x)
  (cond
    ((null?  x) '())
    ((separator? (car x)) (cons (car (cdr x)) (cpy (cdr (cdr x)))))
    (else (drop (cdr x)))
  )
)
(printf "-- drop world --\n")
(drop '(#\H #\e #\l #\l #\o #\space #\W #\o #\r #\l #\d))
(define (same? x1 x2)
  (cond
    ((separator? (car x1)) #t)
    ((eqv? (car x1) (car x2)) (same? (cdr x1)(cdr x2)))
    (else #f)
  ))
(printf "--same hello world (hello) --\n")
(same? '(#\H #\e #\l #\l #\o #\tab #\W #\o #\r #\l #\d)
'(#\H #\e #\l #\l #\o))
(printf "--same hello world (world) --\n")
(same? '(#\H #\e #\l #\l #\o #\space #\W #\o #\r #\l #\d)
'(#\W #\o #\r #\l #\d))
;sl -> starting list, tm -> term to replace, rptm -> replace term with
(define (replace sl tm rptm)
  (cond
    ((null?  sl) '())
    ((and (eqv? (car tm) (car sl))  
      (separator? (car (cdr sl)))) 
        (flatten (cons ( cons (car rptm) (cdr rptm) ) 
          (replace (cdr sl) tm rptm) )) )
    (else (cons ( car sl) (replace (cdr sl) tm rptm) ))
  )
)
(printf "--Replace a to The --\n")
(replace '(#\a #\space #\b #\i #\r #\d #\space #\e #\a #\t #\s #\space #\a #\space #\t #\o #\m #\a #\t #\o) '(#\a) '(#\t #\h #\e))



