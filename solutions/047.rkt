#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SCENE-WIDTH 10)
(define SCENE-HEIGHT 100)
(define SCENE
  (place-image
    (rectangle SCENE-WIDTH SCENE-HEIGHT "solid" "black")
    (/ SCENE-WIDTH 2)
    (/ SCENE-HEIGHT 2)
    (empty-scene SCENE-WIDTH SCENE-HEIGHT)))

(define (OBJECT y)
  (rectangle SCENE-WIDTH y "solid" "red"))

(define VELOCITY 0.1)

; WorldState -> WorldState
; Moves the image at each tick
(define (tock ws)
  (cond
    [(> ws SCENE-HEIGHT) (- SCENE-HEIGHT VELOCITY)]
    [(<= (- ws VELOCITY) 0) 0]
    [else (- ws VELOCITY)]))

(check-expect
  (tock (+ SCENE-HEIGHT (/ VELOCITY 2)))
  (- SCENE-HEIGHT VELOCITY))

(check-expect
  (tock SCENE-HEIGHT)
  (- SCENE-HEIGHT VELOCITY))

(check-expect
  (tock (* SCENE-HEIGHT 0.1))
  (- (* SCENE-HEIGHT 0.1) VELOCITY))

(check-expect
  (tock (+ 0 (/ VELOCITY 2)))
  0)

(check-expect
  (tock 0)
  0)

(check-expect
  (tock (- 0 (/ VELOCITY 2)))
  0)

; WorldState KeyEvent -> WorldState
; Makes changes based on key presses
(define (change ws ke)
  (cond
    [(key=? ke "up")
     (cond
       [(> (+ ws (* SCENE-HEIGHT 1/3)) SCENE-HEIGHT) SCENE-HEIGHT]
       [else (+ ws (* SCENE-HEIGHT 1/3))])]
    [(key=? ke "down")
     (cond
       [(> (+ ws (* SCENE-HEIGHT 1/5)) SCENE-HEIGHT) SCENE-HEIGHT]
       [else (+ ws (* SCENE-HEIGHT 1/5))])]
    [else ws]))

(check-expect
  (change (* SCENE-HEIGHT 0.9) "up")
  SCENE-HEIGHT)

(check-expect
  (change (* SCENE-HEIGHT 0.1) "up")
  (+ (* SCENE-HEIGHT 0.1) (* SCENE-HEIGHT 1/3)))

(check-expect
  (change (* SCENE-HEIGHT 0.9) "down")
  SCENE-HEIGHT)

(check-expect
  (change (* SCENE-HEIGHT 0.1) "down")
  (+ (* SCENE-HEIGHT 0.1) (* SCENE-HEIGHT 1/5)))

(check-expect
  (change (* SCENE-HEIGHT 0.5) "a")
  (* SCENE-HEIGHT 0.5))

; WorldState -> Image
; Places the image onto the background
(define (render ws)
  (cond
    [(> ws SCENE-HEIGHT)
     (place-image
      (OBJECT SCENE-HEIGHT)
      (/ SCENE-WIDTH 2)
      (- SCENE-HEIGHT (/ SCENE-HEIGHT 2))
      SCENE)]
    [else
     (place-image
      (OBJECT ws)
      (/ SCENE-WIDTH 2)
      (- SCENE-HEIGHT (/ ws 2))
      SCENE)]))

(check-expect
  (render 200)
  (render 100))

(define (main ws)
  (big-bang ws
            [on-tick tock]
            [on-key change]
            [to-draw render]))

(test)
(main SCENE-HEIGHT)
