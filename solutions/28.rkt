#lang htdp/bsl

(define base-ticket-price 5.0)
(define base-num-attendees 120)
(define attendees-step-change 15)
(define trial-step 0.1)
(define fixed-cost 180)
(define variable-cost 0.04)

(define (attendees ticket-price)
  (- base-num-attendees (*
                          (- ticket-price base-ticket-price)
                          (/ attendees-step-change trial-step))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* variable-cost (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 1) ; $  511.20
(profit 2) ; $  937.20
(profit 3) ; $ 1063.20
(profit 4) ; $  889.20
(profit 5) ; $  415.20

; Best ticket price: $2.90
(profit 2.9) ; $ 1064.10
