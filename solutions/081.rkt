#lang htdp/bsl

(require test-engine/racket-tests)

; A Point-in-time is a structure:
;   (make-point-in-time Number Number Number)
; interpretation the hours, minutes, and seconds
; since midnight.
(define-struct point-in-time [hours minutes seconds])

; Point-in-time -> Number
; Calculates the number of seconds that have passed since midnight.
(define (time->seconds time)
  (+ (* 60 60 (point-in-time-hours time))
     (* 60 (point-in-time-minutes time))
     (point-in-time-seconds time)))

(check-expect (time->seconds (make-point-in-time 12 30 2)) 45002)

(test)
