;------------------------------------
; question 4
;------------------------------------



; What is the result?

(let ((x 11))
  (* 2 x))

(let ((x 1))
  (let ((x (* x 2)))
    (* x x)))

(let ((x 1) (y 2)) 
  (let* ((x 3) 
	 (z (+ x y))) 
    (* z x)))


(let foo ((x 1))
  (if (< x 5)
      (+ x (foo (+ x 1)))
      x))


;------------------------------------
; question 5
;------------------------------------

; Fill the gap
(define L '((a)))
(caar L)
%a

(define L '(a b c))
(cadr L)
% b

(define L '(a (b c) d))
(caddr L)
%d


(define L '(2 (3 (4 () (6 () (7 () ()))))))
(caadr L)
% 3

;------------------------------------
; question 6
;------------------------------------

; stack into queue
;------------------------------------

(define a-stack '())

(define (empty?)
  (null? a-stack))

(define (push e)
  (set! a-stack (cons e a-stack)))
  
(define (pop)
  (if (empty?)
      ()
      (set! a-stack (cdr a-stack))))

(define (top)
  (if (empty?)
      ()
      (car a-stack)))


;------------------------------------
(define a-queue '())

(define (empty?)
  (null? a-queue))

(define (enque e)
  (set! a-queue (append a-queue (list e))))
 
(define (deque)
  (if (empty?)
      ()
      (set! a-queue (cdr a-queue))))

(define (top)
  (if (empty?)
      ()
      (car a-queue)))
;------------------------------------


;------------------------------------
; question 7
;------------------------------------

; Vector product -- forward loop
(define vector-product 
  (lambda (vec) 
    (do ((remaining (vector-length vec) (- remaining 1)) 
	 (total 1 (* total (vector-ref vec (- remaining 1))))) 
	((zero? remaining) total)))) 

(vector-product #( 2 5 7))

(define vector-product 
  (lambda (vec) 
    (do ((pos 0 (+ pos 1)) 
	 (total 1 (* total (vector-ref vec pos))))
	((eqv? pos (vector-length vec)) total)))) 

(vector-product #( 2 5 7))

;------------------------------------
; question 8
;------------------------------------
(define removemax-BST
  (lambda (t)
    (cond
     ((null? (caddr t)) (cons (cadr t) (car t)))
     (else 
      (let ((r (removemax-BST (caddr t))))
	(cons (list (car t) (cadr t) (car r)) (cdr r))
        ))
     )))

(removemax-BST '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))

;------------------------------------
(define removemin-BST
  (lambda (t)
    (cond
     ((null? (cadr t)) (cons (caddr t) (car t)))
     (else 
      (let ((r (removemin-BST (cadr t))))
	(display r)(newline)
	(display (car r)) (newline)
	(display (cdr r)) (newline)
	(cons (list (car t) (car r) (caddr t)) (cdr r)))
        ))
     ))

(removemin-BST '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))


