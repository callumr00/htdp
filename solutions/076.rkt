#lang htdp/bsl

; A Movie is a structure:
;   (make-movie String String Number)
; interpretation a movie's title, producer, and year
; of release.
(define-struct movie [title producer year])

; A Person is a structure:
;   (make-person String String String Number)
; interpretation a person's name, hair colour, eye
; colour and phone number.
(define-struct person [name hair eyes phone])

; A Pet is a structure:
;   (make-pet String Number)
; interpretation a pet's name and identification number.
(define-struct pet [name number])

; A CD is a structure:
;   (make-CD String String Number)
; interpretation a CD's artist, title, and price.
(define-struct CD [artist title price])

; A Sweater is a structure:
;   (make-sweater String String String)
; interpretation a sweater's material, size and producer.
(define-struct sweater [material size producer])
