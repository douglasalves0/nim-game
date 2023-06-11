% Essa funcao recebe a lista de pilhas do jogo pra poder passar pra o isValidPlay
% PlayerMove eh uma tuple com as jogadas do jogador
:- include('../Validate/isValidPlay.pl').
:- include('../GeniusDraw/DrawingFunctions.pl'). 

getPlayerInput(StackList, Msg, PlayerMove) :-
    drawGameLoop(StackList, Msg),
    input(_),

    drawGameLoop(StackList, "De qual pilha voce quer retirar as moedas?"),  
    input(InputStack),
    drawGameLoop(StackList, "Quantas moedas voce quer retirar?"),
    input(InputCoins),
    
    isValidPlay(InputCoins, InputStack, StackList, ErrorMsg),
    string_length(ErrorMsg, L),
    (
        (L =:= 0) ->
            atom_number(InputStack, Stack2),
            Stack is Stack2 - 1,
            atom_number(InputCoins, Coins),
            PlayerMove = [Coins, Stack],
            !
        ; 
            getPlayerInput(StackList, ErrorMsg, PlayerMove)
    ).
