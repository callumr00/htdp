#lang htdp/bsl

; A Color is one of:
; --- "white"
; --- "yellow"
; --- "orange"
; --- "green"
; --- "red"
; --- "blue"
; --- "black"
; example (define color "white")
; example (define color "orange")
; example (define color "blue")

; H is a Number between 0 and 100.
; interpretation represents a happiness value
; example (define H 50)
; example (define H 100)

(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)
; interpretation a person's first name, last name, and gender.
; example (make-person "Callum" "Rafter" #true)

(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; interpretation a dog's owner, name, age, and happiness level.
; example (make-dog (make-person "Callum" "Rafter" #true)
;                   "Cheqeurs" 3 100)
;
; A Weapon is one of:
; --- #false
; --- Posn
; interpretation #false means the missle hasn't been
; fired yet; a Posn means it is in flight.
; example #false
; example (make-posn 10 20)
; example (make-posn 50 13)
