(define (fast-exp1 b n)
	(define (iter a b n)
		(cond ((= n 0) a)
			((even? n) (iter a (sqr b) (/ n 2)))
		(else (iter (* a b) b (- n 1)))))
	(iter 1 b n))

(define (sqr x) (* x x))

