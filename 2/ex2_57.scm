;;; ex2_57.scm

(define (deriv expr var)
	(cond ((number? expr) 0)
			((variable? expr)
				(if (same-variable? expr var) 1 0))
			((sum? expr)
				(make-sum
					(deriv (addend expr) var)
					(deriv (augend expr) var)))
			((product? expr)
				(make-sum
					(make-product
						(multiplier expr) (deriv (multiplicand expr) var))
					(make-product
						(multiplicand expr) (deriv (multiplier expr) var))))
			((exponentiation? expr)
				(make-product
					(exponent expr) (make-exponentiation (base expr) (- (exponent expr) 1))))
			(else
				(error "Unknown expression type -- DERIV" expr))))

(define (variable? v) (symbol? v))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? expr num)
	(and (number? expr) (= expr num)))

(define (make-sum e1 e2)
	(cond ((=number? e1 0) e2)
			((=number? e2 0) e1)
			((and (number? e1) (number? e2)) (+ e1 e2))
			(else
				(list '+ e1 e2))))

(define (make-product e1 e2)
	(cond ((or (=number? e1 0) (=number? e2 0)) 0)
			((=number? e1 1) e2)
			((=number? e2 1) e1)
			((and (number? e1) (number? e2)) (* e1 e2))
			(else
				(list '* e1 e2))))

(define (make-exponentiation e n)
	(cond ((=number? n 0) 1)
			((=number? n 1) e)
			(else
				(list '** e n))))

(define (sum? e) (and (pair? e) (eq? (car e) '+)))
(define (product? e) (and (pair? e) (eq? (car e) '*)))
(define (exponentiation? e) (and (pair? e) (eq? (car e) '**)))
(define (addend e) (cadr e))
(define (augend e)
	(if (= (length e) 3)
		(caddr e)
		(cons '+ (cddr e))))
(define (multiplier e) (cadr e))
(define (multiplicand e)
	(if (= (length e) 3)
		(caddr e)
		(cons '* (cddr e))))
(define (base e) (cadr e))
(define (exponent e) (caddr e))
