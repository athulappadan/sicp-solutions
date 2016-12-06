(define nil '())

(define (square-tree-direct tree)
	(cond ((null? tree) nil)
			((not (pair? tree)) (* tree tree))
			(else (cons (square-tree-direct (car tree))
						(square-tree-direct (cdr tree))))))

(define (square-tree-map tree)
	(map (lambda (sub-tree)
			(if (pair? sub-tree)
					(square-tree-map sub-tree)
					(* sub-tree sub-tree)))
		tree))
