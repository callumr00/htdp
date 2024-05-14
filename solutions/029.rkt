#lang htdp/bsl

(define base-ticket-price 5.0)
(define base-num-attendees 120)
(define attendees-step-change 15)
(define trial-step 0.1)
(define variable-cost 1.50)

(define (attendees ticket-price)
  (- base-num-attendees (*
                          (- ticket-price base-ticket-price)
                          (/ attendees-step-change trial-step))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* variable-cost (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 3) ; $ 630.00
(profit 4) ; $ 675.00
(profit 5) ; $ 420.00

(define (profit2 price)
  (-
    (* (+ 120(* (/ 15 0.1) (- 5.0 price))) price)
    (* 1.5 (+ 120 (* (/ 15 0.1) (- 5.0 price))))))

; Tests.
(and
  (= (profit 3) (profit2 3))
  (= (profit 4) (profit2 4))
  (= (profit 5) (profit2 5)))
