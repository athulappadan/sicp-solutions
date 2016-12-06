(define nil '())

(define (accumulate op initial seqs)
	(if (null? seqs)
		initial
		(op (car seqs)
			(accumulate op initial (cdr seqs)))))

(define (accumulate-n op initial seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op initial (map (lambda (x) (car x)) seqs))
            (accumulate-n op initial (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map (lambda (w) (dot-product v w)) m))

(define (transpose mat)
	(accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		(map (lambda (v) (matrix-*-vector cols v)) m)))
