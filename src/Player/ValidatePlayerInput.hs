module Player.ValidatePlayerInput where
import Data.Char (isDigit)

validatePlayerInput :: String -> String -> [Int] -> String
validatePlayerInput playerCoinMove playerStackMove stack
    | not (all isDigit playerCoinMove) = "O valor de moedas deve ser um número positivo."
    | not (all isDigit playerStackMove) = "O valor da pilha dever ser um número positivo."
    | (read playerStackMove :: Int) < 1 || (read playerStackMove :: Int) > length stack = "Escolha uma pilha válida para retirar as moedas."
    | (read playerCoinMove :: Int) < 1 || (read playerCoinMove :: Int) > 3 = "Você só pode retirar entre 1 ou 3 moedas por pilha por vez."
    | (stack !! ((read playerStackMove :: Int) - 1)) < (read playerCoinMove :: Int) = "Você não pode retirar um valor maior de uma pilha menor."
    | otherwise = ""
