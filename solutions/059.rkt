#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SIZE 60)
(define BACKGROUND (rectangle SIZE (/ SIZE 2.5) "solid" "black"))
(define BULB-RADIUS (/ SIZE 10))
(define SPACER (rectangle (/ SIZE 10) 0 "solid" "transparent"))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl-next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "green") "yellow"]
    [(string=? cs "yellow") "red"]))

(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")

; Colour On? -> Bulb
; creates a bulb image from a colour and an on-off state
(define (bulb colour on?)
  (circle BULB-RADIUS (if on? "solid" "outline") colour))

(check-expect (bulb "red" #true) (circle BULB-RADIUS "solid" "red"))
(check-expect (bulb "red" #false) (circle BULB-RADIUS "outline" "red"))
(check-expect (bulb "green" #false) (circle BULB-RADIUS "outline" "green"))

; TrafficLight -> Image
; renders the current state cs as an image
(define (tl-render cs)
  (place-image
    (beside
       (bulb "red" (string=? cs "red"))
       SPACER
       (bulb "yellow" (string=? cs "yellow"))
       SPACER
       (bulb "green" (string=? cs "green")))
     (/ SIZE 2) (/ SIZE 5)
     BACKGROUND))

(check-expect (tl-render "red")
              (place-image
                (beside
                  (bulb "red" #true)
                  SPACER
                  (bulb "yellow" #false)
                  SPACER
                  (bulb "green" #false))
                (/ SIZE 2) (/ SIZE 5)
                BACKGROUND))

(check-expect (tl-render "yellow")
              (place-image
                (beside
                  (bulb "red" #false)
                  SPACER
                  (bulb "yellow" #true)
                  SPACER
                  (bulb "green" #false))
                (/ SIZE 2) (/ SIZE 5)
                BACKGROUND))

(check-expect (tl-render "green")
              (place-image
                (beside
                  (bulb "red" #false)
                  SPACER
                  (bulb "yellow" #false)
                  SPACER
                  (bulb "green" #true))
                (/ SIZE 2) (/ SIZE 5)
                BACKGROUND))

; TrafficLight -> TrafficLight
; ; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
            [to-draw tl-render]
            [on-tick tl-next 1]))

(test)

(traffic-light-simulation "red")
