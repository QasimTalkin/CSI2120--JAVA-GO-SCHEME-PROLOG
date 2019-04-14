#lang racket
; question 5
; The function pairwise is to create all pairwise combinations from a list.
; Complete the global define below.
;
; (pairwise '(a 3 d e))
; '((a . 3) (3 . d) (d . e) (3 . d) (d . e) (d . e))


(define (pairwise L)
  (cond ((null? L)'())
	((= (length L) 1) '())
	(#t (letrec ((comb (lambda (element L)
			  (if (null? L)
			      '()
			      (cons (cons element (car L))
				 (comb (car L) (cdr L))) ; empty cons
                             ))))
	 (append (comb (car L) (cdr L)) (pairwise (cdr L)))) ; empty bracket              
	)
        )
  )

