#lang htdp/bsl

(require test-engine/racket-tests)

(define VELOCITY 3)

; WorldState -> WorldState
; Moves the car at each tick
(define (tock ws)
  (+ ws VELOCITY))

; Tests.
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(check-expect (tock 78) 80) ; Fails.

(test)
