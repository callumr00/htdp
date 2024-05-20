#lang htdp/bsl

; String -> String
; Returns the first character of a non-empty string
; given: "hello world", expect: "h"
; given: "string", expect: "s"
(define (string-first str)
  (substring str 0 1))

; Tests.
(and
  (string=? (string-first "hello world") "h")
  (string=? (string-first "string") "s"))
