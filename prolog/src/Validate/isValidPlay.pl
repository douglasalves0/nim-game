:- module(validation, [isValidPlay/3]).

isValidPlay(CoinsQuantity, IndexStack, StackList):-
  (                                                                                                                              
    (is_of_type(text, PlayerInputCoins) ; is_of_type(char, PlayerInputCoins) ; PlayerInputCoins < 1 ; PlayerInputCoins > 3) ->   
      (
        getPlayerInput(StackList, "Digite um numero inteiro entre 1 e 3", [])                                                                                                
      )                                                                                                                          
    ;                                                                                                                            
    true                                                                                                                         
  ),

  (
    (is_of_type(negative_integer, PlayerInputStacks) ; is_of_type(char, PlayerInputStacks) ; is_of_type(text, PlayerInputStacks) ; PlayerInputStacks = 0) -> 
      (
        getPlayerInputStacks(InputStack, "Digite um numero inteiro maior que 0", [])
      )
    ;
    true
  ),

  length(StackList, Size),
  ( % Verificacao se o index da lista de pilhas eh valido
    (IndexStack > Size) -> 
      (
        getPlayerInput(StackList, "Digite uma pilha valida para retirar as moedas", [])
      )
    ;
    true
  ),

  nth0(IndexStack - 1, StackList, Stack),
  ( % Verificacao se a quantidade de moedas do player eh maior que a pilha desejada
    (CoinsQuantity > Stack) ->
      (
        getPlayerInput(StackList, "A quantidade de moedas que voce quer retirar eh maior do que a pilha", [])
      )
    ;
    true
  ).
