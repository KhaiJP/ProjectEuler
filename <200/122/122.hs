import qualified Data.Map.Strict as M
import qualified Data.Set as S
type Chain     = S.Set Int
type ChainPool = S.Set Chain
type ChainPoolMemo = M.Map Int ChainPool
type PQueue = S.Set (Int, Chain)


main :: IO ()
main = print . sum . map (pred . length . snd) $ representiveChains


representiveChains :: [(Int, [Int])]
representiveChains = M.toList . M.map (S.toList . S.elemAt 0) $ dijkstraLike initMemo initQueue


dijkstraLike :: ChainPoolMemo -> PQueue -> ChainPoolMemo
dijkstraLike memo q
    | S.null q = memo
    | num >= target = dijkstraLike memo popped
    | otherwise = dijkstraLike newMemo newQ
    where
        (num, chainS) = S.elemAt 0 q
        popped  = S.deleteAt 0 q
        chainL  = S.toList chainS
        biggest = maximum chainL
        queries = do
                    a <- chainL
                    b <- filter (\b -> let c = a+b in
                                    -- prune the search tree
                                    a <= b &&
                                    -- prune the search tree
                                    biggest < c &&
                                    -- otherwise no need to search
                                    c <= target &&
                                    -- if the chain = c:chainL is longer than what already found, then it will be discarded by updateQM  
                                    S.notMember (S.fromList (c : chainL)) (memo M.! c)
                                ) chainL
                    let c = a + b
                    let chainS = S.fromList $ c : chainL
                    return (c, chainS)
        -- update the chain memo and the priority queue
        (newMemo, newQ) = foldl updateMQ (memo, popped) queries


updateMQ :: (ChainPoolMemo, PQueue) -> (Int, Chain) -> (ChainPoolMemo, PQueue)
updateMQ (memo, q) (n, chainS)
    | ref  < size = (memo, q)        -- discard (n, set) which is inefficient than what is already found
    | size < ref  = (single, pushed) -- single : the pool is renewed to be S.singleton chainS
    | otherwise   = (multi,  pushed) -- multi  : chainS is added to the pool
    where
        ref    = S.size . S.elemAt 0 $ pool -- length of a chain that is already found 
        pool   = memo M.! n                 -- the pool of chains that are already found
        size   = S.size chainS              -- the size of chain that is newly found
        single = M.update (\_ -> Just . S.singleton $ chainS) n memo
        multi  = M.update (Just . S.insert chainS) n memo
        pushed = S.insert (n, chainS) q


initMemo :: ChainPoolMemo
initMemo = M.fromList $ (1, S.singleton . S.singleton $ 1) : [(n, makeInitPool n) | n <- [2..target]]
    where
        makeInitPool :: Int -> ChainPool
        makeInitPool 1 = S.singleton . S.singleton $ 1
        makeInitPool n = S.singleton . S.fromList $ [1..(n+1)] -- (n+1) ensures the chains never optimal


initQueue :: PQueue
initQueue = S.singleton (1, S.singleton 1)


target :: Int
target = 200
