
module Main where

sumLess = \ 0, 0
          | 1, 1
          | n, n + (sumLess n-1)

a = (Cons 5 (Cons 3 (Nil)))

squared = \x, x * x

sum = \ (Cons x xs), x + (sum xs)
      | (Nil), 0
      
map = \ f (Cons x xs), (Cons (f x) (map f xs))
      | f (Nil), (Nil)

main = (sum (map squared a))

newTest = \(Pair a b), a + b

-- (Pair (sumLess 6) 5)  -- (newTest (Pair 5 17))
-- (Pair (sumLess 6) 5)
-- (sumLess 6)