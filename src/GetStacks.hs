module GetStacks (getStacks) where
import System.Random

createStack :: Int -> IO [Int]
createStack difficulty 
    | difficulty == 1 = getStacks 10 3
    | difficulty == 2 = getStacks 15 4
    | difficulty == 3 = getStacks 20 5

getStacks :: Int -> Int -> IO [Int]
getStacks i rest 
    | i == 1 = return [rest]
    | otherwise = do
        choice <- randomRIO (2, rest `div` i)
        restOfList <- getStacks (i - 1) (rest - choice)
        return (choice : restOfList)
