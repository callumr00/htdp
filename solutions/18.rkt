#lang htdp/bsl

(define (string-join str1 str2)
  (if
    (and
      (string? str1)
      (string? str2))
    (string-append str1 "_" str2)
    #false))

; Tests.
(and
  (string=? (string-join "hello" "world") "hello_world")
  (not (string-join 1 2)))
