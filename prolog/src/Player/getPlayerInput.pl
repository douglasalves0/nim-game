validatePlayerInputCoins(PlayerInputCoins):-
    % Corrigir um erro quando o erro acontece em apenas um dos lados ou
    % em ambos os lados que o Error nao isntanciado, mas se a gente colocar Error = false
    % o programa simplesmente para
    (PlayerInputCoins < 1 ; PlayerInputCoins > 3 ; integer(PlayerInputCoins) = false) ->
    (
        write("Digite um numero inteiro entre 1 e 3\n"),
        getPlayerInputCoins()
    ) ;
    write(PlayerInputCoins).

validatePlayerInputStacks(PlayerInputStacks):- 
    (PlayerInputStacks < 0 ; integer(PlayerInputStacks) = true) ->
    (
        write("Digite um numero inteiro maior que 0\n"),
        getPlayerInputStacks()
    ) ; 
    write(PlayerInputStacks).

getPlayerInputCoins():-
    write("Quantas moedas voce quer retirar?\n"),
    read(PlayerInputCoins),
    validatePlayerInputCoins(PlayerInputCoins),
    
    getPlayerInputStacks(),
    halt.

getPlayerInputStacks():-
    write("De qual pilha voce quer retirar as moedas?\n"),
    read(PlayerInputStacks),
    validatePlayerInputStacks(PlayerInputStacks),
  
    halt.% Aqui chama a funcao de deletar da pilha



