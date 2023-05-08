module Validate.ValidateMenuInput (validateMenuInput, validateInput,validateRange) where

import Data.Char (isDigit)

validateMenuInput :: String -> Bool
validateMenuInput option
    | not (all isDigit option) = False
    | (read option :: Int) < 1 || (read option :: Int) > 4 = False
    | otherwise = True

validateInput :: String -> Bool
validateInput option
    | not (all isDigit option) = False
    | (read option :: Int) < 1 || (read option :: Int) > 2 = False
    | otherwise = True

validateRange ::Int -> String -> Bool
validateRange size option
    | not (all isDigit option) = False
    | otherwise = (read option :: Int) `elem` [1..size]
