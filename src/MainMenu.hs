module MainMenu where

import DrawingFunction 
import validateMenuInput
import GameLoop
import System.Random

createDifficulty :: String -> IO()
createDifficulty frase = 
    drawMenuGenie frase "DESAFIOS" ["1 | Conquistar 10 moedas" , "2 | Conquistar 15 moedas" , "3 | Conquistar 20 moedas"]
    option2 <- getLine
    if validateInput option2 then do
        gameLoop createStack option2 True option2 
    else 
        createDifficulty "Digite uma opção válida!"

createStack :: Int -> [Int]
createStack difficulty 
    | difficulty == 1 = getStacks 10 3
    | difficulty == 2 = getStacks 15 4
    | difficulty == 3 = getStacks 20 5
    | difficulty == 4 = getStacks 25 5

getStacks :: Int -> Int -> IO [Int]
getStacks coins stacks  
    | stacks == 1 = return [coins]
    | otherwise = do
        choice <- randomRIO (2, coins `div` stacks)
        restOfList <- getStacks (stacks - 1) (coins - choice)
        return (choice : restOfList)

getMenu :: Int -> IO()
getMenu option
    | option == 1 = do 
                    drawMenuGenie "Abaixo te apresento as duas maneiras de executar o desafio que escolher, quem gostaria de enfretar? Digite uma das opções. " "DESAFIANTE" ["1 | Jogador" , "2 | Gênio"] 
                    option <- readLn 
                    if validateInput option then do  
                        if option == 1 then do
                            gameLoop createStack 4 False 0
                        else 
                            createDifficulty 
                    else 
                        getMenu 1
    | option == 2 = do 
                    drawHintGenie "Abaixo de apresento os meus desafios e a forma de chamar alguém para dividir essa oportunidade de ganhar as criptomoedas!" ["Primeira Linha", "Segunda Linha"]
                    x <- getLine
                    mainMenu

    | option == 3 = do 
                    drawHintGenie "Posso te confessar que isso será muito díficil, porém irei te ensinar como executar o desafio!" ["Primeira Linha", "Segunda Linha"]
                    x <- getLine
                    mainMenu

    | option == 4 = drawStartGenie "Eu bem que desconfiei que você não seria forte o bastante!"

startGame :: String -> IO()
startGame openingSentence = do  
    drawMenuGenie openingSentence "VOCÊ ACEITA O DESAFIO?" ["1 | Sim, vamos lá!" , "2 | Não, deixa pra outro momento."]
    option <- getLine 
    if validateInput option then 
        if option == 1 then 
            mainMenu "Bem vindo ao desafio das criptomoedas, escolha uma das opções abaixo!"
        else 
            drawStartGenie "Quem desiste sem ao menos tentar uma vez não merece as minhas criptomoedas!"

--Create Function for drawing Menu with options
mainMenu :: String -> IO()
mainMenu fraseInicial = do
    drawMenuGenie fraseInicial "MENU" [" 1 | Iniciar Desafio" , "2 | Tipos de Desafio" , "3 | Como Realizar o Desafio", "4 | Desistir do Desafio"]
    option <- getLine 
    if validateMenuInput option then
        getMenu (read option)
    else 
        mainMenu "Digite uma opção válida!"

