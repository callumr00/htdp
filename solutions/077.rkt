#lang htdp/bsl

; A Point-in-time is a structure:
;   (make-point-in-time Number Number Number)
; interpretation the hours, minutes, and seconds
; since midnight.
(define-struct point-in-time [hours minutes seconds])
