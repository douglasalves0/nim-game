module GetStacks (getStacks) where
import System.Random

getStacks :: Int -> Int -> IO [Int]
getStacks i rest 
    | i == 1 = return [rest]
    | otherwise = do
        choice <- randomRIO (2, rest `div` i)
        restOfList <- getStacks (i - 1) (rest - choice)
        return (choice : restOfList)
