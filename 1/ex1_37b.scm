(define (cont-frac n d k)
	(define (frac-rec i)
		(/ (n i)
		(+ (d i)
			(if (= i k)
				0
				(frac-rec (+ i 1))))))
	(frac-rec 1))

