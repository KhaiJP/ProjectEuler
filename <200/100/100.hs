type Pell = (Int, Int)


main :: IO ()
main = print . reproduce . snd . head . filter isOK $ pellSolutions


-- each element is a solution of Pell's equation; x^2 - Dy^2 = -1
pellSolutions :: [Pell]
pellSolutions = scanl nextSolution solutionPell2 [seed | _ <- [1..]]


-- make another solution candidate of Pell's equation
nextSolution :: Pell -> Pell -> Pell
nextSolution (x1, y1) (x2, y2) = (x', y')
    where
        x' = x1*x2 + 2*y1*y2
        y' = x1*y2 + x2*y1


-- check if the candidate is really a solution, and num of total disks exceeds target=10^12
isOK :: Pell -> Bool
isOK = exceedsTarget target


-- check if the num of total disks exceeds target=10^12
exceedsTarget :: Int -> Pell -> Bool
exceedsTarget thresh (x, y)
    | even x || even y = False
    | otherwise        = reproduce x > thresh


----------------------- supplemental -----------------------
solutionPell2 :: Pell
solutionPell2 = (1, 1)


seed :: Pell
seed = (3, 2)


reproduce :: Int -> Int
reproduce x = (x+1) `div` 2


target :: Int
target = 10^12
