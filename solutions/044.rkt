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
(define (tock ws) (+ ws 1))

; WorldState -> Image
; Places the car into the background scene
(define (render ws)
  (place-image CAR (+ (* 5 (sin ws)) ws) Y-CAR BACKGROUND))
(check-expect (render 10)
              (place-image CAR (+ (* 5 (sin 10)) 10) Y-CAR BACKGROUND))

; WorldState -> Boolean
; Determines if the program has ended
(define (end? ws)
  (>= ws (+ SCENE-WIDTH (/ (image-width CAR) 2))))
(check-expect (end? 0) #false)
(check-expect
  (end? (+ SCENE-WIDTH (/ (image-width CAR) 2)))
  #true)

; WorldState Number Number String -> WorldState
; Places the car at the mouse's x-coordinate on right-click.
(define (hyper x-position-of-car x-mouse y-mouse me)
  x-position-of-car)
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10) ; Fails.
(check-expect (hyper 42 10 20 "move") 42)

(define (main ws)
  (big-bang 0
            [on-tick tock]
            [on-mouse hyper]
            [to-draw render]
            [stop-when end?]))

(test)
(main 0)
