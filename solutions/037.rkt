#lang htdp/bsl

; String -> String
; Returns the string with the first character removed
; given: "hello world", expect: "ello world"
; given: "string", expect: "tring"
(define (string-rest str)
  (substring str 1))

; Tests.
(and
  (string=? (string-rest "hello world") "ello world")
  (string=? (string-rest "string") "tring"))
