:- include('./Interface/StringsAndCommand.pl').
:- include('./Interface/MainMenu.pl').

start :- 
    initialPresentation(String),
    initGame(String), halt.