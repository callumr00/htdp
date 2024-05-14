#lang htdp/bsl

(define sunny #true)
(define friday #false)

(boolean=?
  (or
    (not sunny)
    friday)
  #false)

; 4 possible combinations:
; sunny = #true , friday = #true
; sunny = #true , friday = #false
; sunny = #false, friday = #true
; sunny = #false, friday = #false
