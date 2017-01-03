;;; ex2_68.scm

(declare (uses huffman))
(declare (unit ex2_68))

(define (encode message tree)
    (if (null? message)
        nil
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))))

(define (encode-symbol sym tree)
    (cond ((symbol-in? sym (left-branch tree))
            (if (leaf? (left-branch tree))
                '(0)
                (cons '0 (encode-symbol sym (left-branch tree)))))
        ((symbol-in? sym (right-branch tree))
            (if (leaf? (right-branch tree))
                '(1)
                (cons '1 (encode-symbol sym (right-branch tree)))))
        (else
            (error "Symbol not found in tree" sym))))

(define (symbol-in? sym tr) 
    (element-of-set? sym (symbols tr)))

(define (element-of-set? x set)
    (cond ((null? set) #f)
            ((equal? x (car set)) #t)
            (else
                (element-of-set? x (cdr set)))))

(define sample-tree
    (make-code-tree (make-leaf 'a 4)
        (make-code-tree (make-leaf 'b 2)
            (make-code-tree (make-leaf 'd 1) (make-leaf 'c 1)))))

(write (encode '(a d a b b c) sample-tree)) (newline)
