#lang htdp/bsl

(define-struct movie [title producer year])
(define a-movie (make-movie "Robot Dreams" "Pablo Berger" 2024))
#|
                                  ,-------,
                                  | movie |
,----------------,----------------|-------|
| title          | producer       | year  |
|----------------|----------------|-------|
| "Robot Dreams" | "Pablo Berger" | 2024  |
`----------------`----------------`-------`
|#

(define-struct person [name hair eyes phone])
(define a-person (make-person "Callum" "brown" "brown" 0))
#|
                               ,--------,
                               | person |
,----------,---------,---------|--------|
| name     | hair    | eyes    | phone  |
|----------|---------|---------|--------|
| "Callum" | "brown" | "brown" | 0      |
`----------`---------`---------`--------`
|#

(define-struct pet [name number])
(define a-pet (make-pet "Bonky" 1))
#|
          ,---------,
          | pet     |
,---------|---------|
| name    | number  |
|---------|---------|
| "Bonky" | 1       |
`---------`---------`
|#

(define-struct CD [artist title price])
(define a-CD (make-CD "Kaytranada" "99.9%" 10))
#|
                         ,-------,
                         | CD    |
,--------------,---------|-------|
| artist       | title   | price |
|--------------|---------|-------|
| "Kaytranada" | "99.9%" | 10    |
`--------------`---------`-------`
|#

(define-struct sweater [material size producer])
(define a-sweater (make-sweater "cashmere" "medium" "Asket"))
#|
                        ,----------,
                        | sweater  |
,------------,------- --|----------|
| material   | size     | producer |
|------------|----------|----------|
| "cashmere" | "medium" | "Asket"  |
`------------`----------`----------`
|#
