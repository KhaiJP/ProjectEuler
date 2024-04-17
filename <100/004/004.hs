main = print $ maximum palindromes


palindromes        = filter isPalindrome [x*y | x <- [100..999], y <- [100..999]]
isPalindrome       = areSameValueAt show reverseShow
reverseShow        = reverse . show
areSameValueAt f g = \x -> (==) (f x) (g x)
