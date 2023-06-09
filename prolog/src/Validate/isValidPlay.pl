:- module(validation, [isValidPlay/3]).

isValidPlay(CoinsQuantity, IndexStack, StackList):-
  (                                                                                                                              
    (is_of_type(text, PlayerInputCoins) ; is_of_type(char, PlayerInputCoins) ; PlayerInputCoins < 1 ; PlayerInputCoins > 3) ->   
      (                                                                                                                        ) 
        write("Digite um numero inteiro entre 1 e 3\n"),                                                                         
        getPlayerInput(StackList)                                                                                                
      )                                                                                                                          
    ;                                                                                                                            
    true                                                                                                                         
  ),

  (
    (is_of_type(negative_integer, PlayerInputStacks) ; is_of_type(char, PlayerInputStacks) ; is_of_type(text, PlayerInputStacks) ; PlayerInputStacks = 0) -> 
      (                                                                                                                                                    )
        write("Digite um numero inteiro maior que 0\n"),                                                                                                 
        getPlayerInputStacks(InputStack)                                                                                                                 
      )                                                                                                                                                    
    ;
    true
  ),

  length(StackList, Size),
  ( % Verificacao se o index da lista de pilhas eh valido
    (IndexStack > Size) -> 
      (
        write("Digite uma pilha valida para retirar as moedas"),
        getPlayerInput(StackList)
      )
    ;
    true
  ),

  nth0(IndexStack - 1, StackList, Stack),
  ( % Verificacao se a quantidade de moedas do player eh maior que a pilha desejada
    (CoinsQuantity > Stack) ->
      (
        write("A quantidade de moedas que voce quer retirar eh maior do que a pilha"),
        getPlayerInput(StackList)
      )
    ;
    true
  ).