(define (for-each-mine f items)
	(if (null? items)
		'()
		(and (f (car items)) (for-each-mine f (cdr items)))))
