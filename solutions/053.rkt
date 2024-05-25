#lang htdp/bsl

(require 2htdp/image)
(require test-engine/racket-tests)

; An LR (short for launching rocket) is one of:
; -- "resting"
; -- NonnegativeNumber
; interpretation "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight

(define SCENE-SIZE 100)
(define ROCKET-SIZE (/ SCENE-SIZE 10))
(define ROCKET (rectangle ROCKET-SIZE ROCKET-SIZE "solid" "red"))

(define SCENE-CENTER (/ SCENE-SIZE 2))
(define SCENE (empty-scene SCENE-SIZE SCENE-SIZE))
(define MIN-HEIGHT (/ ROCKET-SIZE 2))
(define MAX-HEIGHT (- SCENE-SIZE (/ ROCKET-SIZE 2)))

; LR -> Image
; Draws the rocket on a scene
; The rocket is grounded if LR is "rested" else is placed at LR

(define (place-rocket height)
  (place-image ROCKET SCENE-CENTER height SCENE))

(define (draw LR)
  (cond
    [(and (string? LR) (string=? "resting" LR))
     (place-rocket MAX-HEIGHT)]
    [(and (number? LR) (>= LR 0))
     (cond
       [(> LR SCENE-SIZE) #false]
       [(>= LR MAX-HEIGHT) (place-rocket MAX-HEIGHT)]
       [(<= LR MIN-HEIGHT) (place-rocket MIN-HEIGHT)]
       [else (place-rocket LR)])]
    [else #false]))

(check-expect (draw -1) #false)
(check-expect (draw (+ SCENE-SIZE 1)) #false)
(check-expect (draw "test") #false)
(check-expect (draw #true) #false)

(check-expect (draw 0)
              (place-image ROCKET SCENE-CENTER MIN-HEIGHT SCENE))

(check-expect (draw (/ SCENE-SIZE 2))
              (place-image ROCKET SCENE-CENTER (/ SCENE-SIZE 2) SCENE))

(check-expect (draw SCENE-SIZE)
              (place-image ROCKET SCENE-CENTER MAX-HEIGHT SCENE))

(check-expect (draw "resting") (draw (- SCENE-SIZE (/ ROCKET-SIZE 2))))

(test)
