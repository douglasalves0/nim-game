% Essa funcao recebe a lista de pilhas do jogo pra poder passar pra o isValidPlay
getPlayerInput(StackList):-
    write("De qual pilha voce quer retirar as moedas?\n"),  
    read(PlayerInputStacks),

    write("Quantas moedas voce quer retirar?\n"),
    read(PlayerInputCoins),
    
    isValidPlay(InputCoins, InputStack, StackList)
    deleteFromStack(InputCoins, InputStack).
