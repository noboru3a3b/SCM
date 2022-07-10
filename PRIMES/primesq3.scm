;;;    primesq3 for Racket

#lang racket

;; new queue
(define (make-queue)
  (let ((queue (mcons '() '())))
    (set-mcar! queue queue)
    queue))

(define (en-queue! queue x)
  (let ((q (mcons x '())))
    (set-mcdr! (mcar queue) q)
    (set-mcar! queue q)
    queue))

(define (de-queue! queue)
  (let* ((lst (mcdr queue))
         (val (mcar lst))
         (rest (mcdr lst)))
    (set-mcdr! queue rest)
    (if (null? rest)
	(set-mcar! queue queue)
	#f)
    val))

(define (get-list queue) (mcdr queue))

;; primes
(define (is-prime p-lst x)
  (if (null? p-lst) #t
      (let ((p (mcar p-lst)))
	(cond ((> (* p p) x) #t)
	      ((= 0 (modulo x p)) #f)
	      (else (is-prime (mcdr p-lst) x))))))

(define (primes queue x xmax)
  (cond ((> x xmax)
	 (get-list queue))
	((is-prime (get-list queue) x)
	 (primes (en-queue! queue x) (+ x 2) xmax))
	(else
	 (primes queue (+ x 2) xmax))))

;; main
(let ((result (mcons 2 (primes (make-queue) 3 100000000))))
  'END)
;(display (mcons 2 (primes (make-queue) 3 100000000)))
