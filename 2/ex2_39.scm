(define nil '())

(define (reverse-left seqs)
	(fold-left (lambda (x y) (cons y x)) nil seqs))

(define (reverse-right seqs)
	(fold-right (lambda (x y) (append y (list x))) nil seqs))
