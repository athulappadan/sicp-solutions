(define (check-parity a b)
	(= (remainder a 2) (remainder b 2)))

(define (same-parity first . items)
	(iter (list first) items))

(define (iter ans items)
	(cond ((null? items) ans)
		((check-parity (car ans) (car items))
			(iter (append ans (list (car items))) (cdr items)))
		(else
			(iter ans (cdr items)))))
