main = print $ answer

-- functions
reverseShow    = reverse . show
isPalindrome n = (show n) == (reverseShow n)


palindromes = [x*y | x <- [100..999], y <- [100..999], isPalindrome $ x*y]
answer = maximum palindromes
