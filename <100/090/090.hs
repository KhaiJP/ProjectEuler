import qualified Data.Set as S ( Set, insert, empty, fromList, toList, member, size, filter )
type Dice = String


main :: IO ()
main = print . S.size . S.filter isGoodPair $ dices


isGoodPair :: (Dice, Dice) -> Bool
isGoodPair ds = condition1 && condition2
    where
        allResults = makeAllResults ds
        condition1 = all (`S.member` allResults) squares1
        condition2 = all (\(a,b) -> a `S.member` allResults || b `S.member` allResults) squares2


makeAllResults :: (Dice, Dice) -> S.Set String
makeAllResults (d1, d2) = S.fromList . concat $ [[[c1, c2], [c2, c1]] | c1 <- d1, c2 <- d2]



----------------------- supplemental -----------------------
dices :: S.Set (Dice, Dice)
dices = foldr insert' S.empty $ [(d1, d2) | d1 <- combinations 6 digits, d2 <- combinations 6 digits]


insert' :: (Dice, Dice) -> S.Set (Dice, Dice) -> S.Set (Dice, Dice)
insert' (a, b) = S.insert (a', b')
    where (a', b') = (min a b, max a b)


squares1 :: [String]
squares1 = ["01", "04", "25", "81"]


squares2 :: [(String, String)]
squares2 = [("09","06"), ("16","19"), ("36","39"), ("49","46"), ("64","94")]


digits :: String
digits = ['0'..'9']


combinations :: Int -> [a] -> [[a]]
combinations n xs = comb n (length xs) xs
    where
        comb 0 _ _ = [[]]
        comb r n a@(x:xs)
            | n == r    = [a]
            | otherwise = map (x:) (comb (r - 1) (n - 1) xs) ++ comb r (n - 1) xs
