(define (accumulator combiner null-value term a next b)
	(if (> a b) null-value
		(combiner (term a) (accumulator combiner null-value (next a) b))))

(define (sum term a next b)
	(accumulator + 0 term a next b))

(define (product term a next b)
	(accumulator * 1 erm a next b))
 
