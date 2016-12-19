;;; ex2_40.scm

(declare (uses flatmap))
(declare (uses srfi-1))

(define (unique-pairs n)
	(flatmap (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 2 n)))

(define (enumerate-interval a n)
	(if (> a n)
		nil
		(cons a (enumerate-interval (+ a 1) n))))

(define (prime? n)
    (define (prime-iter n div)
        (cond ((> div (sqrt n)) #t)
                ((= (remainder n div) 0) #f)
                (else (prime-iter n (+ div 1)))))
    (prime-iter n 2)) 

(define (sum-prime? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (make-sum-pair pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
    (map make-sum-pair
        (filter sum-prime?
            (unique-pairs n))))

(write (prime-sum-pairs 6)) (newline)
