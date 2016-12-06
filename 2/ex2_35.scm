(define nil '())

(define (accumulate op initial seq)
	(if (null? seq)
		initial
		(op (car seq)
			(accumulate op initial (cdr seq)))))

(define (new-cl t)
	(accumulate (lambda (x y) (+ 1 y)) 0 (enumerate-leaves t)))

(define (count-leaves-map t)
	(accumulate + 0 
		(map (lambda (x) 
				(if (pair? x) (count-leaves-map x) 1))
			t)))
