#lang htdp/bsl

; (string=? "resting" x) doesn't work because it results in a
; contract violation if x is not a string; you must instead
; first test if x is a string.
(and (string? x) (string=? "resting" x))
