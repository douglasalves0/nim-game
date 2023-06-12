:- include('../Game/gameLoop.pl').
:- include('../GeniusDraw/DrawingFunctions.pl').
:- include('../Interface/StringsAndCommand.pl').
:- include('../Validate/isValidMenu.pl').

initGame(OpeningSentence) :-
  initMenuTitle(Title),
  initMenuOptions(Options),
  drawMenuGenie(OpeningSentence, Title, Options),
  input(Option2),
  (
    validateRange(2, Option2) ->
      atom_number(Option2, Option),
      redirectInitWindow(Option),
      !
  ; 
    presentsValidEntry(ValidEntryMessage),
    initGame(ValidEntryMessage),
    !
  ).

redirectInitWindow(1):-
  presentsMainMenu(MainMenuMessage),
  mainMenu(MainMenuMessage).

redirectInitWindow(2):-
  presentsInitialWithdrawal(WithdrawalMessage),
  drawStartGenie(WithdrawalMessage),
  halt.

mainMenu(OpeningSentence) :-
  mainMenuTitle(Title),
  mainMenuOptions(Options),
  drawMenuGenie(OpeningSentence, Title, Options),
  input(Option2),
  (
    validateRange(4, Option2) ->
      atom_number(Option2, Option),
      getMenu(Option),
      !
  ; 
    presentsValidEntry(ValidEntryMessage),
    mainMenu(ValidEntryMessage),
    !
  ).

getMenu(1) :-
  call(presentsOpponents, PresentsOp),
  call(opponentsMenuTitle, OpponentsMT),
  call(opponentsMenuOptions, OpponentsMO),
  drawMenuGenie(PresentsOp, OpponentsMT, OpponentsMO),
  input(Option2),
  (
    validateRange(2, Option2) ->
      atom_number(Option2, Option),
      redirectGameMode(Option),
      !
  ; 
    getMenu(1),
    !
  ).

redirectGameMode(1) :-
  presentsNamePlayer1(Player1),
  getNamePlayer(Player1, NamePlayer1),
  presentsNamePlayer2(Player2),
  getNamePlayer(Player2, NamePlayer2),
  createStack(4, Stack),
  gameLoop(Stack, 0, NamePlayer1, NamePlayer2).

redirectGameMode(2) :-
  presentsChallenges(Challenges),
  createDifficulty(Challenges).

getMenu(2) :-
  call(presentsChallengesTypes, PresentsCT),
  call(challengeTypes, ChallengeT),
  drawHintGenie(PresentsCT, ChallengeT),
  input(_),
  call(presentsMainChallenge, Challenges),
  mainMenu(Challenges).

getMenu(3) :-
  call(presentsChallengesPerforms, PresentsCP),
  call(performsChallenge, PerformsC),
  drawHintGenie(PresentsCP, PerformsC),
  input(_),
  call(presentsMainPerforms, Performs),
  mainMenu(Performs).

getMenu(4) :-
  call(presentsWithdrawal, PresentsW),
  drawStartGenie(PresentsW),
  halt.

getNamePlayer(Phrase, Name) :-
  drawStartGenie(Phrase),
  input(Name3),
  atom_string(Name3, Name2),
  (
    validateName(Name2) -> 
      Name = Name2,
      true, 
      !
  ; 
    presentsNameError(NameError),
    getNamePlayer(NameError, Name),
    !
  ).

createDifficulty(Phrase) :-
  challengesMenuTitle(Title),
  challengesMenuOptions(Options),
  drawMenuGenie(Phrase, Title, Options),
  input(Difficulty2),
  (validateRange(3, Difficulty2) ->
    atom_number(Difficulty2, Difficulty),
    call(presentsNamePlayer, PhraseNamePlayer),
    getNamePlayer(PhraseNamePlayer, Name),
    createStack(Difficulty, Stack),
    gameLoop(Stack, Difficulty, Name, ""), !
  ;
    call(presentsValidEntry, PhraseValidEntry),
    createDifficulty(PhraseValidEntry), !
  ),
  !.

createStack(1, Stack) :-
  getStacks(10, 3, Stack).

createStack(2, Stack) :-
  getStacks(15, 4, Stack).

createStack(3, Stack) :-
  getStacks(20, 5, Stack).

createStack(4, Stack) :-
  getStacks(15, 5, Stack).

getStacks(Coins, 1, [Coins]) :- !.

getStacks(Coins, Stacks, R) :-
    Lim is (Coins div Stacks) + 1,
    random(2, Lim, Take),
    RestCoins is Coins - Take,
    RestStacks is Stacks - 1,
    getStacks(RestCoins, RestStacks, R2),
    R = [Take|R2]. 
