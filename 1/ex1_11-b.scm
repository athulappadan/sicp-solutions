
(define (f n)
	(define (f-iter a b c count)
		(cond ((< count 1) a)
			(else (f-iter b c (+ (* 3 a) (* 2 b) c) (- count 1)))))
	(f-iter 0 1 2 n))




