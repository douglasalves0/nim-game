import Validation

getPlayerInput::([Int])=>(Int,Int)->[Int]->IO()

getPlayerInput secondPlayerMoveFunction stack = do
    putStrLn "Digite a quantidade de moedas que voce quer retirar:\n-> "
    playerCoinMove <- readLn
    
    putStrLn "Digite a pilha de que voce quer tirar as moedas:\n-> "
    playerStackMove <- readLn

    let errorFirstMove = validatePlayerInput((read playerCoinMove) (read playerStackMove) stack)
    if errorFirstMove != "" then
        putStrLn errorFirstMove
        putStrLn " Tente novamente!\n"
        getPlayerInput secondPlayerMoveFunction stack
    else
        removeFromStack (read playerCoinMove) (read playerStackMove) stack

    let secondMove = secondPlayerMoveFunction stack
    let errorSecondMove = validatePlayerInput (secondMove !! 0) (secondMove !! 2)
    if errorSecondMove != "" then                                                     
        putStrLn errorSecondMove 
        putStrLn " Tente novamente!\n"                                     
        secondPlayerMoveFunction stack                                    
    else                                                                   
        removeFromStack (secondMove !! 0) (secondMove !! 2) stack 

    getPlayerInput secondPlayerMoveFunction stack
