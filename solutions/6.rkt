#lang htdp/bsl

(require 2htdp/image)

; cat has been replaced by a simple rectangle
; as images can't be saved within text files.
(define image (rectangle 10 10 "solid" "black"))

(=
  (* (image-width image) (image-height image))
  100)
