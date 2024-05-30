#lang htdp/bsl

(require test-engine/racket-tests)

(define-struct movie [title producer year])
(define a-movie (make-movie "Robot Dreams" "Pablo Berger" 2024))
(check-expect (movie-title a-movie) "Robot Dreams")
(check-expect (movie-producer a-movie) "Pablo Berger")
(check-expect (movie-year a-movie) 2024)
(check-expect (movie? a-movie) #true)

(define-struct person [name hair eyes phone])
(define a-person (make-person "Callum" "brown" "brown" 0))
(check-expect (person-name a-person) "Callum")
(check-expect (person-hair a-person) "brown")
(check-expect (person-eyes a-person) "brown")
(check-expect (person-phone a-person) 0)
(check-expect (person? a-person) #true)

(define-struct pet [name number])
(define a-pet (make-pet "Bonky" 1))
(check-expect (pet-name a-pet) "Bonky")
(check-expect (pet-number a-pet) 1)
(check-expect (pet? a-pet) #true)

(define-struct CD [artist title price])
(define a-CD (make-CD "Kaytranada" "99.9%" 10))
(check-expect (CD-artist a-CD) "Kaytranada")
(check-expect (CD-title a-CD) "99.9%")
(check-expect (CD-price a-CD) 10)
(check-expect (CD? a-CD) #true)

(define-struct sweater [material size producer])
(define a-sweater (make-sweater "cashmere" "medium" "Asket"))
(check-expect (sweater-material a-sweater) "cashmere")
(check-expect (sweater-size a-sweater) "medium")
(check-expect (sweater-producer a-sweater) "Asket")
(check-expect (sweater? a-sweater) #true)

(test)
