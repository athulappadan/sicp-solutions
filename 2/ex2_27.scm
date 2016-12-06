(define nil '())

(define (deep-reverse items)
	(cond ((null? items) nil)
			((not (pair? items)) (list items))
			(else (append (deep-reverse (cdr items)) 
							(deep-reverse (car items))))))
