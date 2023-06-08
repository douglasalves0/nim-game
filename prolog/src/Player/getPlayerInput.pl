getPlayerInputCoins(InputCoins):-
    write("Quantas moedas voce quer retirar?\n"),    
    read(PlayerInputCoins),
    (
        (is_of_type(text, PlayerInputCoins) ; is_of_type(char, PlayerInputCoins) ; PlayerInputCoins < 1 ; PlayerInputCoins > 3) ->
            (
                write("Digite um numero inteiro entre 1 e 3\n"),
                getPlayerInputCoins(InputCoins)
            )
        ;
        InputCoins is PlayerInputCoins
    ).

getPlayerInputStacks(InputStack):- 
    write("De qual pilha voce quer retirar as moedas?\n"), 
    read(PlayerInputStacks),
    (
        (is_of_type(negative_integer, PlayerInputStacks) ; is_of_type(char, PlayerInputStacks) ; is_of_type(text, PlayerInputStacks) ; PlayerInputStacks = 0) ->
            (
                write("Digite um numero inteiro maior que 0\n"),
                getPlayerInputStacks(InputStack)
            )
        ; 
        InputStack is PlayerInputStacks    
    ).


getPlayerInput():-
    getPlayerInputCoins(InputCoins),
    getPlayerInputStacks(InputStack),

    deleteFromStack(InputCoins, InputStack).
