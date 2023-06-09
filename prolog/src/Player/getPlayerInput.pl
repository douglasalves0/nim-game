% Essa funcao recebe a lista de pilhas do jogo pra poder passar pra o isValidPlay
% PlayerMove eh uma tuple com as jogadas do jogador
:- include('../Validade/isValidPlay.pl').
:- include('../GeniusDraw/DrawingFunctions.pl'). 

getPlayerInput(StackList, Msg, PlayerMove):-
    drawGameLoop(StackList, Msg),

    drawGameLoop(StackList, "De qual pilha voce quer retirar as moedas?"),  
    read(InputStack),

    drawGameLoop(StackList, "Quantas moedas voce quer retirar?"),
    read(InputCoins),
    
    isValidPlay(InputCoins, InputStack, StackList),
    PlayerMove is [InputCoins, InputStack - 1].
