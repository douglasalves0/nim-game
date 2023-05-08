module Interface.MainMenu where

import GeniusDraw.DrawingFunctions (drawStartGenie, drawMenuGenie, drawHintGenie)
import Validate.ValidateMenuInput
import Game.GameLoop
import System.Random

createDifficulty :: String -> IO()
createDifficulty frase = do
    drawMenuGenie frase "DESAFIOS" ["1 | Conquistar 10 moedas" , "2 | Conquistar 15 moedas" , "3 | Conquistar 20 moedas"]
    option2 <- getLine
    if validateRange 3 option2 then do
        list <- createStack (read option2 :: Int)
        gameLoop list True (read option2 :: Int)
    else 
        createDifficulty "Digite uma opção válida!"

createStack :: Int -> IO [Int]
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
        restOfList <- getStacks  (coins - choice) (stacks - 1)
        return (choice : restOfList)

tiposDesafio :: [String]
tiposDesafio = [
    "Desafio Fácil:",
    " nesse desafio eu vou pegar leve com você",
    " pois você irá precisar!,vou dividir 10 das minhas",
    " moedas em 3 pilhas, para comecar leve",
    "",
    "Desafio Médio:",
    " maior desafio maior recompensas,",
    " 15 moedas, divididas em 4 pilhas",
    " mas não se engane, não será fácil",
    "",
    "Desafio Difícil:",
    " esse eu sei que você nunca irá vencer",
    " então oferecei todo o resto de minhas moedas",
    " 20 moedas, divididas em 5 pilhas",
    "",
    "se você quiser eu deixo você e outra pessoa",
    "apostarem 25 moedas, divididas em 5 pilhas"
    ]

getMenu :: Int -> IO()
getMenu option
    | option == 1 = do 
                    drawMenuGenie "Abaixo te apresento as duas maneiras de executar o desafio que escolher, quem gostaria de enfretar? Digite uma das opções. " "DESAFIANTE" ["1 | Jogador" , "2 | Gênio"] 
                    option <- getLine
                    if validateInput option then do  
                        if (read option :: Int) == 1 then do
                            list <- createStack 4
                            gameLoop list False 0
                        else 
                            createDifficulty "Te apresento os meus desafios, se conseguir me vencer você poderá levar as criptomoedas respectivas de cada etapa. Lembre-se quanto maior o valor, maior a dificuldade!"
                    else 
                        getMenu 1
    -- create lines 
    | option == 2 = do 
                    drawHintGenie "Abaixo de apresento os meus desafios e a forma de chamar alguém para dividir essa oportunidade de ganhar as criptomoedas!" tiposDesafio
                    x <- getLine
                    mainMenu "Agora que já conhece os meus desafios, escolha uma das opções abaixo."
    -- create lines 
    | option == 3 = do 
                    drawHintGenie "Posso te confessar que isso será muito díficil, porém irei te ensinar como executar o desafio!" ["Primeira Linha", "Segunda Linha"]
                    x <- getLine
                    mainMenu "Agora que já tem uma ideia de como executar o meu desafio, escolha uma das opções abaixo."

    | option == 4 = drawStartGenie "Eu bem que desconfiei que você não seria forte o bastante!"

startGame :: String -> IO()
startGame openingSentence = do  
    drawMenuGenie openingSentence "VOCÊ ACEITA O DESAFIO?" ["1 | Sim, vamos lá!" , "2 | Não, deixa pra outro momento."]
    option <- getLine 
    if validateInput option then 
        if (read option :: Int) == 1 then 
            mainMenu "Bem vindo ao desafio das criptomoedas, escolha uma das opções abaixo!"
        else 
            drawStartGenie "Quem desiste sem ao menos tentar uma vez não merece as minhas criptomoedas!"
    else startGame "Digite uma opção Válida!"

mainMenu :: String -> IO()
mainMenu fraseInicial = do
    drawMenuGenie fraseInicial "MENU" [" 1 | Iniciar Desafio" , "2 | Tipos de Desafio" , "3 | Como Realizar o Desafio", "4 | Desistir do Desafio"]
    option <- getLine 
    if validateMenuInput option then
        getMenu (read option)
    else 
        mainMenu "Digite uma opção válida!"

