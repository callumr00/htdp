#lang htdp/bsl

(require 2htdp/image)

(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(=  (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

(image-classify (rectangle 10 10 "solid" "black"))
; 1. (image-classify [img])
; 2. (cond
;     ((>= (image-height [img]) (image-width [img])) "tall")
;     ((=  (image-height [img]) (image-width [img])) "square")
;     ((<= (image-height [img]) (image-width [img])) "wide"))
; 3. (cond
;     ((>= 10 (image-width [img])) "tall")
;     ((=  (image-height [img]) (image-width [img])) "square")
;     ((<= (image-height [img]) (image-width [img])) "wide"))
; 4. (cond
;     ((>= 10 10) "tall")
;     ((=  (image-height [img]) (image-width [img])) "square")
;     ((<= (image-height [img]) (image-width [img])) "wide"))
; 5. (cond
;     (#true "tall")
;     ((=  (image-height [img]) (image-width [img])) "square")
;     ((<= (image-height [img]) (image-width [img])) "wide"))
; 6. "tall"
;
; Issue: Function returns "tall" when it should return "square".
; Fix: Change the condition from >= to >.
