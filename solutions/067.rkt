#lang htdp/bsl

(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

; balld-location is the number of pixels from the top
; balld-direction is the direction the ball is moving

(make-balld 0 "down")
(make-balld 50 "down")
(make-balld 20 "up")
