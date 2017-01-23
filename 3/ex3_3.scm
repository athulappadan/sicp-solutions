;;; ex3_3.scm

(define (make-account balance passwd)
    (define account-password passwd)

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

    (lambda (passwd cmd)
        (if (eq? account-password passwd)
            (cond ((eq? cmd 'withdraw) withdraw)
                    ((eq? cmd 'deposit) deposit)
                    (else
                        (error "Unknown operation")))
                (error "Incorrect password"))))

