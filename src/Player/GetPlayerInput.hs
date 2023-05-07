module Player.GetPlayerInput where
import Player.ValidatePlayerInput
import GeniusDraw.DrawingFunctions

getPlayerInput :: [Int] -> String -> IO (Int, Int)
getPlayerInput stack frase1 = do
    drawGameLoop stack frase1
    x <- getLine

    drawGameLoop stack "Digite a pilha de que voce quer tirar as moedas:"
    playerStackMove <- getLine

    drawGameLoop stack "Digite a quantidade de moedas que voce quer retirar:"
    playerCoinMove <- getLine

    let validation = validatePlayerInput playerCoinMove playerStackMove stack
    if validation == "" then return (read playerCoinMove, read playerStackMove - 1) else getPlayerInput stack validation
