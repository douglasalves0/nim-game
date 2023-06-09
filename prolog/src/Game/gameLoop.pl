:- include('../Engines/useEngine.pl').
:- include('../GeniusDraw/DrawingFunctions.pl').
:- include('../Player/GetPlayerInput.pl').
:- include('../Interface/StringsAndCommand.pl').
%import Control.Concurrent (threadDelay)

makePlayerMove(Stacks, NamePlayer, Stacks2) :-
    concat_atom(["Sua vez ", NamePlayer], Msg),
    getPlayerInput(Stacks, Msg, [Coins|Stack]),
    newStack(Stacks, Coins, Stack, Stacks2),
    winned(Stacks2, R),
    (R =:= true -> 
    concat_atom(["Parabéns ", NamePlayer, "Você venceu!"], WinnerMessage),
    write(WinnerMessage),
    nl,
    halt).

makeBotMove(Stacks, Level, Stacks2) :-
    useEngine(Level, Stacks, [Coins|Stack]),
    number_codes(Stack, StackStr),
    number_codes(Coins, CoinsStr),
    concat_atom(["Hmmm! Vou tirar ", CoinsStr, " moedas da pilha ", StackStr], BotMoveMsg),
    write(BotMoveMsg),
    nl,
    newStack(Stacks, Coins, Stack, Stacks2),
    winned(Stacks2, R),
    (R =:= true -> 
    concat_atom(["Parabéns ", NamePlayer, "Você venceu!"], WinnerMessage),
    write(WinnerMessage),
    nl,
    halt).
    
gameVersusPlayer(Stacks, NamePlayer1, NamePlayer2) :-
    makePlayerMove(Stacks, NamePlayer1, Stacks2),
    makePlayerMove(Stacks2, NamePlayer2, Stacks3),
    gameVersusPlayer(Stacks3, NamePlayer1, NamePlayer2).

gameVersusBot(Stacks, Level, NamePlayer) :-
    makePlayerMove(Stacks, NamePlayer, Stacks2),
    makeBotMove(Stacks2, Level, Stacks3),
    gameVersusBot(Stacks3, Level, NamePlayer).

/* precisa de StingsAndCommands
drawWinnerPlayer :: Int -> String -> IO ()
drawWinnerPlayer 1 namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet10Title wallet10
drawWinnerPlayer 2 namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet15Title wallet15
drawWinnerPlayer 3 namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet20Title wallet20
drawWinnerPlayer x namePlayer = do
  clearT
  drawMenuGenie (namePlayer ++ player1Winner) wallet10Title wallet10
*/

gameLoop(Stacks, Level, NamePlayer1, "") :- gameVersusBot(Stacks, Level, NamePlayer1).
gameLoop(Stacks, 0, NamePlayer1, NamePlayer2) :- gameVersusPlayer(Stacks, NamePlayer1, NamePlayer2).

newStack([H | T], CoinsQuantity, 0, [NewH|T]):- NewH is H - CoinsQuantity, !.

newStack([H | T], CoinsQuantity, Index, [H | Result]):-
  Index2 is Index - 1,
  newStack(T, CoinsQuantity, Index2, Result).

winned([], true):-!.
winned([0|T], R) :- winned(T, R), !.
winned(_, false).
