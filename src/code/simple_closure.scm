(define (adder term)
  (lambda (x) (+ x term)))
(define increment (adder 1))
(define six (increment 5))