#lang htdp/bsl

(require 2htdp/image)

(define in "hello world")

(=
  (if
    (string? in)
    (string-length in)
    (if
      (image? in)
      (* (image-height in) (image-width in))
      (if
        (number? in)
        (if (> in 0) (- in 1) 0)
        (if in 10 20))))
  11)
