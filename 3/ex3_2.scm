;;;ex3_2.scm

(define (make-monitored f)
	(define counter 0)
	(define function-call
		(lambda (number)
			(begin (set! counter (+ counter 1))
				(f number))))

	(define no-of-calls
		(lambda () counter))

	(define reset-counter
		(lambda () (begin (set! counter 0) counter)))

	(lambda (m)
		(cond ((number? m) (function-call m))
				((eq? m 'how-many-calls?) (no-of-calls))
				((eq? m 'reset-counter) (reset-counter))
				(else
					"Unsupported operation"))))
