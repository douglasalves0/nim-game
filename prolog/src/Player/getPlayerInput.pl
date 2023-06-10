% Essa funcao recebe a lista de pilhas do jogo pra poder passar pra o isValidPlay
% PlayerMove eh uma tuple com as jogadas do jogador
:- include('../Validate/isValidPlay.pl').
:- include('../GeniusDraw/DrawingFunctions.pl'). 

getPlayerInput(StackList, Msg, PlayerMove):-
    drawGameLoop(StackList, Msg),
    read(_),
    
    drawGameLoop(StackList, "De qual pilha voce quer retirar as moedas?"),  
    read(InputStack),

    drawGameLoop(StackList, "Quantas moedas voce quer retirar?"),
    read(InputCoins),
    
    InputStack2 is InputStack - 1,
    isValidPlay(InputCoins, InputStack2, StackList, Msg),
    (
        Msg =:= "" ->
            PlayerMove = [InputCoins, InputStack2]
        ; 
            getPlayerInput(StackList, Msg, PlayerMove)
    ).
