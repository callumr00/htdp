#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SCENE-WIDTH 200)
(define SCENE-HEIGHT 50)
(define SCENE (empty-scene SCENE-WIDTH SCENE-HEIGHT))

; cat has been replaced by a simple rectangle
; as images can't be saved within text files.
(define OBJECT (rectangle 10 10 "solid" "black"))
(define OBJECT-Y (/ SCENE-HEIGHT 2))

(define VELOCITY 3)

; WorldState -> WorldState
; Moves the image at each tick
(define (tock ws) (+ ws VELOCITY))

; WorldState -> Image
; Places the image onto the background
(define (render ws)
  (place-image OBJECT (modulo ws SCENE-WIDTH) OBJECT-Y SCENE))

(check-expect (render 30) (render (+ SCENE-WIDTH 30)))

(define (main ws)
  (big-bang 0
            [on-tick tock]
            [to-draw render]))

(test)
(main 0)
