#lang racket
;; Exercise 1
(define (loop LA LB)
  (if (or (null? LA) (null? LB))
      '()
      (cons (abs (- (car LA) (car LB))) (loop (cdr LA) (cdr LB)))))


(define (absDiff L1 L2)
  (cond
   ((not (list? L1)) "L1 not a list")
   ((not (list? L2)) "L2 not a list")
   ((not (= (length L1) (length L2))) "List have different length")
   (#t (loop L1 L2))))

(absDiff '(1 3 5 6) '(3 5 2 1))

(absDiff '(1 3 5 6 7) '(3 5 2 1))


;; Exercise 2
(define (absDiffA L1 L2)
  (cond
   ((not (list? L1)) "L1 not a list")
   ((not (list? L2)) "L2 not a list")
   (#t (let loop ((LA L1)
                  (LB L2))
         (if (and (null? LA) (null? LB))
             '()
	     (cond
	      ((null? LA)
	       (cons (abs (car LB)) (loop (cdr LB) '())))
	      ((null? LB)
	       (cons (abs (car LA)) (loop (cdr LA) '())))
	      (#t (cons (abs (- (car LA) (car LB)))
			(loop (cdr LA) (cdr LB))))))))))

(absDiffA '(1 3 5 6 2 5) '(3 5 2 1))
(absDiffA '(1 3 5 6) '(3 5 2 1 2 5))



;; Exercise 3
(define (min-list x)
  (if (null? x)
      x
      (letrec ((min-list-aux (lambda (e l)
                            (cond
                              ((null? l) e)
                              ((> e (car l))
                               (min-list-aux (car l)(cdr l)))
                              (else (min-list-aux e (cdr l)))))))
        (min-list-aux (car x)(cdr x)))))

(min-list '(4 8 9 2 8))

;; Exercixe 4
(letrec ((f (lambda (a b)
              (let ((b (* b b)))
                (let* ((a (* a a)) (b (- b a)))
			(if (< a b)
                                (begin (display b) (display " ") (displayln a) (f b a))
                                (list a b))))))) (f 1 2))