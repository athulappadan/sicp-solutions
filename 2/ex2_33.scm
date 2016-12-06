(define nil '())

(define (accumulate op initial seq)
	(if (null? seq)
		initial
		(op (car seq)
			(accumulate op initial (cdr seq)))))

(define (new-map p seq)
	(accumulate (lambda (x y) (cons (p x) y)) nil seq))

(define (new-append seq1 seq2)
	(accumulate cons seq2 seq1))

(define (new-length seq)
	(accumulate (lambda (x y) (+ 1 y)) 0 seq))
