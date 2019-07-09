(def try
     (fn (guess x)
         (if (good-enough guess x)
             guess
           (try (improve guess x) x))))

(def sqrt (fn (x) (try 1 x)))

(def improve
     (fn (guess x)
         (average guess (/ x guess))))

(def good-enough
     (fn (guess x)
         (< (abs (- (square guess) x))
            0.001)))

(def abs
     (fn (x)
         (if (< x 0)
             (- 0 x)
           x)))

(def square
     (fn (x)
         (* x x)))

(def average
     (fn (x y)
         (/ (+ x y) 2)))

(sqrt 64)
