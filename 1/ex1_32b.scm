(define (accumulator combiner null-value term a next b)
	(define (iter a result)
		(if (> a b) result
			 (iter (next a) (combiner result (term a)))))
	(iter a null-value))

(define (sum term a next b)
	(accumulator + 0 term a next b))

(define (product term a next b)
	(accumulator * 1 erm a next b))
 
