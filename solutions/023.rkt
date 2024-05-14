#lang htdp/bsl

(define (string-first s)
  (substring s 0 1))

(string-first "hello world")
; 1. (substring "hello world" 0 1)
; 2. "h"
