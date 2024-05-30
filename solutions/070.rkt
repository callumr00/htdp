#lang htdp/bsl

(define-struct centry [name home office cell])
; (centry-name (make-centry a b c d)) -> a
; (centry-home (make-centry a b c d)) -> b
; (centry-office (make-centry a b c d)) -> c
; (centry-cell (make-centry a b c d)) -> d

(define-struct phone [area number])
; (phone-area (make-phone a b)) -> a
; (phone-number (make-phone a b)) -> b

(phone-area
  (centry-office
    (make-centry "Shriram Fisler"
                 (make-phone 207 "363-2421")
                 (make-phone 101 "776-1099")
                 (make-phone 208 "112-9981"))))
; 1. (make-phone 101 "776-1099")
; 2. 101
