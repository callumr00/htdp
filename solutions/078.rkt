#lang htdp/bsl

(require test-engine/racket-tests)

; A Letter is one of:
; --- "a" through "z"
; --- #false
; interpretation a lowercase letter or boolean false.

; A Word is a structure:
;   (make-word Letter Letter Letter)
; interpretation a 3 letter word.
(define-struct word [first second third])

(check-expect (word-first (make-word "c" "a" "t")) "c")

(test)
