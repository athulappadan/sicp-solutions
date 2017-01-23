;;; ex3_4.scm

(define (make-account balance passwd)
	(define maximum-wrong-limit 7)
    (define account-password passwd)
	(define wrong-times 1)

    (define withdraw
        (lambda (amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                    balance)
                (error "Insufficient funds"))))

    (define deposit
        (lambda (amount)
            (begin (set! balance (+ balance amount))
                balance)))

	(define (call-the-cops) (display "Something....."))

    (lambda (passwd cmd)
        (if (eq? account-password passwd)
			(begin (set! wrong-times 0)
            	(cond ((eq? cmd 'withdraw) withdraw)
                    	((eq? cmd 'deposit) deposit)
                    	(else
                        	(error "Unknown operation"))))
			(if (< wrong-times maximum-wrong-limit)
				(begin (set! wrong-times (+ wrong-times 1))
                	(error "Incorrect password"))
				(call-the-cops)))))

(define acc (make-account 100 'hello))
