(define (reverse-list items)
	(if (null? (cdr items))
		items
		(append (reverse-list (cdr items)) (list (car items)))))
