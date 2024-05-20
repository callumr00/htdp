#lang htdp/bsl

(require 2htdp/image)

; Image -> Number
; Returns the number of pixels in a given image
; given: (rectangle 10 10 "solid" "black"), expect: "100"
; given: (rectangle 10 20 "solid" "black"), expect: "200"
(define (image-area img)
  (* (image-height img) (image-width img)))

; Tests.
(and
  (= (image-area (rectangle 10 10 "solid" "black")) 100)
  (= (image-area (rectangle 10 20 "solid" "black")) 200))
