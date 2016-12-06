(define nil '())

(define (accumulate op initial seq)
	(if (null? seq)
		initial
		(op (car seq)
			(accumulate op initial (cdr seq)))))

(define (accumulate-n op initial seqs)
	(if (null? (car seqs))
		nil
		(cons (accumulate op initial (map (lambda (x) (car x)) seqs))
			(accumulate-n op initial (map (lambda (x) (cdr x)) seqs)))))
