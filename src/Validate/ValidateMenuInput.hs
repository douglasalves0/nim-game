module Validate.ValidateMenuInput (validateMenuInput, validateInput) where

import Data.Char (isDigit)

validateMenuInput :: String -> Bool                                                                                  
validateMenuInput option                                                                    
    | not (all isDigit option) = False          
    | (read option :: Int) < 1 || (read option :: Int) >= 3 = False
    | otherwise = True          
         
validateInput :: String -> Bool                                                                                  
validateInput option                                                                    
    | not (all isDigit option) = False          
    | (read option :: Int) < 1 || (read option :: Int) >= 2 = False
    | otherwise = True   
