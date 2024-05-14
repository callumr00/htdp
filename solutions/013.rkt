#lang htdp/bsl

(define (string-first str)
  (if
    (and
      (string? str)
      (not (= (string-length str) 0)))
    (substring str 0 1)
    #false))

; Tests.
(and
  (string=? (string-first "beans") "b")
  (not (string-first ""))
  (not (string-first 12)))
