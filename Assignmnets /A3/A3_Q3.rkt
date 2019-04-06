#lang scheme
(printf "------Q 3------\n")
(define (p_cos x)
  (for/product ([n (in-range 1 100)])
    (p_cos_aux x n)))
(define (p_cos_aux x n)
  (- 1 (/ (* 4 (square x)) (* (square pi) (square (- (* 2 n) 1))))))
