#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SCENE-WIDTH 200)

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editors String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with
; the cursor displayed between s and t


; Editor -> Image
; renders an editor's text.
(define (render-text editor)
  (beside (text (editor-pre editor) 16 "black")
          (rectangle 1 20 "solid" "red")
          (text (editor-post editor) 16 "black")))

; Editor -> Image
; places the editor's text onto a background.
(define (render editor)
  (overlay/align "left" "center"
                 (render-text editor)
                 (empty-scene SCENE-WIDTH 20)))

(check-expect
 (render (make-editor "hello " "world"))
  (overlay/align "left" "center"
                 (beside (text "hello " 16 "black")
                         (rectangle 1 20 "solid" "red")
                         (text "world" 16 "black"))
                 (empty-scene SCENE-WIDTH 20)))

; String -> String
; returns the original string's first character.
(define (string-first string)
  (if (string=? string "")
      ""
      (substring string 0 1)))

(check-expect (string-first "hello world") "h")
(check-expect (string-first "") "")

; String -> String
; returns the original string with the first character removed.
(define (string-rest string)
  (if (string=? string "")
      ""
      (substring string 1)))

(check-expect (string-rest "hello world") "ello world")
(check-expect (string-rest "") "")

; String -> String
; returns the original string's last character.
(define (string-last string)
  (if (string=? string "")
      ""
      (substring string (- (string-length string) 1))))

(check-expect (string-last "hello world") "d")
(check-expect (string-last "") "")

; String -> String
; returns the original string with the last character removed.
(define (string-remove-last string)
  (if (string=? string "")
      ""
      (substring string 0 (- (string-length string) 1))))

(check-expect (string-remove-last "hello world") "hello worl")
(check-expect (string-remove-last "") "")

; Editor -> Editor
; changes the state of the editor based on the key event.
; - KeyEvents "\t" and "\r" are ignored
; - KeyEvent "\b" removes the last character from the editor's pre
; - KeyEvent "left" moves the last character of the editor's pre to the
;   start of the editor's post, effectively moving the cursor to the left
; - KeyEvent "right" moves the first character of the editor's post to the
;   end of the editor's pre, effectively moving the cursor to the right
; - All other KeyEvents with a length of 1 are appended to the editor's pre
;   as long as they can be rendered within the scene
; - All other KeyEvents are ignored
(define (edit ed ke)
  (cond

    [(or (string=? ke "\t") (string=? ke "\r")) ed]
    [(string=? ke "\b")
     (make-editor
      (string-remove-last (editor-pre ed))
      (editor-post ed))]
    [(and
      (string=? ke "left")
      (not (string=? (editor-pre ed) "")))
     (make-editor
      (string-remove-last (editor-pre ed))
      (string-append (string-last (editor-pre ed)) (editor-post ed)))]
    [(and
      (string=? ke "right")
      (not (string=? (editor-post ed) "")))
     (make-editor
      (string-append (editor-pre ed) (string-first (editor-post ed)))
      (string-rest (editor-post ed)))]
    [(= (string-length ke) 1)
     (if
      (> (image-width
          (render-text
           (make-editor
            (string-append (editor-pre ed) ke)
            (editor-post ed))))
           SCENE-WIDTH)
      ed
      (make-editor
       (string-append (editor-pre ed) ke)
       (editor-post ed)))]
    [else ed]))

(check-expect
 (edit (make-editor "hello " "world") "\t")
 (make-editor "hello " "world"))

(check-expect
 (edit (make-editor "hello " "world") "\r")
 (make-editor "hello " "world"))

(check-expect
 (edit (make-editor "hello " "world") "\b")
 (make-editor "hello" "world"))

(check-expect
 (edit (make-editor "" "hello world") "\b")
 (make-editor "" "hello world"))

(check-expect
 (edit (make-editor "hello " "world") "left")
 (make-editor "hello" " world"))

(check-expect
 (edit (make-editor "" "hello world") "left")
 (make-editor "" "hello world"))

(check-expect
 (edit (make-editor "hello " "world") "right")
 (make-editor "hello w" "orld"))

(check-expect
 (edit (make-editor "hello world" "") "right")
 (make-editor "hello world" ""))

(check-expect
 (edit (make-editor "hello world" "") "down")
 (make-editor "hello world" ""))

(check-expect
 (edit (make-editor "hello " "world") " ")
 (make-editor "hello  " "world"))

(check-expect
 (edit (make-editor "hello " "world") "a")
 (make-editor "hello a" "world"))

(check-expect
 (edit (make-editor "hello " "world") "1")
 (make-editor "hello 1" "world"))

(check-expect
 (edit (make-editor "hello " "world") "!")
 (make-editor "hello !" "world"))

(check-expect
 (edit (make-editor "" "hello world") "!")
 (make-editor "!" "hello world"))

(check-expect
 (edit (make-editor "hello world" "") "!")
 (make-editor "hello world!" ""))

(define (run pre)
  (big-bang (make-editor pre "")
    [to-draw render]
    [on-key edit]))

(test)

(run "")
