(define (make-account balance passwd)
	(define account-passwd passwd)
	(define withdraw
		(lambda (amount)
			(if (>= balance amount)
				(begin (set! balance (- balance amount))
					balance)
				"Insufficient funds")))

	(define deposit
		(lambda (amount)
			(begin (set! balance (+ balance amount))
				balance)))

	(lambda (passwd cmd)
		(if (eq? account-passwd passwd)
				(cond ((eq? cmd 'withdraw) withdraw)
						((eq? cmd 'deposit) deposit)
						(else
							(error "Unknown operation")))
				(error "Wrong password"))))

(define (make-joint account account-passwd joint-passwd)
	(lambda (passwd cmd)
		(if (eq? joint-passwd passwd)
			(cond ((eq? cmd 'withdraw) (account account-passwd 'withdraw))
					((eq? cmd 'deposit) (account account-passwd 'deposit))
					(else
						(error "Unknown joint operation")))
			(error "Wrong joint password"))))


