#lang htdp/bsl

; String -> String
; Returns the string with the last character removed
; given: "hello world", expect: "hello worl"
; given: "string", expect: "strin"
(define (string-rest str)
  (substring str 0 (- (string-length str) 1)))

; Tests.
(and
  (string=? (string-rest "hello world") "hello worl")
  (string=? (string-rest "string") "strin"))
