module Engines.MediumEngine (mediumEngine) where
import Engines.RandomEngine

makeMove :: Int -> [Int] -> (Int, Int)
makeMove _ [] = (-1,-1)
makeMove i (x : xs) = if x `mod` 4 /= 0 then (x `mod` 4, i) else makeMove (i + 1) xs  

mediumEngine :: [Int] -> (Int, Int)
mediumEngine xs =
    let res = makeMove 0 xs
    in if res == (-1, -1) then randomEngine 0 xs else res
