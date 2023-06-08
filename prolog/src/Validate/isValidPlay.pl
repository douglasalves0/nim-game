isValidPlay(CoinsQuantity, IndexStack, Stack):-
  length(Stack, Size),

  (
    (IndexStack > Size) -> write("Digite uma pilha valida")
  ) 
