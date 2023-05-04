module Validation (validatePlayerInput) where

validatePlayerInput::T->T->[Int]->String                                                                                    

validatePlayerInput playerCoinMove playerStackMove stack                                                                    
    | typeOf playerCoinMove != typeOf 1 || playerStackMove != typeOf 1 = "Os valores digitados devem ser numeros."          
    | playerCoinMove < 1 || playerCoinMove > 3 = "Voce so pode retirar entre 1 ou 3 moedas por pilha por vez."              
    | playerStackMove < length stack || playerStackMove > length stack = "Escolha uma pilha valida para retirar as moedas." 
    | stack !! playerStackMove < playerCoinMove = "Voce nao pode retirar um valor maior de uma pilha menor."                
