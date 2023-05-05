module RandomEngine (randomEngine) where
import System.Random

randomNumber :: Int -> Int -> Int
randomNumber inf sup = fst $ randomR (inf, sup) (mkStdGen 365)

randomEngine:: Int -> [Int] -> (Int, Int)
randomEngine i xs =
    if xs !! i == 0 then randomEngine (i + 1) xs else (randomNumber 1 (min 3 (xs !! i)), i)
