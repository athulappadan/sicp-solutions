;;; huffman.scm

(declare (unit huffman))
(define nil '())

(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? node) (equal? (car node) 'leaf))
(define (symbol-leaf leaf) (cadr leaf))
(define (weight-leaf leaf) (caddr leaf))

(define (make-code-tree left right)
	(list left
			right
			(append (symbols left) (symbols right))
			(+ (weights left) (weights right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
	(if (leaf? tree)
		(list (symbol-leaf tree))
		(caddr tree)))
(define (weights tree)
	(if (leaf? tree)
		(weight-leaf tree)
		(cadddr tree)))

(define (adjoin-set x set)
	(cond ((null? set) (list x))
			((< (weights x) (weights (car set)))
				(cons x set))
			(else
				(cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
	(if (null? pairs)
		nil
		(let ((head (car pairs)))
			(adjoin-set (make-leaf (car head) (cdr head))
						(make-leaf-set (cdr pairs))))))

