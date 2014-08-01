(define (f n)
	(cond ((= n 2) 2)
		((= n 1) 1)
		((< n 1) 0)
		(else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))


(display (f 5))

