:- style_check(-discontiguous).
:- include('../Engines/useEngine.pl').
:- include('../GeniusDraw/DrawingFunctions.pl').
:- include('../Player/GetPlayerInput.pl').
:- include('../Interface/StringsAndCommand.pl').
:- use_module(library('system')).

makePlayerMove(Stacks, Level, NamePlayer, Stacks2) :-
    player1Turn(Msg2),
    concat_atom([NamePlayer, Msg2], Msg),
    getPlayerInput(Stacks, Msg, Move),
    nth0(0, Move, Coins),
    nth0(1, Move, Stack),
    newStack(Stacks, Coins, Stack, Stacks2),
    (winned(Stacks2) -> 
    drawWinnerPlayer(Level, NamePlayer),
    halt; !).

makeBotMove(Stacks, Level, Stacks2) :-
    useEngine(Level, Stacks, Move),
    nth0(0, Move, Coins),
    nth0(1, Move, Stack),
    Stack2 is Stack + 1,
    number_string(Stack2, StackStr),
    number_string(Coins, CoinsStr),
    concat_atom(["Hmmm! Vou tirar ", CoinsStr, " moedas da pilha ", StackStr], BotMoveMsg),
    drawGameLoop(Stacks, BotMoveMsg),
    sleep(4),
    newStack(Stacks, Coins, Stack, Stacks2),
    (winned(Stacks2) -> 
    gennieWinner(WinnerMsg),
    drawStartGenie(WinnerMsg),
    halt; !).
    
gameVersusPlayer(Stacks, NamePlayer1, NamePlayer2) :-
    makePlayerMove(Stacks, 0, NamePlayer1, Stacks2),
    makePlayerMove(Stacks2, 0, NamePlayer2, Stacks3),
    gameVersusPlayer(Stacks3, NamePlayer1, NamePlayer2).

gameVersusBot(Stacks, Level, NamePlayer) :-
    makePlayerMove(Stacks, Level, NamePlayer, Stacks2),
    makeBotMove(Stacks2, Level, Stacks3),
    gameVersusBot(Stacks3, Level, NamePlayer).

drawWinnerPlayer(0, NamePlayer) :-
  player2Winner(WinnerMsg2),
  concat_atom([NamePlayer, WinnerMsg2], WinnerMsg),
  wallet15Title(WalletTitle),
  wallet15(WalletContent),
  drawMenuGenie(WinnerMsg, WalletTitle, WalletContent),
  !.

drawWinnerPlayer(1, NamePlayer) :-
  player1Winner(WinnerMsg2),
  concat_atom([NamePlayer, WinnerMsg2], WinnerMsg),
  wallet10Title(WalletTitle),
  wallet10(WalletContent),
  drawMenuGenie(WinnerMsg, WalletTitle, WalletContent),
  !.

drawWinnerPlayer(2, NamePlayer) :-
  player1Winner(WinnerMsg2),
  concat_atom([NamePlayer, WinnerMsg2], WinnerMsg),
  wallet15Title(WalletTitle),
  wallet15(WalletContent),
  drawMenuGenie(WinnerMsg, WalletTitle, WalletContent),
  !.

drawWinnerPlayer(3, NamePlayer) :-
  player1Winner(WinnerMsg2),
  concat_atom([NamePlayer, WinnerMsg2], WinnerMsg),
  wallet20Title(WalletTitle),
  wallet20(WalletContent),
  drawMenuGenie(WinnerMsg, WalletTitle, WalletContent),
  !.

gameLoop(Stacks, Level, NamePlayer1, "") :- gameVersusBot(Stacks, Level, NamePlayer1).
gameLoop(Stacks, 0, NamePlayer1, NamePlayer2) :- gameVersusPlayer(Stacks, NamePlayer1, NamePlayer2).

newStack([H | T], CoinsQuantity, 0, [NewH|T]):- NewH is H - CoinsQuantity, !.

newStack([H | T], CoinsQuantity, Index, [H | Result]):-
  Index2 is Index - 1,
  newStack(T, CoinsQuantity, Index2, Result).

winned([]):-!.
winned([0|T]) :- winned(T).
