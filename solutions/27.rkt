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
