;;; ex3_1.scm

(define (make-accumulator sum)
	(lambda (inc)
		(begin (set! sum (+ sum inc))
			sum)))
