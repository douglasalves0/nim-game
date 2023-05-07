module Game.GameLoop where

import GeniusDraw.DrawingFunctions
import Engines.GetEngine
import Player.GetPlayerInput
import Control.Concurrent (threadDelay)

gameLoop :: [Int] -> Bool -> Int -> IO ()
-- stack isBot level
gameLoop stack true level = gameVersusBot stack level
gameLoop stack false level = gameVersusPlayer stack

newStack :: [Int] -> (Int, Int) -> [Int]
newStack (x : xs) (coins, 0) = (x - coins) : xs
newStack (x : xs) (coins, move) = x : newStack xs (coins, move - 1)

winned :: [Int] -> Bool
winned [] = True
winned (x : xs) = if x /= 0 then False else winned xs

gameVersusPlayer :: [Int] -> IO()
gameVersusPlayer stack = do
    input1 <- getPlayerInput stack "Player 1! Sua Jogada."
    let stack2 = newStack stack input1 
    if winned stack2 then drawStartGenie "Player 1 Ganhou!" else do
        input2 <- getPlayerInput stack2 "Player 2! Sua Jogada."
        let stack3 = newStack stack2 input2
        if winned stack3 then drawStartGenie "Player 2 Ganhou!" else gameVersusPlayer stack3

gameVersusBot :: [Int] -> Int -> IO ()
gameVersusBot stack level = do
    let bot = getEngine level
    input <- getPlayerInput stack "Player 1"
    let stack2 = newStack stack input 
    if winned stack2 then drawStartGenie "Player 1 Ganhou!" else do
        let botMove = bot stack2
        print (show botMove)
        threadDelay 2000000
        let stack3 = newStack stack2 botMove
        if winned stack3 then drawStartGenie "Bot Ganhou!" else gameVersusBot stack3 level
