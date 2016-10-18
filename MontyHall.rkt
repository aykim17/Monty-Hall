#lang racket

(struct win-count (stay switch))

(define (random-door)
  (random 3))

(define door-list '(0 1 0)) ; Can be changed to different variation

(define (run iterations w-count counter)
  (cond
    [(= iterations counter) (win-count-switch w-count)]
    [(= 1 (list-ref door-list (random-door)))
     (run iterations (win-count
                      (add1 (win-count-stay w-count))
                      (win-count-switch w-count))
          (add1 counter))]
    [else (run iterations (win-count
                           (win-count-stay w-count)
                           (add1 (win-count-switch w-count)))
               (add1 counter))]))

(define (monty iterations)
  (run iterations (win-count 0 0) 0))