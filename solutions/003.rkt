#lang htdp/bsl

(define str "helloworld")
(define i 5)

(string=?
  (string-append
     (substring str 0 i)
     "_"
     (substring str i (string-length str)))
   "hello_world")
