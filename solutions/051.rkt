#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SCENE-SIZE 100)
(define SCENE (empty-scene SCENE-SIZE SCENE-SIZE))
(define (OBJECT colour) (circle (/ SCENE-SIZE 5) "solid" colour))

; WorldState -> WorldState
; Changes image colour at each tick
(define (tock ws)
  (cond
    [(string=? "red" ws) "green"]
    [(string=? "green" ws) "yellow"]
    [(string=? "yellow" ws) "red"]))

(check-expect (tock "red") "green")
(check-expect (tock "green") "yellow")
(check-expect (tock "yellow") "red")

; WorldState -> Image
; Places the image onto the background
(define (render ws)
  (place-image (OBJECT ws) (/ SCENE-SIZE 2) (/ SCENE-SIZE 2) SCENE))

(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]))

(test)
(main "red")
