#lang racket


; question 4 Complete the following function calls with a single function.
; a
(define L '( w x y z ))
(cadr L)
; => 'x

; b
(define LL '((w x)(y z))) 
(cdar LL)
; => '(x) 

; c
(define LLL '((w (x (y z))) a))
(cadar LLL)  
; => x
