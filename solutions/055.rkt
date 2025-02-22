#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define HEIGHT 300) ; distance in pixels
(define WIDTH 100)
(define YDELTA 3)
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define CENTER (/ (image-height ROCKET) 2))

; An LRCD (for launching rocket countdown) is one of:
; -- "resting"
; -- a Number between -3 and -1
; -- a NonnegativeNumber
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)

; LRCD -> Image
; renders the state as a resting or flying rocket

(check-expect
  (show "resting")
  (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))

(check-expect
  (show -2)
  (place-image (text "-2" 20 "red")
               10 (* 3/4 WIDTH)
               (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)))

(check-expect
  (show 53)
  (place-image ROCKET 10 (- 53 CENTER) BACKG))

(define (place-rocket x)
  (place-image ROCKET 10 (- x CENTER) BACKG))

(define (show x)
  (cond
    [(string? x)
     (place-rocket HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-rocket HEIGHT))]
    [(>= x 0)
     (place-rocket x)]))

; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed.
; if the rocket is still resting
(define (launch x ke)
  x)

; LRCD -> LRCD
; raises the rocket by YDELTA if it is moving already
(define (fly x)
  x)
