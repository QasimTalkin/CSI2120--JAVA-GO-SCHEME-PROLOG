#lang racket

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
      
(tree? '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))
(tree? '(73 (31 (5 () ()) ()) (101 (83 () (97 () () ())) ())))
(tree? '(73 (31 (5 () ()) ()) (101 (83 () (97 ())) ())))

(define (inorder t)
  (define traverse
    (lambda (t)
      (if (null? t) '()
	  (append (traverse (cadr t)) (cons (car t) (traverse (caddr t))))
	  )))
  (if
   (not (tree? t))
   (list 'not-a-tree t)
   (traverse t)
   ))

(inorder '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))


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

(search-BST 83 '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))
(search-BST 84 '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))

(define (nsymbols tree) 
  (if (pair? tree)  
      (+ (nsymbols (car tree))
	 (nsymbols (cdr tree)))
      (if (symbol? tree) 1 0)))


(nsymbols '(+ a (* b c))) 

(nsymbols '(k (e (d (b () ()) ()) (p (m () (q () ())) ()))))


; Same with numbers

(define (nnumbers tree) 
  (if (pair? tree)  
      (+ (nnumbers (car tree)) 
	 (nnumbers (cdr tree))) 
      (if (number? tree) 1 0))) 

(nnumbers '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))



(define (nchars tree) 
  (if (pair? tree)  
      (+ (nchars (car tree)) 
	 (nchars (cdr tree))) 
      (if (char? tree) 1 0))) 


(nchars '(#\E 33 56 #\l #\o))
(nchars (string->list "Hello"))



(define (nsymbolsB tree) (nsymbolst tree 0)) 

(define (nsymbolst tree n) 
  (begin 
    (display tree)(display " ")(display n)(newline)
    (if (pair? tree) 
	(nsymbolst (cdr tree) 
		   (nsymbolst (car tree) n)) 
	(+ n (if (symbol? tree) 1 0)))))

(nsymbolsB '(+ a (* b c))) 

; Comparison

(define (nsymbolsC tree) 
  (display tree)
  (newline)
  (if (pair? tree)  
      (+ (nsymbolsC (car tree))
	 (nsymbolsC (cdr tree)))
      (if (symbol? tree) 1 0)))

(define (tree->list tree) 
  (reverse (tree->list2 tree '()))) 

(define (tree->list2 tree lst) 
  (if (pair? tree) 
         (tree->list2 (cdr tree) 
                      (tree->list2 (car tree) lst)) 
         (if (null? tree) lst (cons tree lst) ))) 

(tree->list '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))


(define (tree-search tree value) 
  (cond ((null? tree) #f) 
    ((equal? value (car tree)) #t) 
    ((< value (car tree)) 
       (tree-search (cadr tree) value)) 
    (else (tree-search (caddr tree) value))))
 


(define (insert-BST tree value) 
  (cond ((null? tree) (list value '() '())) 
	((< value (car tree)) 
	 (list (car tree) (insert-BST (cadr tree) value) 
	       (caddr tree))) 
	(else (list (car tree) (cadr tree) 
                    (insert-BST (caddr tree) value)))))

 
(insert-BST '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())) 86)


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


(define delete
  (lambda (x t)
    (cond
     ((null? t) '())
     ((and (equal? x (car t)) (null? (cadr t))) (caddr t))
     ((and (equal? x (car t)) (null? (caddr t))) (cadr t))
     ((equal? x (car t))
      (let ((r (removemax-BST (cadr t))))
	(list (cdr r) (car r) (caddr t))
        ))
     ((precedes? x (car t)) (list (car t) 
				  (delete x (cadr t)) (caddr t)))
     ((precedes? (car t) x) (list (car t) (cadr t) 
				  (delete x (caddr t))))
     (else t)
     )))



(define delete-BST
  (lambda (x t)
    (if
      (not (tree? t))
      (list 'not-a-tree t)
      (delete x t)
)))

(define precedesB? (lambda (x y) (< x y)))

(delete-BST 101 '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) ())))


(define (series n1 n2 N)
  (begin
    (display (list n1 n2 N)) (newline)
    (if (zero? N) '()
	(cons (+ n1 n2) (series n2 (+ n1 n2) (- N 1))))))

(series 0 1 10)
; (1 2 3 5 8 13 21 34 55 89)

(define (in-seq x L)
  (cond ((null? L) '())
	((< x (car L)) '())
	((= x (car L)) x)
	(#t (in-seq x (cdr L)))))

(in-seq 15 (series 0 1 200))

(define (seriesB n1 n2 N)
  (begin
    (display (list n1 n2 N)) (newline)
    (if (zero? N) '()
	(cons (+ n1 n2) (delay (seriesB n2 (+ n1 n2) (- N 1)))))))


(seriesB 0 1 200)

(cons (car(seriesB 0 1 200)) (force (cdr(seriesB 0 1 200))))

(define (in-seq-B x L)
  (let ((tmp (car L)))
    (cond ((null? L) '())
	  ((< x tmp) '())
	  ((= x tmp) x)
	  (#t (in-seq-B x (force (cdr L)))))))

(in-seq-B 15 (seriesB 0 1 200))


; Towers of Hanoi
(define (towers n to from using) 
  (if (> n 0) 
    (begin 
      (towers (- n 1) using from to) 
      (display "move ")(display from) 
      (display " --> ")(display to)(newline)
      (towers (- n 1) to using from) )
    '()
)) 


; move to 3 from 1 via 2
;;;;;;;;;;;;;;;;;
(define (hanoi n) 
   (towers n 3 1 2) )

(hanoi 3)

; Tic Tac Toe

(define start  '((1 2 3) (4 5 6) (7 8 9) 
			 (1 4 7) (2 5 8) (3 6 9) (1 5 9) (3 5 7)))


(define subst 
  (lambda (new old l) 
    (cond ((null? l) (quote ())) 
	  ((not (list? (car l))) 
	   (cond ((eq? (car l) old) 
		  (cons new (subst new old (cdr l)))) 
		 (else (cons (car l) (subst new old (cdr l)))))) 
	  (else (cons (subst new old (car l)) 
		      (subst new old (cdr l)))))))

(subst 'X 1 start)

(define (all-equal? list)
  (cond ((null? list) `())
            ((null? (cdr list)) (car list))
            ((equal? (car list) (cadr list)) (all-equal? (cdr list)))
            (else #f)))

(define (play board player position)
   (subst player position board))

(define (winner board)
  (map all-equal? board))

(define (number-of-member x list) 
  (cond ((null? list) 0) 
	((equal? x (car list)) 
	 (+ 1 (number-of-member x (cdr list))))
	(else  (number-of-member x (cdr list)))))  


(map (lambda (list) (number-of-member 'X list)) 
     '((X 2 3) (4 X X) (7 O O) (X 4 7) 
	       (2 X O) (3 X O) (X X O) (3 X 7)))

