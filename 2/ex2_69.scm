;;; ex2_69.scm

(declare (uses huffman))
(declare (uses ex2_67))
(declare (uses ex2_68))
(declare (unit ex2_69))

(define (merge-two nodes)
    (adjoin-set
        (make-code-tree (car nodes) (cadr nodes))
        (cddr nodes)))

(define (successive-merge nodes)
    (if (= (length nodes) 2)
        (make-code-tree (car nodes) (cadr nodes))
        (successive-merge (merge-two nodes))))

(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define sample-message '(a d a b b c))
(define sample-code '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(define tree (generate-huffman-tree (list (cons 'a 4) (cons 'b 2) (cons 'c 1) (cons 'd 1)))) 
(write (decode sample-code tree)) (newline)
(write (encode sample-message tree)) (newline)
