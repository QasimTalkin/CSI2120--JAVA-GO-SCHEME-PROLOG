#lang racket

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Q1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cons 3 (cons 4 '()))

(cons 1 (cons 2 (cons 3 '())))

(cons 'a (cons (cons 'b (cons 'c '()))'()))

(cons 1 '())

(cons 2 (cons (cons 3 (cons (cons 4 '()) '())) '()))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Q2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define L '(1 2 3 4 5))

; 1
(car L)

; 2
(car (cdr L))

; 3
(car (cdr (cdr L)))

; 4
(car (cdr (cdr (cdr L))))

; 5
(car (cdr (cdr (cdr (cdr L)))))


;;;;;;;
(define LL '(1 (2 3 4) (5)))

(car (car (cdr LL)))

(car (car (cdr (cdr LL))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Q3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (range s e)
  (if (> s e)
      '()
      (cons s (range (+ s 1) e))))

(range 4 9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Q4 and Quiz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define Q '(1 2 (a 3 4 5)))

(caaddr Q)


