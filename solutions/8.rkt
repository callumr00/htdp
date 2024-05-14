#lang htdp/bsl

(require 2htdp/image)

; cat has been replaced by a simple rectangle
; as images can't be saved within text files.
(define image (rectangle 10 20 "solid" "black"))

(string=?
  (if
    (= (image-height image) (image-width image))
    "square"
    (if
      (>= (image-height image) (image-width image))
      "tall"
      "wide"))
  "tall")
