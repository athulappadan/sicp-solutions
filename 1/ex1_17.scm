
(define (mul x y)
	(cond ((= y 0) 0)
		((even? y) (double (mul x (halve y))))
	(else (+ x (mul x (- y 1))))))

(define (double x)
	(+ x x))

(define (halve x)
	(cond ((even? x) (/ x 2))))

(define (even? x)
	(= (remainder x 2) 0))

