#lang htdp/bsl

(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))

(reward 18)
; 1. (cond
;      [(<= 0 18 10) "bronze"]
;      [(and (< 10 18) (<= 18 20)) "silver"]
;      [else "gold"]))
; 2. (cond
;      [#false "bronze"]
;      [(and (< 10 18) (<= 18 20)) "silver"]
;      [else "gold"]))
; 3. (cond
;      [(and (< 10 18) (<= 18 20)) "silver"]
;      [else "gold"]))
; 4. (cond
;      [(and #true (<= 18 20)) "silver"]
;      [else "gold"]))
; 5. (cond
;      [(and #true #true) "silver"]
;      [else "gold"]))
; 6. (cond
;      [#true "silver"]
;      [else "gold"]))
; 7. "silver"
