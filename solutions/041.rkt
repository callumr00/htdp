#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SCENE-WIDTH 200)
(define SCENE-HEIGHT 50)
(define WHEEL-RADIUS 5)
(define VELOCITY 3)

(define wheel (circle WHEEL-RADIUS "solid" "black"))
(define wheel-space
  (rectangle (* WHEEL-RADIUS 2) WHEEL-RADIUS "solid" "transparent"))
(define wheels (beside wheel wheel-space wheel))
(define body (rectangle (* WHEEL-RADIUS 7) (* WHEEL-RADIUS 3) "solid" "red"))
(define CAR (above body wheels))
(define Y-CAR (- SCENE-HEIGHT (/ (image-height CAR) 2)))

(define TREE
  (above (circle 10 "solid" "green") (rectangle 5 20 "solid" "brown")))
(define Y-TREE (- SCENE-HEIGHT (/ (image-height TREE) 2)))

(define BACKGROUND
  (place-image TREE 40 Y-TREE (empty-scene SCENE-WIDTH SCENE-HEIGHT)))

; WorldState -> WorldState
; Moves the car at each tick
(define (tock ws) (+ ws VELOCITY))
(check-expect (tock 20) (+ 20 VELOCITY))
(check-expect (tock 81) (+ 81 VELOCITY))

; WorldState -> Image
; Places the car into the background scene
(define (render ws) (place-image CAR ws Y-CAR BACKGROUND))
(check-expect (render 10) (place-image CAR 10 Y-CAR BACKGROUND))

; WorldState -> Boolean
; Determines if the program has ended
(define (end? ws)
  (>= ws (+ SCENE-WIDTH (/ (image-width CAR) 2))))
(check-expect (end? 0) #false)
(check-expect
  (end? (+ SCENE-WIDTH (/ (image-width CAR) 2)))
  #true)

(define (main ws)
  (big-bang 0
            [on-tick tock]
            [to-draw render]
            [stop-when end?]))

(test)
(main 0)
