#lang htdp/bsl

(require test-engine/racket-tests)

; computes the distance of ap to the origin
(define (distance-to-0 ap)
  (sqrt
    (+
      (sqr (posn-x ap))
      (sqr (posn-y ap)))))

(check-expect (distance-to-0 (make-posn 0 5)) 5)
(check-expect (distance-to-0 (make-posn 7 0)) 7)
(check-expect (distance-to-0 (make-posn 3 4)) 5)
(check-expect (distance-to-0 (make-posn 8 6)) 10)
(check-expect (distance-to-0 (make-posn 5 12)) 13)

(distance-to-0 (make-posn 3 4))
; 1. (sqrt
;      (+
;        (sqr (posn-x (make-posn 3 4)))
;        (sqr (posn-y (make-posn 3 4)))))
; 2. (sqrt
;      (+
;        (sqr 3)
;        (sqr (posn-y (make-posn 3 4)))))
; 3. (sqrt
;      (+ 9 (sqr (posn-y (make-posn 3 4)))))
; 4. (sqrt (+ 9 (sqr 4)))
; 5. (sqrt (+ 9 16))
; 6. (sqrt 25)
; 7. 5

(distance-to-0 (make-posn 6 (* 2 4)))
; 1. (distance-to-0 (make-posn 6 8))
; 2. (sqrt
;      (+
;        (sqr (posn-x (make-posn 6 8)))
;        (sqr (posn-y (make-posn 6 8)))))
; 3. (sqrt
;      (+
;        (sqr 6)
;        (sqr (posn-y (make-posn 6 8)))))
; 4. (sqrt
;      (+
;        36
;        (sqr (posn-y (make-posn 6 8)))))
; 5. (sqrt (+ 36 (sqr 8)))
; 6. (sqrt (+ 36 64))
; 7. (sqrt 100)
; 8. 10

(+ (distance-to-0 (make-posn 12 5)) 10)
; 1. (+
;      (sqrt
;        (+
;          (sqr (posn-x (make-posn 12 5)))
;          (sqr (posn-y (make-posn 12 5)))))
;      10)
; 2. (+
;      (sqrt
;        (+
;          (sqr 12)
;          (sqr (posn-y (make-posn 12 5)))))
;      10)
; 3. (+
;      (sqrt
;        (+
;          144
;          (sqr (posn-y (make-posn 12 5)))))
;      10)
; 4. (+ (sqrt (+ 144 (sqr 5))) 10)
; 5. (+ (sqrt (+ 144 25)) 10)
; 6. (+ (sqrt 169) 10)
; 7. (+ 13 10)
; 8. 23

(test)
