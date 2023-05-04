import Data.Bits

hard_engine :: [Int] -> [Int]
hard_engine list = do
    let xor4 = get_xor_mod4 list;
    if xor4 == 0 then
        make_random_move list
    else
        make_best_move xor4 list

get_xor_mod4 :: [Int] -> Int
get_xor_mod4 [] = 0
get_xor_mod4 (x:xs) = xor (rem x 4) (get_xor_mod4 xs)

make_random_move :: [Int] -> [Int]
make_random_move (0:tail) = (0: (make_random_move tail))
make_random_move (x:tail) = ((x - (min x 3)): tail)

make_best_move :: Int -> [Int] -> [Int]
make_best_move xOr (x:xs) =
    if x-1 >= 0 && xor (xor xOr x) (x-1) == 0 then
        (x-1: xs)
    else if x-2 >= 0 && xor (xor xOr x) (x-2) == 0 then
        (x-2: xs)
    else if x-3 >= 0 && xor (xor xOr x) (x-3) == 0 then
        (x-3: xs)
    else
        (x: make_best_move xOr xs)