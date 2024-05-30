#lang htdp/bsl

(require test-engine/racket-tests)

(define low-boundary 1000)
(define high-boundary 10000)

(define low-tax 0.05)
(define high-tax 0.08)

; A Price falls into one of three intervals
; 0 through 1000
; 1000 through 10000
; 10000 and above
; interpretation the price of an item

; Price -> Number
; computes the amount of tax charged for p

(define (sales-tax price)
  (cond
    [(and (<= 0 price) (< price low-boundary)) 0]
    [(and (<= low-boundary price) (< price high-boundary)) (* low-tax price)]
    [(>= price high-boundary) (* high-tax price)]))

(check-expect (sales-tax 0) 0)
(check-expect (sales-tax (/ low-boundary 2)) 0)
(check-expect (sales-tax (- low-boundary 1)) 0)
(check-expect (sales-tax low-boundary) (* low-tax low-boundary))
(check-expect (sales-tax (* low-boundary 2)) (* low-tax (* low-boundary 2)))
(check-expect (sales-tax (- high-boundary 1)) (* low-tax (- high-boundary 1)))
(check-expect (sales-tax high-boundary) (* high-tax high-boundary))
(check-expect (sales-tax (* high-boundary 2)) (* high-tax (* high-boundary 2)))

(test)
