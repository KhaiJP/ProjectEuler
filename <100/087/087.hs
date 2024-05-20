import Data.Numbers.Primes ( primes )
import qualified Data.Set as S
type Set = S.Set Integer


main :: IO ()
main = print . S.size . S.fromList $ [s | p2 <- primes2, p3 <- primes3, p4 <- primes4, let s = p2^2+p3^3+p4^4, s < upperLimit]


primesGen :: Int -> [Integer]
primesGen m = takeWhile (\n -> (n^m) < upperLimit) primes
primes2 = primesGen 2
primes3 = primesGen 3
primes4 = primesGen 4


upperLimit :: Integer
upperLimit = 50*10^6
