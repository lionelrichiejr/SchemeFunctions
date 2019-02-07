(define (reverse-general L)
  (cond
   ((null? L) '())
   ((list? L) (append (reverse-general (cdr L)) (list (reverse-general (car L)))))
   (else L)
  )
)

(define (sum-up-numbers-simple L)
  (cond
   ((null? L) 0)
   ((number? (car L)) (+ (car L) (sum-up-numbers-simple(cdr L))))
   (else (sum-up-numbers-simple(cdr L))))
)