#lang htdp/bsl

(define prefix "hello")
(define suffix "world")

(string=?
  (string-append prefix "_" suffix)
  "hello_world")
