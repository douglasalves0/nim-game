module Validate.ValidateMenuInput where

import Data.Char (isDigit)

validateRange :: Int -> String -> Bool
validateRange size option
  | not (all isDigit option) = False
  | otherwise = (read option :: Int) `elem` [1 .. size]

validateName :: String -> Bool
validateName name
  | name == "" = False
  | otherwise = True
  