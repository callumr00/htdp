#lang htdp/bsl

(require 2htdp/image)
(require test-engine/racket-tests)

(define WHEEL-RADIUS 5)

(define wheel (circle WHEEL-RADIUS "solid" "black"))
(define wheel-space
  (rectangle (* WHEEL-RADIUS 2) WHEEL-RADIUS "solid" "transparent"))
(define wheels (beside wheel wheel-space wheel))
(define body (rectangle (* WHEEL-RADIUS 7) (* WHEEL-RADIUS 3) "solid" "red"))
(define CAR (above body wheels))
