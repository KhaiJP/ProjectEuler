type Pell = (Int, Int)


main :: IO ()
main = print . reproduce . snd . head . filter isOK $ pellCandidates


-- the Pell's equation having form x^2 - Dy^2 = -1, unlinke = +1,
-- not all the updates are truly the solutions
pellCandidates :: [Pell]
pellCandidates = scanl update answerPell2 [answerPell2 | _ <- [1..]]


-- make another solution candidate of Pell's equation
update :: Pell -> Pell -> Pell
update (x1, y1) (x2, y2) = (x', y')
    where
        x' = x1*x2 + 2*y1*y2
        y' = x1*y2 + x2*y1


-- check if the candidate is really a solution, and num of total disks exceeds target=10^12
isOK :: Pell -> Bool
isOK pell = isPellSolution pell && exceedsTarget target pell


-- check if the arg is really a solution of Pell's equation
isPellSolution :: Pell -> Bool
isPellSolution (x, y) = x^2 - 2*y^2 == -1


-- check if the num of total disks exceeds target=10^12
exceedsTarget :: Int -> Pell -> Bool
exceedsTarget thresh (x, y)
    | even x || even y = False
    | otherwise        = reproduce x > thresh


----------------------- supplemental -----------------------
answerPell2 :: Pell
answerPell2 = (1, 1)


reproduce :: Int -> Int
reproduce x = (x+1) `div` 2


target :: Int
target = 10^12
