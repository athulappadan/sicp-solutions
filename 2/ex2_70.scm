;;; ex2_70.scm

(declare (uses ex2_69))

(define sample-message
    '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))

(write (encode sample-message (generate-huffman-tree (list (cons 'a 2) (cons 'na 16) (cons 'boom 1) (cons 'sha 3) (cons 'get 2) (cons 'yip 9) (cons 'job 2) (cons 'wah 1))))) (newline)
