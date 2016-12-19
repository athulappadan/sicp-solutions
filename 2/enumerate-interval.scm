;;; enumerate-interval.scm

(declare (unit enumerate-interval))

(define nil '())

(define (enumerate-interval a n)
	(if (> a n)
		nil
		(cons a (enumerate-interval (+ a 1) n))))
