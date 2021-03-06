(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
		(else else-clause)))

(define (sqrt x)
        (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)))

(define (good-enough? guess x)
        (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
        (average guess (/ x guess)))

(define (average x y)
        (/ (+ x y) 2))

(display (sqrt 9))

;; The sqrt-iter does not return any value as the procedure recursively goes on evaluating the the arguments untill maximum recursion epth is exceeded...
