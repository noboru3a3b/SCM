;;
;;      primesq.lisp
;;
;; USAGE: sbcl --script primesq.lisp

;; queue
(setf *print-circle* t)

(defun make-queue ()
  (let ((queue (cons nil nil)))
    (setf (car queue) queue)
    queue))

(defun en-queue (queue x)
  (let ((q (cons x nil)))
    (setf (cdar queue) q)
    (setf (car queue) q)
    queue))

(defun de-queue (queue)
  (let* ((lst (cdr queue))
         (val (car lst))
         (rest (cdr lst)))
    (setf (cdr queue) rest)
    (if (null rest) (setf (car queue) queue))
    val))

(defun get-list (queue) (cdr queue))

;; primes
(defun is-prime (p-list x)
  (if (null p-list) t
      (let ((p (car p-list)))
        (cond ((> (* p p) x) t)
              ((= 0 (mod x p)) nil)
              (t (is-prime (cdr p-list) x))))))

(defun primes (queue x max)
  (cond ((> x max)
         (cons 2 (get-list queue)))
        ((is-prime (get-list queue) x)
         (primes (en-queue queue x) (+ x 2) max))
        (t (primes queue (+ x 2) max))))

;; main
;(primes (make-queue) 3 100000000)
(princ (length (primes (make-queue) 3 1000000000)))
