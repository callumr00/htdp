#lang htdp/bsl

(require test-engine/racket-tests)

; A Posn represents the state of the world.

; Posn -> Posn
; update the x-coordinate of p to n
(define (posn-up-x p n)
  (make-posn n (posn-y p)))

(check-expect (posn-up-x (make-posn 100 10) 5) (make-posn 5 10))

(test)
