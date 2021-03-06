(define (make-interval x y) (cons x y))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

(define (make-center-percent c p)
	(make-interval (- c (* c (/ p 100)))
					(+ c(* c (/ p 100)))))

(define (center i)
	(/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
	(* (/ (/ (- (upper-bound i) (lower-bound i)) 2) (center i)) 100))
