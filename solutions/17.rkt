#lang htdp/bsl

(require 2htdp/image)

(define (image-classify image)
  (if
    (image? image)
    (if
      (= (image-height image) (image-width image))
      "square"
      (if
        (>= (image-height image) (image-width image))
        "tall"
        "wide"))
    #false))

; Tests.
(and
  (not (image-classify 12))
  (string=? (image-classify (rectangle 20 20 "solid" "black")) "square")
  (string=? (image-classify (rectangle 10 20 "solid" "black")) "tall")
  (string=? (image-classify (rectangle 20 10 "solid" "black")) "wide"))
