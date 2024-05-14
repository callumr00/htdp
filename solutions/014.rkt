#lang htdp/bsl

(define (string-first str)
  (if
    (and
      (string? str)
      (not (= (string-length str) 0)))
    (substring str (- (string-length str) 1) (string-length str))
    #false))

; Tests.
(and
  (string=? (string-first "beans") "s")
  (not (string-first ""))
  (not (string-first 12)))
