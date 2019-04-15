#lang racket

(define pTree (list (cons 2 -3)
                    (list (list (cons 5 1) (list (list (cons 7 2) '())))
                          (list (cons -3 4) '())
                          (list (cons 2 4) (list (list (cons -1 1) '())
                                                 (list (cons -2 3) '()))))))

(define (traverse T)
  (cond
    ((null? T) '())
    ((null? (cdr T)) (car T))
    (#t (cons (car T) (traverseTail (cadr T))))))
		
		
(define (traverseTail T)
  (cond
    ((null? T) '())
    (#t (append (traverse (car T)) (traverseTail (cdr T))))))
				  				  
				  
(define (findPoint? T U V)
  (cond
    ((null? T) #f)
    ((and (equal? (caar T) U) (equal? (cdar T) V)) #t)
    ((null? (cdr T)) #f)
    (#t (findPointTail? (cadr T) U V))))


(define (findPointTail? TL U V)
  (if (null? TL)
      #f
      (or (findPoint? (car TL) U V) (findPointTail? (cdr TL) U V))))

(traverse pTree)


(findPoint? pTree -1 1)

(findPoint? pTree 7 2)

(findPoint? pTree 2 4)

