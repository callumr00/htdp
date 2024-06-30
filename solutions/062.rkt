#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define LOCKED "locked") ; A DoorState is one of:
(define CLOSED "closed") ; -- LOCKED
(define OPEN "open")     ; -- CLOSED
                         ; -- OPEN

; DoorState -> DoorState
; closes an open door over the period of one tick
(define (door-closer state-of-door)
  (cond
    [(string=? LOCKED state-of-door) LOCKED]
    [(string=? CLOSED state-of-door) CLOSED]
    [(string=? OPEN state-of-door) CLOSED]))

(check-expect (door-closer LOCKED) LOCKED)
(check-expect (door-closer CLOSED) CLOSED)
(check-expect (door-closer OPEN) CLOSED)

; DoorState KeyEvent -> DoorState
; turns key event k into an action on state s
(define (door-action s k)
  (cond
    [(and (string=? LOCKED s) (string=? "u" k)) CLOSED]
    [(and (string=? CLOSED s) (string=? "l" k)) LOCKED]
    [(and (string=? CLOSED s) (string=? " " k)) OPEN]
    [else s]))

(check-expect (door-action LOCKED "u") CLOSED)
(check-expect (door-action CLOSED "l") LOCKED)
(check-expect (door-action CLOSED " ") OPEN)
(check-expect (door-action OPEN "a") OPEN)
(check-expect (door-action CLOSED "a") CLOSED)

; DoorState -> Image
; translates the state s into a large text image
(define (door-render s)
  (text s 40 "red"))

(check-expect (door-render CLOSED) (text CLOSED 40 "red"))

; DoorState -> DoorState
; simulates a door with an automatic closer
(define (door-simulation initial-state)
  (big-bang initial-state
            [on-tick door-closer 3]
            [on-key door-action]
            [to-draw door-render]))

(test)

(door-simulation LOCKED)