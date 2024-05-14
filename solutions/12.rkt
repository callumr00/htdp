#lang htdp/bsl

(define (cvolume l)
  (* l l l))

(define (csurface l)
  (* l l 6))

; Tests.
(and
  (= (cvolume 10) 1000)
  (= (csurface 10) 600))
