;;; ex3_25.scm

(define (make-table)
	(let ((local-table (list '*table*)))
		(define (assoc key records)
			(cond ((null? records) #f)
					((equal? key (caar records)) (car records))
					(else
						(assoc key (cdr records)))))

		(define (lookup keys)
			(let ((record (assoc keys (cdr local-table))))
				(if record
					(cdr record)
					#f)))

		(define (insert! keys value)
			(let ((record (assoc keys (cdr local-table))))
				(if record
					(set-cdr! record value)
					(set-cdr! local-table
										(cons (cons keys value) (cdr local-table))))))

		(define (dispatch m)
			(cond ((eq? m 'lookup-proc) lookup)
					((eq? m 'insert-proc!) insert!)
					(else
						(error "Unknown operation -- TABLE" m))))
		dispatch))

(define op-table (make-table))
(define put (op-table 'insert-proc!))
(define get (op-table 'lookup-proc))
(put '(letters a) 97)
(put '(letters b) 98)
(put '(math +) 43)
(put '(math -) 45)
(put '(math *) 42)
(put '(greek majiscule ^) 923)
(put '(greek miniscule &) 955)
(put '(min) 42)
(put '(max) 955)

(write (get '(letters b))) (newline)
(write (get '(greek majiscule ^))) (newline)
(write (get '(dfashoigrar asdfasdf retaqw))) (newline)
