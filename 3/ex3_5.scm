;;; ex3_5.scm

(define (monte-carlo trials experiment)
	(define (iter trials-remaining trials-passed)
		(cond ((= trials-remaining 0) (/ trials-passed trials))
				((experiment)
					(iter (- trials-remaining 1) (+ trials-passed 1)))
				(else
					(iter (- trials-remaining 1) trials-passed))))
	(iter trials 0))

(define (estimate-integral P x1 x2 y1 y2 trials)
	(define (area-test)
		(<= (P (random-in-range x1 x2) (random-in-range y1 y2)) 0))

	(define (rect-area)
		(abs (* (- x2 x1) (- y2 y1))))

	(* (rect-area) (monte-carlo trials area-test)))

(define (random-in-range low high)
	(let ((range (- high low)))
		(+ low (random range))))

(define f (lambda (x y) (+ (expt (- x 5) 2) (expt (- y 7) 2) -9)))
(define area (estimate-integral f 2 8 4 10 100000))
