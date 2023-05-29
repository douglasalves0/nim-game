module Player.GetPlayerInput where

import GeniusDraw.DrawingFunctions (drawGameLoop)
import Interface.StringsAndCommand (clearT, takeCoins, takeStack)
import Validate.ValidatePlayerInput

getPlayerInput :: [Int] -> String -> IO (Int, Int)
getPlayerInput stack frase1 = do
  clearT
  drawGameLoop stack frase1
  x <- getLine

  clearT
  drawGameLoop stack takeStack
  playerStackMove <- getLine

  clearT
  drawGameLoop stack takeCoins
  playerCoinMove <- getLine

  let validation = validatePlayerInput playerCoinMove playerStackMove stack
  if validation == ""
    then return (read playerCoinMove, read playerStackMove - 1)
    else getPlayerInput stack validation
