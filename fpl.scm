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

(define (sum-up-numbers-general L)
  (cond
   ((null? L) 0)
   ((list? (car L)) (+ (sum-up-numbers-general (car L)) (sum-up-numbers-general (cdr L))))
   ((number? (car L)) (+ (car L) (sum-up-numbers-general(cdr L))))
   (else (sum-up-numbers-general(cdr L)))
  )
)

(define (listMin L)
  (cond
   ((null? L) 99999999999999999)
   ((number? (car L)) ( min (car L) (listMin(cdr L))))
   (else (listMin (cdr L)))
  )
)

(define (hasNumbers L)
  (cond
   ((null? L) #F)
   ((number? (car L)) #T)
   (else (hasNumbers (cdr L)))
  )
)

(define (numsAboveMin L minOfList)
  (cond
    ((null? L) '())
    ((and (number? (car L)) (> (car L) minOfList))
     (cons (car L) (numsAboveMin (cdr L) minOfList)))
    (else (numsAboveMin (cdr L) minOfList))
  )
)

(define (min-above-min L1 L2)
  (define higherNums (numsAboveMin L1 (listMin L2)))
  (cond
   ((not (or (hasNumbers L2) (hasNumbers L1))) #F)
   ((not (hasNumbers L1)) #F)
   ((not (hasNumbers L2)) (listMin L1))
   ((eq? higherNums '()) #F)
   (else (listMin higherNums))
    )
  )