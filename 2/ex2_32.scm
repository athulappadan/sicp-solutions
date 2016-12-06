(define nil '())

(define (subsets s)
	(if (null? s)
		(list s)
		(let ((rest (subsets (cdr s))))
			(append rest (map (lambda (elem) (cons (car s) elem)) rest)))))
