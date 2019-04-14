#lang racket


; question 3 What is the output of the following calls?
; a
((lambda (x y) (+ x y)) 1 2)
; => 3

; b
(let ((x 1) (y 2)) (+ x y))
; => 3

; c
((lambda (x y) (+ x y) (- x y)) 2 1)
; => 1


; d
(let* ((x 1) (y (+ x 1))) (- y x))
; => 1

; e
(let ((f (lambda (x y) (- (+ x y) 1))) (x 1) (z 2)) (f 3 z))
; => 4
