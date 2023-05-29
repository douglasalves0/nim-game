module Game.GameLoop where

import Control.Concurrent (threadDelay)
import Engines.GetEngine
import GeniusDraw.DrawingFunctions (drawGameLoop, drawMenuGenie, drawStartGenie)
import Interface.StringsAndCommand
import Player.GetPlayerInput (getPlayerInput)

gameVersusPlayer :: [Int] -> String -> String -> IO ()
gameVersusPlayer stack namePlayer1 namePlayer2 = do
  input1 <- getPlayerInput stack (namePlayer1 ++ player1Turn)
  let stack2 = newStack stack input1
  if winned stack2
    then do
      clearT
      drawMenuGenie (namePlayer1 ++ player1Winner) wallet15Title wallet15
    else do
      input2 <- getPlayerInput stack2 (namePlayer2 ++ player2Turn)
      let stack3 = newStack stack2 input2
      if winned stack3
        then do
          clearT
          drawMenuGenie (namePlayer2 ++ player2Winner) wallet15Title wallet15
        else gameVersusPlayer stack3 namePlayer1 namePlayer2

gameVersusBot :: [Int] -> Int -> String -> IO ()
gameVersusBot stack level namePlayer = do
  let bot = getEngine level
  input <- getPlayerInput stack (namePlayer ++ player1Turn)
  let stack2 = newStack stack input
  if winned stack2
    then do
      clearT
      drawWinnerPlayer level namePlayer
    else do
      let botMove = bot stack2
      clearT
      drawGameLoop stack2 ("Hmmm! Vou tirar " ++ show (fst botMove) ++ " moedas da pilha " ++ show (snd botMove + 1))
      threadDelay 4000000

      let stack3 = newStack stack2 botMove
      if winned stack3
        then do
          clearT
          drawStartGenie gennieWinner
        else gameVersusBot stack3 level namePlayer

drawWinnerPlayer :: Int -> String -> IO ()
drawWinnerPlayer 1 namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet10Title wallet10
drawWinnerPlayer 2 namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet15Title wallet15
drawWinnerPlayer 3 namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet20Title wallet20
drawWinnerPlayer x namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet10Title wallet10

gameLoop :: [Int] -> Int -> String -> String -> IO ()
gameLoop stack level namePlayer1 "" = gameVersusBot stack level namePlayer1
gameLoop stack level namePlayer1 namePlayer2 = gameVersusPlayer stack namePlayer1 namePlayer2

newStack :: [Int] -> (Int, Int) -> [Int]
newStack (x : xs) (coins, 0) = (x - coins) : xs
newStack (x : xs) (coins, move) = x : newStack xs (coins, move - 1)

winned :: [Int] -> Bool
winned [] = True
winned (x : xs) = if x /= 0 then False else winned xs
