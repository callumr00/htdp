#lang htdp/bsl

(define (distance x y)
  (sqrt (+ (sqr x) (sqr y))))

; Tests.
(= (distance 3 4) 5)
