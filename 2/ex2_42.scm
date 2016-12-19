;;; ex2_42.scm

(declare (uses accumulate))
(declare (uses flatmap))
(declare (uses enumerate-interval))
(declare (uses srfi-1))

(define empty-board nil)
(define (make-row-col row col) (cons row col))
(define (get-row pos) (car pos))
(define (get-col pos) (cdr pos))

(define (adjoin new-row k-col rest-of-queens)
	(append rest-of-queens (list (make-row-col new-row k-col))))

(define (safe? k positions)
	(let ((kth-queen (list-ref positions (- k 1)))
			(others (filter (lambda (pos) (not (= (get-col pos) k)))
								positions)))
	(all-safe? kth-queen others)))

(define (all-safe? q others)
	(or (null? others)
		(and (safe-with? q (car others))
			(all-safe? q (cdr others)))))

(define (safe-with? q pre-q)
	(and (not (= (get-row q) (get-row pre-q)))
		(not (= (abs (- (get-row q) (get-row pre-q)))
				(abs (- (get-col q) (get-col pre-q)))))))

(define (queens n)
	(define (queens-col k)
		(if (= k 0)
			(list empty-board)
			(filter (lambda (positions) (safe? k positions))
				(flatmap (lambda (rest-of-queens)
					(map (lambda (new-row) (adjoin new-row k rest-of-queens))
						(enumerate-interval 1 n)))
					(queens-col (- k 1))))))
	(queens-col n))

(write (queens 1)) (newline)
(write (queens 2)) (newline)
(write (queens 3)) (newline)
(write (queens 4)) (newline)
(write (queens 5)) (newline)
