;;; flatmap.scm

(declare (unit flatmap))
(declare (uses accumulate))

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))
