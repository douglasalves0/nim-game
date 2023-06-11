- include('../Game/gameLoop.pl').
:- include('../GeniusDraw/DrawingFunctions.pl').
:- include('../Interface/StringsAndCommand.pl').
:- include('../Validate/isValidMenu.pl').

initGame(OpeningSentence, Size) :-
  clearT,
  initMenuTitle(Title),
  initMenuOptions(Options),
  drawMenuGenie(OpeningSentence, Title, Options),
  read_line_to_string(user_input, OptionString),
  number_string(Option, OptionString),
  (validateRange(Size, Option) ->
    (Option =:= 1 ->
      presentsMainMenu(MainMenuMessage),
      mainMenu(MainMenuMessage)
    ;
      Option =:= 2 ->
      clearT,
      presentsInitialWithdrawal(WithdrawalMessage),
      drawStartGenie(WithdrawalMessage)
    )
  ;
    presentsValidEntry(ValidEntryMessage),
    initGame(ValidEntryMessage, Size)
  ).

mainMenu(OpeningSentence) :-
  clearT,
  mainMenuTitle(Title),
  mainMenuOptions(Options),
  drawMenuGenie(OpeningSentence, Title, Options),
  read_line_to_string(user_input, Option),
  (validateRange(4, Option) ->
    atom_number(Option, OptionInt),
    getMenu(OptionInt)
  ;
    presentsValidEntry(ValidEntryMessage),
    mainMenu(ValidEntryMessage)
  ).

getMenu(Option) :-
  Option = 1,
  clearT,
  drawMenuGenie(PresentsOpponents, OpponentsMenuTitle, OpponentsMenuOptions),
  read_line_to_string(user_input, Option1),
  (validateRange(2, Option1) ->
    (OptionInt is integer(Option1),
     (OptionInt =:= 1 ->
       getNamePlayer(PresentsNamePlayer1, NamePlayer1),
       getNamePlayer(PresentsNamePlayer2, NamePlayer2),
       createStack(4, Stack),
       gameLoop(Stack, 0, NamePlayer1, NamePlayer2)
     ;
       createDifficulty(PresentsChallenges)
     )
    ),
    getMenu(1)
  ;
    getMenu(1)
  ).
getMenu(Option) :-
  Option = 2,
  clearT,
  drawHintGenie(PresentsChallengesTypes, ChallengeTypes),
  read_line_to_string(user_input, _),
  mainMenu(PresentsMainChallenge).
getMenu(Option) :-
  Option = 3,
  clearT,
  drawHintGenie(PresentsChallengesPerforms, PerformsChallenge),
  read_line_to_string(user_input, _),
  mainMenu(PresentsMainPerforms).
getMenu(Option) :-
  Option = 4,
  clearT,
  drawStartGenie(PresentsWithdrawal).

getNamePlayer(Phrase, Name) :-
  clearT,
  drawStartGenie(Phrase),
  read_line_to_string(user_input, Name),
  (validateName(Name) -> true ; getNamePlayer(PresentsNameError, Name)).

createDifficulty(Phrase) :-
  clearT,
  challengesMenuTitle(Title),
  challengesMenuOptions(Options),
  drawMenuGenie(Phrase, Title, Options),
  read_line_to_string(user_input, Option2),
  (validateRange(3, Option2) ->
    atom_number(Option2, Difficulty),
    getNamePlayer(PresentsNamePlayer, Name),
    createStack(Difficulty, Stack),
    gameLoop(Stack, Difficulty, Name, "")
  ;
    createDifficulty(PresentsValidEntry)
  ).

createStack(Difficulty, Stack) :-
  Difficulty =:= 1,
  getStacks(10, 3, Stack).
createStack(Difficulty, Stack) :-
  Difficulty =:= 2,
  getStacks(15, 4, Stack).
createStack(Difficulty, Stack) :-
  Difficulty =:= 3,
  getStacks(20, 5, Stack).
createStack(Difficulty, Stack) :-
  Difficulty =:= 4,
  getStacks(15, 5, Stack).


getStacks(Coins, 1, [Coins]) :- !.

getStacks(Coins, Stacks, R) :-
    Lim is (Coins div Stacks) + 1,
    random(2, Lim, Take),
    RestCoins is Coins - Take,
    RestStacks is Stacks - 1,
    getStacks(RestCoins, RestStacks, R2),
    R = [Take|R2]. 