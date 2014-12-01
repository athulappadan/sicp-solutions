
(define (square x) (* x x))

;; Point library

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (point-dist p1 p2)
        (sqrt (+ (square (- (x-point p1) (x-point p2)))
               (square (- (y-point p1) (y-point p2))))))

;; Segment Library

(define (make-segment p1 p2) (cons p1 p2))
(define (start-seg p) (car p))
(define (end-seg p) (cdr p))
(define (seg-len seg) (point-dist (start-seg seg) (end-seg seg)))


;; Rectagle Library

(define (make-rect side parallel-side)
        (cons side parallel-side))
(define (side1 rect) (car rect))
(define (side2 rect) (cdr rect))
(define (side-lengths rect)
        (cons (seg-len (side1 rect))
                (min (abs (point-dist (start-seg (side1 rect))
                                    (start-seg (side2 rect))))
                    (abs (point-dist (start-seg (side1 rect))
                                    (end-seg (side2 rect)))))))


(define (width-rect rect) (car (side-lengths rect)))
(define (height-rect rect) (cdr (side-lengths rect)))


;; Area and Perimeter

(define (area-rect rect)
        (* (width-rect rect) (height-rect rect)))

(define (perimeter-rect rect)
        (* (+ (width-rect) (height-rect)) 2))


;; Testing

(define r (make-rect (make-segment (make-point 0 1)
                                    (make-point 0 0))
                    (make-segment (make-point 1 0)
                                    (make-point 1 1))))


