(define nil '())

(define (square-list-normal items)
	(if (null? items)
		nil
		(cons (* (car items) (car items)) (square-list-normal (cdr items)))))

(define (square-list-map items)
	(map (lambda (x) (*  x x)) items))
