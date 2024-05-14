#lang htdp/bsl

(define (string-delete str i)
  (if
    (and
      (string? str)
      (> (string-length str) 0)
      (number? i)
      (>= i 0)
      (< i (string-length str)))
    (string-append
      (substring str 0 i)
      (substring str (+ i 1) (string-length str)))
    #false))

; Tests.
(and
  (string=? (string-delete "helloworld" 0) "elloworld")
  (string=? (string-delete "helloworld" 5) "helloorld")
  (string=? (string-delete "helloworld" 9) "helloworl")
  (not (string-delete "helloworld" 10))
  (not (string-delete "" 5))
  (not (string-delete "helloworld" -1))
  (not (string-delete "helloworld" 100))
  (not (string-delete 1 2)))
