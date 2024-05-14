#lang htdp/bsl

(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))

(string-insert "helloworld" 6)
; 1. (string-append
;     (substring "helloworld" 0 6)
;     "_"
;     (substring "helloworld" 6))
; 2. (string-append
;     "hellow"
;     "_"
;     (substing "helloworld" 6))
; 3. (string-append "hellow" "_" "orld")
; 4. "hellow_orld"
