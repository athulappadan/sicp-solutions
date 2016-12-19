;;; accumulate.scm

;(declare (unit accumulate))

(define nil '())

(define (accumulate op initial seqs)
	(if (null? seqs)
		initial
		(op (car seqs)
			(accumulate op initial (cdr seqs)))))

(define (flatmap proc seqs)
	(accumulate append nil (map proc seqs)))
