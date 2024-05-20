#lang htdp/bsl

; String -> String
; Returns the last character of a non-empty string
; given: "hello world", expect: "d"
; given: "string", expect: "g"
(define (string-last str)
  (substring str (- (string-length str) 1)))

; Tests.
(and
  (string=? (string-last "hello world") "d")
  (string=? (string-last "string") "g"))
