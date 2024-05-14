#lang htdp/bsl

(define (string-insert str i)
  (if
    (and
      (string? str)
      (> (string-length str) 0)
      (number? i)
      (>= i 0)
      (<= i (string-length str)))
    (string-append
      (substring str 0 i)
      "_"
      (substring str i (string-length str)))
    #false))

; Tests.
(and
  (string=? (string-insert "helloworld" 0) "_helloworld")
  (string=? (string-insert "helloworld" 5) "hello_world")
  (string=? (string-insert "helloworld" 10) "helloworld_")
  (not (string-insert "" 5))
  (not (string-insert "helloworld" -1))
  (not (string-insert "helloworld" 100))
  (not (string-insert 1 2)))
