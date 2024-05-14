#lang htdp/bsl

(define str "helloworld")
(define i 5)

(string=?
  (string-append
    (substring str 0 i)
    (substring str (+ i 1) (string-length str)))
  "helloorld")

; valid for all values i 0 .. string-length - 1
