#lang htdp/bsl

(require 2htdp/batch-io)

(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))

(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append
    "We have discovered that all people with the" "\n"
    "last name " lst " have won our lottery. So, " "\n"
    fst ", " "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
    "Sincerely,"
    "\n\n"
    signature-name
    "\n"))

(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

; Tests.
(letter "1" "2" "3")
(letter "4" "5" "6")
(letter "7" "8" "9")

(write-file "in-fst" "Matthias")
(write-file "in-lst" "Fisler")
(write-file "in-signature" "Felleisen")
(main "in-fst" "in-lst" "in-signature" "out")

(string=?
  (read-file "out")
  (string-append
    "Dear Matthias,"
    "\n\n"
    "We have discovered that all people with the"
    "\n"
    "last name Fisler have won our lottery. So, "
    "\n"
    "Matthias, hurry and pick up your prize."
    "\n\n"
    "Sincerely,"
    "\n\n"
    "Felleisen"))
