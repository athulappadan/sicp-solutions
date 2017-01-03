;;; ex2_66.scm

(define nil '())

(define (make-tree entry left right)
	(list entry left right))

(define (get-current tree) (car tree))
(define (left-tree tree) (cadr tree))
(define (right-tree tree) (caadr tree))

(define (make-entry key val) (cons key val))
(define (get-key entry) (car entry))
(define (get-val entry) (cdr entry))

(define (lookup key set-of-records)
	(cond ((null? set-of-records) #f)
			((= key (get-key (get-current set-of-records)))
				(get-val (get-current set-of-records)))
			((< key (get-key (get-current set-of-records)))
				(lookup key (left-tree set-of-records)))
			(else
				(lookup key (right-tree set-of-records)))))

