validatePlayerInputCoins(PlayerInputCoins):-
    (is_of_type(text, PlayerInputCoins) ; is_of_type(char, PlayerInputCoins) ; PlayerInputCoins < 1 ; PlayerInputCoins > 3) ->
    (
        write("Digite um numero inteiro entre 1 e 3\n"),
        getPlayerInputCoins()
    ) ;
    write(PlayerInputCoins).

validatePlayerInputStacks(PlayerInputStacks):- 
    (is_of_type(negative_integer, PlayerInputStacks) ; is_of_type(char, PlayerInputStacks) ; is_of_type(text, PlayerInputStacks)) ->
    (
        write("Digite um numero inteiro maior que 0\n"),
        getPlayerInputStacks()
    ) ; 
    write(PlayerInputStacks).

getPlayerInputCoins():-
    write("Quantas moedas voce quer retirar?\n"),
    read(PlayerInputCoins),
    nl,
    validatePlayerInputCoins(PlayerInputCoins),
    
    getPlayerInputStacks(),
    halt.

getPlayerInputStacks():-
    write("De qual pilha voce quer retirar as moedas?\n"),
    read(PlayerInputStacks),
    nl,
    validatePlayerInputStacks(PlayerInputStacks),
  
    halt.% Aqui chama a funcao de deletar da pilha



