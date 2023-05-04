module HardEngine (hard_engine) where 
import Data.Bits

hard_engine :: [Int] -> [Int]
hard_engine list = do
    let xor4 = get_xor_mod4 list;
    if xor4 == 0 then make_random_move list 0
    else make_best_move xor4 list 0

get_xor_mod4 :: [Int] -> Int
get_xor_mod4 [] = 0
get_xor_mod4 (x:xs) = xor (rem x 4) (get_xor_mod4 xs)

make_random_move :: [Int] -> Int -> [Int]
make_random_move (0:tail) i = make_random_move tail (i+1)
make_random_move (x:tail) i = [(min x 3), i]

make_best_move :: Int -> [Int] -> Int -> [Int]
make_best_move xOr (x:xs) i =
    if x-1 >= 0 && xor (xor xOr x) (x-1) == 0 then [1, i]
    else if x-2 >= 0 && xor (xor xOr x) (x-2) == 0 then [2, i]
    else if x-3 >= 0 && xor (xor xOr x) (x-3) == 0 then [3, i]
    else make_best_move xOr xs (i+1)