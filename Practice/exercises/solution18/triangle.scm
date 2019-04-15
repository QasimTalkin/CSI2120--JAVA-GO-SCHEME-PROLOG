#lang racket


(define (areaT A B C)
  (abs (* 0.5
					(+
					 (- (* (car A) (cdr B)) (* (cdr A) (car B))) A
					 (* -1
							(- (* (car A) (cdr C)) (* (cdr A) (car C))))
					 (- (* (car B) (cdr C)) (* (cdr B) (car C)))))))



(areaT (cons -2 2) (cons 1 5) (cons 6 -1))
