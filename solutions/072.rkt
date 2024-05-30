#lang htdp/bsl

(define-struct phone [area number])
; A Phone is a structure:
;   (make-phone Number Number)
; interpretation a phone number

(define-struct phone# [area switch num])
; A Phone# is a structure:
;   (make-phone# Number Number Number)
; interpretation a phone number split into
; it's individual parts:
; an area code [000-999],
; a switch code [000-999],
; and a line number [0000-9999]
