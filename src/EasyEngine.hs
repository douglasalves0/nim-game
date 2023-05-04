module EasyEngine (easy_engine) where 

easy_engine :: [Int] -> [Int]
easy_engine list = do
    
    let idx = small_pos_heap_index list;
    let cnt = count_positive_indexes list;
    let mid = list !! idx;

    if cnt > 1 then [(min mid 3), idx]
    else if mid > 3 then [1, idx]
    else [mid, idx]

count_positive_indexes :: [Int] -> Int
count_positive_indexes [] = 0
count_positive_indexes (x:xs) = do
    if x > 0 then
        1 + count_positive_indexes xs
    else
        count_positive_indexes xs

small_pos_value :: [Int] -> Int
small_pos_value = minimum . filter (>0)

small_pos_index :: Int -> [Int] -> Int -> Int
small_pos_index small (x:xs) i = do
    if x == small then i
    else small_pos_index small xs (i+1)

small_pos_heap_index :: [Int] -> Int
small_pos_heap_index list = small_pos_index (small_pos_value list) list 0