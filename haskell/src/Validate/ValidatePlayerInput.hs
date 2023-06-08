module Validate.ValidatePlayerInput where

import Data.Char (isDigit)
import Interface.StringsAndCommand

validatePlayerInput :: String -> String -> [Int] -> String
validatePlayerInput playerCoinMove playerStackMove stack
    | playerCoinMove == "" || playerStackMove == "" = presentsValidEntryNumber
    | not (all isDigit playerCoinMove) = presentsValidEntryPositive
    | not (all isDigit playerStackMove) = presentsValidEntryNumberStack
    | (read playerStackMove :: Int) < 1 || (read playerStackMove :: Int) > length stack = presentsValidEntryStack
    | (read playerCoinMove :: Int) < 1 || (read playerCoinMove :: Int) > 3 = presentsValidEntryCoins 
    | (stack !! ((read playerStackMove :: Int) - 1)) < (read playerCoinMove :: Int) = presentsValidEntryStackCoins
    | otherwise = ""
    
