#lang racket

; question 6 Below a binary search tree is drawn. Give its scheme representationn as discussed in class. The tree? predicate is shown as a reminder.


; Hint:
(define tree?
  (lambda (t)
    (cond
      ((not (list? t)) #f)
      ((null? t) #t)
      ((not (= (length t) 3)) #f)
      ((not (tree? (cadr t))) #f)
      ((not (tree? (caddr t))) #f)
      (else #t)
)))


; a
(define T '(12 (7 (6 () ()) ()) (21 (13 () ()) (25 (23 () ()) ()))))
; 

; b Complete the implementation of a funtion which sums the numbers, from the root to a given node including the node.
; solution
; (sumPath 13 T)
; => 46 ; 12 + 21 + 13
; (sumPath 7 T)
; => 19 ; 12 + 7 


; Hint:
(define search-BST
  (lambda (x t)
    (define search
      (lambda (x t)
        (cond
         ((null? t) #f)
         ((equal? x (car t)) #t)
         ((precedes? x (car t)) (search x (cadr t)))
         ((precedes? (car t) x) (search x (caddr t)))
         (else #f)
         )))
    (if
     (not (tree? t))
     (list 'not-a-tree t)
     (search x t)
     )))

(define precedes? (lambda (x y) (< x y)))



(define sumPath
  (lambda (x t)
    (define search
      (lambda (x t s)
        (cond
         ((null? t) #f)
         ((equal? x (car t)) (+ s (car t)))
         ((precedes? x (car t)) (search x (cadr t) (+ s (car t))))
         ((precedes? (car t) x) (search x (caddr t) (+ s (car t))))
         (else #f)
         )))
    (if
     (not (tree? t))
     (list 'not-a-tree t)
     (search x t 0)
     )))

(sumPath 13 T)
; => 46 ; 12 + 21 + 13
(sumPath 7 T)
; => 19 ; 12 + 7 
