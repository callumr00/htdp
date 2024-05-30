#lang htdp/bsl

(require test-engine/racket-tests)

; It does not matter which strategy, from those shown,
; is followed. As such, the easiest approach is the
; first strategy.

; computes the manhattan distance of ap to the origin
(define (manhattan-distance-to-0 ap)
  (+ (posn-x ap) (posn-y ap)))

(check-expect (manhattan-distance-to-0 (make-posn 5 1)) 6)
(check-expect (manhattan-distance-to-0 (make-posn 1 5)) 6)
(check-expect (manhattan-distance-to-0 (make-posn 5 5)) 10)

(test)
