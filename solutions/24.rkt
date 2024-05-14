#lang htdp/bsl

(define (==> x y)
  (or (not x) y))

(==> #true #false)
; 1. (or (not #true) #false)
; 2. (or #false #false)
; 3. #false
