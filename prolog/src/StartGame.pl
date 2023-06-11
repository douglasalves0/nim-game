:- include('./Interface/StringsAndCommand.pl').
:- include('./Interface/MainMenu.pl').

main :-
    start().

start :- 
    initialPresentation(String),
    initGame(String), halt.