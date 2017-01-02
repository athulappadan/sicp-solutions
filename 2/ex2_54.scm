;;; ex2_54.scm

(define (my-equal? a b)
	(cond ((and (symbol? a) (symbol? b)) (eq? a b))
		((and (number? a) (number? b)) (= a b))
		((and (null? a) (null? b)) #t)
		((and (list? a) (list? b))
			(and (my-equal? (car a) (car b)) (my-equal? (cdr a) (cdr b))))
		(else #f)))

