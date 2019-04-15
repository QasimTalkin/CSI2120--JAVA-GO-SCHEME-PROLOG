#lang racket

;; Exercise 1

(+ (* 1 1) (* 2 2) (* 3 3) (* 4 4))

;; or 

(let ((f (lambda (x) (* x x)))) (+ (f 1) (f 2) (f 3) (f 4)))

;; ---------------------------------------------
(/ (+ -5 (sqrt (- (* 5 5) (* -4 2 -3)))) (* 2 2))
(/ (+ -5 (sqrt (+ (* 5 5) (* -4 2 -3)))) (* 2 2))

;; or

(let ((a 2) (b 5) (c -3)) (let ((d (sqrt (- (* b b) (* -4 a c)))))  
	(list (/ (+ (- 0 b) d) (* 2 a))
              (/ (- (- 0 b) d) (* 2 a)))))

;; ---------------------------------------------


(+ (* (sin (/ pi 4)) (cos (/ pi 3))) (* (cos (/ pi 4)) (sin (/ pi 3))))


;; Exercise 2
(define myFavorite 42)

(let ((x 1) (y 2)) (+ x y))

(let ((alpha (/ pi 4)) (beta (/ pi 3))) (+ (* (sin alpha) (cos beta)) (* (cos alpha) (sin beta))))


;; Exercise 3
((lambda (x y) (+ x y)) 1 2)

(lambda (alpha beta) (+ (* (sin alpha) (cos beta)) (* (cos alpha) (sin beta)))(/ pi 4) (/ pi 3) )


(define foo (lambda (x y) (+ x y)))

(define f (lambda (alpha beta) (+ (* (sin alpha) (cos beta)) (* (cos alpha) (sin beta)))))
(f (/ pi 4) (/ pi 3))

;; Exercise 4
(define q (lambda (a b c) (let ((d (sqrt (- (* b b) (* -4 a c)))))  
	(list (/ (+ (- b) d) (* 2 a))
              (/ (- (- b) d) (* 2 a))))))
	
(q 2 5 -3)
