#lang htdp/bsl

; ===> is used instead of ==> because ==> produces an error:
;   ==>: this name was defined in the language or a required library and
;   cannot be re-defined

(define (===> sunny friday)
  (if
    (and
      (boolean? sunny)
      (boolean? friday))
    (or (not sunny) friday)
    #false))

; Tests.
(and
  (===> #true #true)
  (===> #false #true)
  (===> #false #false)
  (not (===> #true #false))
  (not(===> "sunny" "friday")))
