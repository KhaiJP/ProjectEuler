main = print $ sum' l

l = [1..999]
sum' :: []Int -> Int
sum' [] = 0
sum' (x:xs)
  |  mod x 3 == 0 || mod x 5 == 0 = x + sum' xs
  |  otherwise = sum' xs
