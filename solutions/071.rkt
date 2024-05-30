#lang htdp/bsl

; distances in terms of pixels:
(define HEIGHT 200)
(define MIDDLE (quotient HEIGHT 2))
; 1. (define MIDDLE (quotient 200 2))
; 2. (define MIDDLE 100)

(define WIDTH 400)
(define CENTER (quotient WIDTH 2))
; 1. (define CENTER (quotient 400 2))
; 2. (define CENTER 200)

(define-struct game [left-player right-player ball])

(define game0
  (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))
; 1. (define game0
;      (make-game 100 MIDDLE (make-posn CENTER CENTER)))
; 2. (define game0
;      (make-game 100 100 (make-posn CENTER CENTER)))
; 3. (define game0
;      (make-game 100 100 (make-posn 200 CENTER)))
; 4. (define game0
;      (make-game 100 100 (make-posn 200 200)))

(game-ball game0)
; 1. (game-ball
;      (make-game
;        100
;        100
;        (make-posn 200 200)))
; 2. (make-posn 200 200)

(posn? (game-ball game0))
; 1. (posn?
;      (game-ball
;        (make-game
;          100
;          100
;          (make-posn 200 200)))
; 2. (posn? (make-posn 200 200))
; 3. #true

(game-left-player game0)
; 1. (game-left-player
;      (make-game
;        100
;        100
;        (make-posn 200 200)))
; 2. 100
