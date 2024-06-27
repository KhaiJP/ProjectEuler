import Data.List ( permutations )


main :: IO ()
main = print . minimum . concatMap (map sum . findGoodChains) $ allListPermutations


-- For example, head of this list, [tri nums, sq nums, pen nums, hex nums, hep nums, oct nums]
-- corresponds to finding 6-number chains in order of [tri, sq, pen, hex, hep, oct].
allListPermutations :: [[[Int]]]
allListPermutations = permutations geoNumberLists


-- each l is tri nums or sq nums or ... or oct nums.
findGoodChains :: [[Int]] -> [[Int]]
findGoodChains [l1, l2, l3, l4, l5, l6] = do
            a1 <- l1
            a2 <- filter (isChain a1) l2
            a3 <- filter (isChain a2) l3
            a4 <- filter (isChain a3) l4
            a5 <- filter (isChain a4) l5
            a6 <- filter (`isChain` a1) . filter (isChain a5) $ l6
            return [a1, a2, a3, a4, a5, a6]


-- find if n and m makes chain required in the problem; last 2 digits of n corresponds to first 2 digits of m.
-- isChain 8128 2882 = True, isChain 2882 8281 = True, isChain 8128 8281 = False 
isChain :: Int -> Int -> Bool
isChain n m = n `mod` 100 == m `div` 100


-- [triangle numbers, square numbers, ... , octagonal numbers]
geoNumberLists :: [[Int]]
geoNumberLists = [takeWhile (<10000) . dropWhile (<1000) . map f $ [1..] | f <- geoProds]


geoProds :: [Int -> Int]
geoProds = [triangleProd, squareProd, pentagonalProd, hexagonalProd, heptagonalProd, octagonalProd]


triangleProd :: Int -> Int
triangleProd n = n * (n+1) `div` 2


squareProd :: Int -> Int
squareProd n = n * n


pentagonalProd :: Int -> Int
pentagonalProd n = n * (3*n - 1) `div` 2


hexagonalProd :: Int -> Int
hexagonalProd n = n * (2*n - 1)


heptagonalProd :: Int -> Int
heptagonalProd n = n * (5*n - 3) `div` 2


octagonalProd :: Int -> Int
octagonalProd n = n * (3*n - 2)
