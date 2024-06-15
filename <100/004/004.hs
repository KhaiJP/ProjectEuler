main :: IO ()
main = print $ maximum palindromes


palindromes :: [Int]
palindromes = filter isPalindrome [x*y | x <- [100..999], y <- [100..999]]


isPalindrome :: (Integral int, Show int) => int -> Bool
isPalindrome = areSameValueAt show reverseShow


reverseShow :: Show a => a -> String
reverseShow = reverse . show


areSameValueAt :: Eq a => (t -> a) -> (t -> a) -> t -> Bool
areSameValueAt f g x = f x == g x
