module Engines.EasyEngine (easyEngine) where 

easyEngine :: [Int] -> (Int,Int)
easyEngine list = do
    
    let idx = smallPosHeapIndex list;
    let cnt = countPositiveIndexes list;
    let mid = list !! idx;

    if cnt > 1 then ((min mid 3), idx)
    else if mid > 3 then (1, idx)
    else (mid, idx)

countPositiveIndexes :: [Int] -> Int
countPositiveIndexes [] = 0
countPositiveIndexes (x:xs) = do
    if x > 0 then
        1 + countPositiveIndexes xs
    else
        countPositiveIndexes xs

smallPosValue :: [Int] -> Int
smallPosValue = minimum . filter (>0)

smallPosIndex :: Int -> [Int] -> Int -> Int
smallPosIndex small (x:xs) i = do
    if x == small then i
    else smallPosIndex small xs (i+1)

smallPosHeapIndex :: [Int] -> Int
smallPosHeapIndex list = smallPosIndex (smallPosValue list) list 0