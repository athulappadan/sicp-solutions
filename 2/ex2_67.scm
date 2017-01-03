;;; ex2_67.scm

(declare (uses huffman))
(declare (unit ex2_67))

(define nil '())

(define (decode bits tree)
	(define (decode-iter bits current-branch)
		(if (null? bits)
			nil
			(let ((next-branch (choose-branch (car bits) current-branch)))
				(if (leaf? next-branch)
					(cons (symbol-leaf next-branch) (decode-iter (cdr bits) tree))
					(decode-iter (cdr bits) next-branch)))))
	(decode-iter bits tree))

(define (choose-branch bit branch)
	(cond ((= bit 0) (left-branch branch))
			((= bit 1) (right-branch branch))
			(else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define sample-tree
	(make-code-tree (make-leaf 'a 4)
		(make-code-tree (make-leaf 'b 2)
			(make-code-tree (make-leaf 'd 1) (make-leaf 'c 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(write (decode sample-message sample-tree)) (newline)
