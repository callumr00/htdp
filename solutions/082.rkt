#lang htdp/bsl

(require test-engine/racket-tests)

; A Letter is one of:
; --- "a" through "z"
; --- #false
; interpretation a lowercase letter or boolean false.

; A Word is a structure:
;   (make-word Letter Letter Letter)
; interpretation a 3 letter word.
(define-struct word [first second third])

(check-expect (word-first (make-word "c" "a" "t")) "c")


; Word Word -> Word
; produces a word that indicates where the given ones agree and disagree.
(define (compare-word word1 word2)
  (make-word (if
                (eq? (word-first word1) (word-first word2))
                (word-first word1)
                #false)
             (if
                (eq? (word-second word1) (word-second word2))
                (word-second word1)
                #false)
             (if
                (eq? (word-third word1) (word-third word2))
                (word-third word1)
                #false)))

(check-expect (compare-word
               (make-word "c" "a" "t")
               (make-word "c" "a" "r"))
              (make-word "c" "a" #false))

(test)