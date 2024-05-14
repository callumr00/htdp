#lang htdp/bsl

(require 2htdp/image)

(define (image-area image)
  (if (image? image)
    (* (image-height image) (image-width image))
    #false))

; Tests.
(and
  (= (image-area (rectangle 10 20 "solid" "black")) 200)
  (not (image-area 12)))
