{-# LANGUAGE DataKinds #-}
module StartGame where

import Interface.MainMenu (startGame) 

main :: IO()
main = do
    startGame "Seja bem vindo(a)! Hoje é o seu dia de sorte, quer dizer, depende do que você considera sorte HAHAHAHAHA. Primeiro tenho que lhe informar que atualmente não possuo mais desejos para lhe oferecer, entretanto gostaria de lhe propor um desafio e em troca você ganhará todas as criptomoedas que estiverem disponíveis. Digite uma das opções abaixo."
