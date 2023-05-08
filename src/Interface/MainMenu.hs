module Interface.MainMenu where

import Game.GameLoop (gameLoop)
import GeniusDraw.DrawingFunctions (drawHintGenie, drawMenuGenie, drawStartGenie)
import Interface.StringsAndCommand
import System.Random
import Validate.ValidateMenuInput
  ( validateName,
    validateRange,
  )

initGame :: String -> IO ()
initGame openingSentence = do
  clearT
  drawMenuGenie openingSentence initMenuTitle initMenuOptions
  option <- getLine
  if validateRange 2 option
    then
      if (read option :: Int) == 1
        then mainMenu presentsMainMenu
        else do
          clearT
          drawStartGenie presentsInitialWithdrawal
    else initGame presentsValidEntry

mainMenu :: String -> IO ()
mainMenu openingSentence = do
  clearT
  drawMenuGenie openingSentence mainMenuTitle mainMenuOptions
  option <- getLine
  if validateRange 4 option
    then getMenu (read option)
    else mainMenu presentsValidEntry

getMenu :: Int -> IO ()
getMenu option
  | option == 1 = do
      clearT
      drawMenuGenie presentsOpponents opponentsMenuTitle opponentsMenuOptions
      option <- getLine
      if validateRange 2 option
        then do
          if (read option :: Int) == 1
            then do
              namePlayer1 <- getNamePlayer presentsNamePlayer1
              namePlayer2 <- getNamePlayer presentsNamePlayer2
              list <- createStack 4
              gameLoop list 0 namePlayer1 namePlayer2
            else createDifficulty presentsChallenges
        else getMenu 1
  | option == 2 = do
      clearT
      drawHintGenie presentsChallengesTypes challengeTypes
      x <- getLine
      mainMenu presentsMainChallenge
  | option == 3 = do
      clearT
      drawHintGenie presentsChallengesPerforms performsChallenge
      x <- getLine
      mainMenu presentsMainPerforms
  | option == 4 = drawStartGenie presentsWithdrawal

getNamePlayer :: String -> IO String
getNamePlayer phrase = do
  clearT
  drawStartGenie phrase
  name <- getLine
  if validateName name
    then return name
    else getNamePlayer presentsNameError

createDifficulty :: String -> IO ()
createDifficulty phrase = do
  clearT
  drawMenuGenie phrase challengesMenuTitle challengesMenuOptions
  option2 <- getLine
  if validateRange 3 option2
    then do
      name <- getNamePlayer presentsNamePlayer
      list <- createStack (read option2 :: Int)
      gameLoop list (read option2 :: Int) name ""
    else createDifficulty presentsValidEntry

createStack :: Int -> IO [Int]
createStack difficulty
  | difficulty == 1 = getStacks 10 3
  | difficulty == 2 = getStacks 15 4
  | difficulty == 3 = getStacks 20 5
  | difficulty == 4 = getStacks 15 5

getStacks :: Int -> Int -> IO [Int]
getStacks coins stacks
  | stacks == 1 = return [coins]
  | otherwise = do
      choice <- randomRIO (2, coins `div` stacks)
      restOfList <- getStacks (coins - choice) (stacks - 1)
      return (choice : restOfList)