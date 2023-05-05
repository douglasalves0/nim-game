module HardEngine (hardEngine) where 
import Data.Bits
import RandomEngine

hardEngine :: [Int] -> (Int,Int)
hardEngine list = do
    let xor4 = getXorMod4 list;
    if xor4 == 0 then randomEngine 0 list
    else makeBestMove xor4 list 0

getXorMod4 :: [Int] -> Int
getXorMod4 [] = 0
getXorMod4 (x:xs) = xor (rem x 4) (getXorMod4 xs)


makeBestMove :: Int -> [Int] -> Int -> (Int,Int)
makeBestMove xOr (x:xs) i =
    if x-1 >= 0 && xor (xor xOr x) (x-1) == 0 then (1, i)
    else if x-2 >= 0 && xor (xor xOr x) (x-2) == 0 then (2, i)
    else if x-3 >= 0 && xor (xor xOr x) (x-3) == 0 then (3, i)
    else makeBestMove xOr xs (i+1)
    