(define (cont-frac n d k)
	(define (loop result term)
		(if (= term 0)
			result
			(loop (/ (n term)
				(+ (d term) result)) (- term 1))))
	(loop 0 k))


(define golden-ratio
	(/ 1.0 (cont-frac (lambda (i) 1.0)
			(lambda (i) 1.0)
			100)))


