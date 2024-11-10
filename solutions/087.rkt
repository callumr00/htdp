#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(define SCENE-WIDTH 200)
(define SCENE-HEIGHT 20)
(define CURSOR (rectangle 1 SCENE-HEIGHT "solid" "red"))
(define FONT-SIZE 16)
(define FONT-COLOUR "black")

(define-struct editor [string index])
; An Editor is a structure:
; 	(make-editor String Number)
; interpretation (make-editor s i) describes an editor
; whose visible text is `s` with the cursor displayed
; at the `i`th character.

; Editor -> Image
; ; renders an editor's text.
(define (render-text editor)
  (beside (text (substring (editor-string editor) 0 (editor-index editor))
                FONT-SIZE FONT-COLOUR)
          CURSOR
          (text (substring (editor-string editor) (editor-index editor))
                FONT-SIZE FONT-COLOUR)))

; Editor -> Image
; places the editor's text onto a background.
(define (render editor)
  (overlay/align "left" "center"
                 (render-text editor)
                 (empty-scene SCENE-WIDTH SCENE-HEIGHT)))

(check-expect
 (render (make-editor "hello world" 5))
 (overlay/align "left" "center"
                (beside (text (substring "hello world" 0 5) FONT-SIZE FONT-COLOUR)
                        CURSOR
                        (text (substring "hello world" 5) FONT-SIZE FONT-COLOUR))
                (empty-scene SCENE-WIDTH SCENE-HEIGHT)))

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
      (substring string (sub1 (string-length string)))))

(check-expect (string-last "hello world") "d")
(check-expect (string-last "") "")

; String -> String
; returns the original string with the last character removed.
(define (string-remove-last string)
  (if (string=? string "")
      ""
      (substring string 0 (sub1 (string-length string)))))

(check-expect (string-remove-last "hello world") "hello worl")
(check-expect (string-remove-last "") "")

; Editor -> Editor
; changes the state of the editor based on the key event.
; - KeyEvents "\t" and "\r" are ignored
; - KeyEvent "\b" 
; - KeyEvent "left" decrements the editor's index, effectively moving
;   the cursor to the left
; - KeyEvent "right" increments the editor's index, effectively moving
;   the cursor to the right
; - All other KeyEvents with a length of 1 are inserted into the editor's
;   string at the editor's index
(define (edit ed ke)
  (cond
    [(or (string=? ke "\t") (string=? ke "\r")) ed]
    [(string=? ke "\b")
     (if (zero? (editor-index ed))
         ed
         (make-editor
          (string-append
           (substring (editor-string ed) 0 (sub1 (editor-index ed)))
           (substring (editor-string ed) (editor-index ed)))
          (sub1 (editor-index ed))))]
[(and
  (string=? ke "left")
  (not (zero? (editor-index ed))))
 (make-editor
  (editor-string ed)
  (sub1 (editor-index ed)))]
[(and
  (string=? ke "right")
  (not (= (editor-index ed) (string-length (editor-string ed)))))
 (make-editor
  (editor-string ed)
  (add1 (editor-index ed)))]
[(= (string-length ke) 1)
 (if
  (> (image-width (render-text
                   (make-editor
                    (string-append (editor-string ed) ke)
                    (add1 (editor-index ed)))))
     SCENE-WIDTH)
  ed
  (make-editor
   (string-append
    (substring (editor-string ed) 0 (editor-index ed))
    ke
    (substring (editor-string ed) (editor-index ed)))
   (add1 (editor-index ed))))]
[else ed]))

(check-expect
 (edit (make-editor "hello world" 6) "\t")
 (make-editor "hello world" 6))

(check-expect
 (edit (make-editor "hello world" 6) "\r")
 (make-editor "hello world" 6))

(check-expect
 (edit (make-editor "hello world" 6) "\b")
 (make-editor "helloworld" 5))

(check-expect
 (edit (make-editor "hello world" 0) "\b")
 (make-editor "hello world" 0))

(check-expect
 (edit (make-editor "hello world" 6) "left")
 (make-editor "hello world" 5))

(check-expect
 (edit (make-editor "hello world" 0) "left")
 (make-editor "hello world" 0))

(check-expect
 (edit (make-editor "hello world" 6) "right")
 (make-editor "hello world" 7))

(check-expect
 (edit (make-editor "hello world" 11) "right")
 (make-editor "hello world" 11))

(check-expect
 (edit (make-editor "hello world" 0) "down")
 (make-editor "hello world" 0))

(check-expect
 (edit (make-editor "hello world" 6) " ")
 (make-editor "hello  world" 7))

(check-expect
 (edit (make-editor "hello world" 6) "a")
 (make-editor "hello aworld" 7))

(check-expect
 (edit (make-editor "hello world" 6) "1")
 (make-editor "hello 1world" 7))

(check-expect
 (edit (make-editor "hello world" 6) "!")
 (make-editor "hello !world" 7))

(check-expect
 (edit (make-editor "hello world" 0) "!")
 (make-editor "!hello world" 1))

(check-expect
 (edit (make-editor "hello world" 11) "!")
 (make-editor "hello world!" 12))

(define (run string)
  (big-bang (make-editor string 0)
    [to-draw render]
    [on-key edit]))

(test)

(run "")
