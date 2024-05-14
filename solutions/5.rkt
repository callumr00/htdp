#lang htdp/bsl

(require 2htdp/image)

(define image-scale 1)

(above
  (circle (* image-scale 10) "solid" "green")
  (rectangle (* image-scale 5) (* image-scale 20) "solid" "brown"))
