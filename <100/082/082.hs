import qualified Data.Vector as V
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Text.Regex ( mkRegex, splitRegex )
import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
type Node = (Int, Int)
type Weight = Int
type Distance = Int
type WeightMap = M.Map (Node, Node) Weight
type DistMap = M.Map Node Distance
type PQueue = S.Set (Distance, Node)
type Visited = S.Set Node


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let table = V.fromList . map (V.fromList . map read . splitComma) . words $ contents
    let wmap = M.fromList $ map ( \(rc, (r, c)) -> ((rc, (r, c)), table V.! (r-1) V.! (c-1)) ) adjointPairs
    let resultMap = dijkstra wmap (0, 0)
    let answer = minimum . map snd . filter (\((_, c), _) -> c == size') . M.toList $ resultMap
    print answer
    hClose handle


adjointPairs :: [(Node, Node)]
adjointPairs = l0 ++ l1
    where
        l1  = filter (\(_, (r, c)) -> 1<=r && r<=size' && c<=size') . concat $ l1'
        l1' = [[((r, c), (r+1, c)), ((r, c), (r-1, c)), ((r, c), (r, c+1))] | r <- [1..size'], c <- [1..size']]
        l0  = [((0, 0), (r, 1)) | r <- [1..size']]
        

dijkstra :: WeightMap -> Node -> DistMap
dijkstra wmap s = dijkstra' wmap q visited dmap
    where
        q       = S.singleton (0, s)
        visited = S.empty
        dmap    = M.fromList $ (s, 0) : [((r, c), 10^9) | r <- [1..size'], c <- [1..size']]


dijkstra' :: WeightMap -> PQueue -> Visited -> DistMap -> DistMap
dijkstra' wmap q visited dmap
    | null q                  = dmap
    | S.member (r, c) visited = dijkstra' wmap q'' visited dmap
    | otherwise               = dijkstra' wmap q' visited' dmap'
    where
        Just top    = S.lookupGE (-1, (0, 0)) q
        (d, (r, c)) = top
        q''         = S.delete top q
        (q', dmap') = update' q'' dmap (r, c) nexts
        visited'    = S.insert (r, c) visited
        nexts       = makeNexts (r, c) wmap


makeNexts :: Node -> WeightMap -> [(Weight, Node)]
makeNexts rc wmap = map formatter . filter isMember $ l
    where
        formatter rc' = (wmap M.! (rc, rc'),  rc')
        isMember  rc' = M.member (rc, rc') wmap
        l = if rc == (0, 0)
            then [(r, 1) | r <- [1..size']]
            else [(r-1, c), (r+1, c), (r, c+1)]
        (r, c) = rc


update' :: PQueue -> DistMap -> Node -> [(Weight, Node)] -> (PQueue, DistMap)
update' q dmap rc wrcs' = (q', dmap')
    where
        (q', dmap') = foldl update'' (q, dmap) wrcs'
        update'' :: (PQueue, DistMap) -> (Weight, Node) -> (PQueue, DistMap)
        update'' (q_, dmap_) (w', rc')
            | doUpdates = (q_', dmap_')
            | otherwise = (q_, dmap_)
            where
                doUpdates = d + w' < dmap M.! rc'
                q_'    = S.insert (d+w', rc') q_
                dmap_' = M.insert rc' (d+w') dmap_
                d      = dmap M.! rc


----------------------- supplimental -----------------------
splitComma :: String -> [String]
splitComma = splitRegex (mkRegex ",")
filename :: String
filename = "082.txt"
size' :: Int
size' = 80
