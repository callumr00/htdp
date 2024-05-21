#lang htdp/bsl

(require 2htdp/image)

(define (func y) (- 200 (cond [(> y 200) 0] [else y])))

(func 100)
; 1. (- 200 (cond [(> 100 200) 0] [else 100]))
; 2. (- 200 (cond [#false 0] [else 100]))
; 3. (- 200 (cond [else 100]))
; 4. (- 200 100)
; 5. 100

(func 210)
; 1. (- 200 (cond [(> 210 200) 0] [else 210]))
; 2. (- 200 (cond [#true 0] [else 210]))
; 3. (- 200 0)
; 4. 200

(define WIDTH 100)
(define HEIGHT 60)
(define MTSCN (empty-scene WIDTH HEIGHT))

(define ROCKET (rectangle 10 10 "solid" "red"))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

(define (create-rocket-scene.v5 h)
  (place-image
    ROCKET
    50
    (cond
      [(<= h ROCKET-CENTER-TO-TOP) h]
      [(> h ROCKET-CENTER-TO-TOP) ROCKET-CENTER-TO-TOP])
    MTSCN))
