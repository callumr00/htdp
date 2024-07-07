#lang htdp/bsl

(require 2htdp/image)
(require test-engine/racket-tests)

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editors String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with
; the cursor displayed between s and t

; Editor -> Image
; Renders the state of the given Editor.
(define (render editor)
  (overlay/align "left" "center"
                 (beside (text (editor-pre editor) 16 "black")
                         (rectangle 1 20 "solid" "red")
                         (text (editor-post editor) 16 "black"))
                 (empty-scene 200 20)))

(check-expect
 (render (make-editor "hello " "world"))
  (overlay/align "left" "center"
                 (beside (text "hello " 16 "black")
                         (rectangle 1 20 "solid" "red")
                         (text "world" 16 "black"))
                 (empty-scene 200 20)))

(test)