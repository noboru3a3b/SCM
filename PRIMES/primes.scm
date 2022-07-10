;;;    primes

;; queue
(define (make-queue x)
  (let ((seed (cons x '())))
    (cons seed seed)))

(define (en-queue! queue x)
  (let ((q (cons x '())))
    (set-cdr! (cdr queue) q)
    (set-cdr! queue q)
    queue))

(define (de-queue! queue)
  (let* ((head (car queue))
         (lst (cdar queue))
         (val (car lst))
         (rest (cdr lst)))
    (set-cdr! head rest)
    (if (null? rest) (set-cdr! queue head))
    val))

(define (get-queue-lst queue) (cdar queue))

(define (get-all-lst queue) (car queue))

;; primes
(define (is-prime p-lst x)
  (if (null? p-lst) #t
      (let ((p (car p-lst)))
	(cond ((> (* p p) x) #t)
	      ((= 0 (modulo x p)) #f)
	      (else (is-prime (cdr p-lst) x))))))

(define (primes queue x xmax)
  (cond ((> x xmax)
	  (get-all-lst queue))
	((is-prime (get-queue-lst queue) x)
	  (primes (en-queue! queue x) (+ x 2) xmax))
	(else
	  (primes queue (+ x 2) xmax))))

;; main
(primes (make-queue 2) 3 10000000)
;(display (primes (make-queue 2) 3 1000000))
