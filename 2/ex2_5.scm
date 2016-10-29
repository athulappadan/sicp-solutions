(define (exponent n pow)
	(exp-helper 1 n pow))

(define (exp-helper acc n pow)
	(if (= pow 0)
		acc
		(exp-helper (* acc n) n (- pow 1))))

(define (new-cons x y)
	(* (exponent 2 x) (exponent 3 y)))

(define (find-power n base)
	(helper-power 0 n base))

(define (helper-power pow n base)
	(if (not (= (remainder n base) 0))
		pow
		(helper-power (+ pow 1) (/ n base) base)))

(define (new-car z) (find-power z 2))
(define (new-cdr z) (find-power z 3))
