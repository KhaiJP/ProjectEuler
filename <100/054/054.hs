import qualified Data.Map.Strict as M
import System.IO ( hGetContents, openFile, IOMode(ReadMode), hClose )
import Text.Regex ( mkRegex, splitRegex )
import Data.List ( sort, group, sort, sortBy )
import Data.List.Unique ( uniq )
import Data.Bifunctor ( bimap )
type Hand = [(Int, Char)]
type Rank = (Int, [Int])


main :: IO ()
main = do
    handle <- openFile filename ReadMode
    contents <- hGetContents handle
    let allBattles = splitLn contents
    let allCards   = map splitCards allBattles
    let allHands   = map (bimap toHand toHand) allCards
    let answer     = length . filter player1Wins $ allHands
    print answer
    hClose handle


player1Wins :: (Hand, Hand) -> Bool
player1Wins hands = res1 > res2
    where (res1, res2) = bimap checkHand checkHand hands 


toHand :: [String] -> Hand
toHand = sort . map translate


translate :: String -> (Int, Char)
translate s = (memo M.! head s, last s)


splitCards :: String -> ([String], [String])
splitCards txt = (p1, p2)
    where
        cards = words txt
        p1 = take 5 cards
        p2 = drop 5 cards


checkHand :: Hand -> Rank
checkHand hand
    | fst royalSF       = (10, snd royalSF)
    | fst straightFlush = (9,  snd straightFlush)
    | fst fourOfKind    = (8,  snd fourOfKind)
    | fst fullHouse     = (7,  snd fullHouse)
    | fst flush         = (6,  snd flush)
    | fst straight      = (5,  snd straight)
    | fst threeOfKind   = (4,  snd threeOfKind)
    | fst twoPairs      = (3,  snd twoPairs)
    | fst onePair       = (2,  snd onePair)
    | otherwise         = (1,  snd highCard)
    where
        royalSF       = checkRoyalSF hand
        straightFlush = checkSF hand
        fourOfKind    = checkFourKind hand
        fullHouse     = checkFullHouse hand
        flush         = checkFlush hand
        straight      = checkStraight hand
        threeOfKind   = checkThreeKind hand
        twoPairs      = checkTwoPairs hand
        onePair       = checkOnePair hand
        highCard      = sorryHighCard hand


checkRoyalSF :: Hand -> (Bool, [Int])
checkRoyalSF hand = (checkroyal, reverse nums)
    where
        checkroyal = length (uniq suits) == 1 && nums == [10, 11, 12, 13, 14]
        nums       = map fst hand
        suits      = map snd hand


checkSF :: Hand -> (Bool, [Int])
checkSF hand = (checksf, reverse nums)
    where
        checksf = length (uniq suits) == 1 && isSerial nums
        nums    = map fst hand
        suits   = map snd hand


checkFourKind :: Hand -> (Bool, [Int])
checkFourKind hand = (checkfk, last nums)
    where
        checkfk = grps == [1, 4]
        grps    = map length nums
        nums    = sortBy (\a b -> length a `compare` length b) . group . map fst $ hand


checkFullHouse :: Hand -> (Bool, [Int])
checkFullHouse hand = (checkfh, reverse nums)
    where
        checkfh = grps == [2, 3]
        grps    = sort . map length . group $ nums
        nums    = map fst hand


checkFlush :: Hand -> (Bool, [Int])
checkFlush hand = (checkfl, reverse . map fst $ hand)
    where
        checkfl = (length . group $ suits) == 1
        suits   = sort . map snd $ hand


checkStraight :: Hand -> (Bool, [Int])
checkStraight hand = (checkst, reverse nums)
    where
        checkst = isSerial nums
        nums    = map fst hand


checkThreeKind :: Hand -> (Bool, [Int])
checkThreeKind hand = (checktk, last nums)
    where
        checktk = gpls == [1, 1, 3]
        gpls    = map length nums
        nums    = sortByLength . group . map fst $ hand


checkTwoPairs :: Hand -> (Bool, [Int])
checkTwoPairs hand = (checktp, last nums)
    where
        checktp = gpls == [1, 2, 2]
        gpls    = map length nums
        nums    = sortByLength . group . map fst $ hand


checkOnePair :: Hand -> (Bool, [Int])
checkOnePair hand = (checkoh, last nums)
    where
        checkoh = gpls == [1, 1, 1, 2]
        gpls    = map length nums
        nums    = sortByLength . group . map fst $ hand


sorryHighCard :: Hand -> (Bool, [Int])
sorryHighCard hand = (True, reverse . map fst $ hand)



----------------------- supplemental -----------------------
memo :: M.Map Char Int
memo = M.fromList [('2', 2), ('3', 3), ('4', 4),  ('5', 5),  ('6', 6),  ('7', 7),
                   ('8', 8), ('9', 9), ('T', 10), ('J', 11), ('Q', 12), ('K', 13), ('A', 14)]


sortByLength :: [[a]] -> [[a]]
sortByLength=  sortBy (\a b -> length a `compare` length b)


isSerial :: [Int] -> Bool
isSerial nums = nums == [h, h+1, h+2, h+3, h+4]
    where h = head nums


splitLn :: String -> [String]
splitLn = splitRegex (mkRegex "\n")


filename :: String
filename = "054.txt"
