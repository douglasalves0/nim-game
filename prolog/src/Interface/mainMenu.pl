- include('../Game/gameLoop.pl').
:- include('../GeniusDraw/DrawingFunctions.pl').
:- include('../Interface/StringsAndCommand.pl').
:- include('../Validate/isValidMenu.pl').

initGame(OpeningSentence) :-
  clearT,
  initMenuTitle(Title),
  initMenuOptions(Options),
  drawMenuGenie(OpeningSentence, Title, Options),
  read(Option),
  (
    validateRange(2, Option) ->
    (Option =:= 1 ->
      (presentsMainMenu(MainMenuMessage),
       mainMenu(MainMenuMessage))
    ;
      Option =:= 2 ->
      ( clearT,
        presentsInitialWithdrawal(WithdrawalMessage),
        drawStartGenie(WithdrawalMessage))
    )
  ;
    presentsValidEntry(ValidEntryMessage),
    initGame(ValidEntryMessage)
  ).

mainMenu(OpeningSentence) :-
  clearT,
  mainMenuTitle(Title),
  mainMenuOptions(Options),
  drawMenuGenie(OpeningSentence, Title, Options),
  read(Option),
  (validateRange(4, Option) ->
    getMenu(Option, OpeningSentence)
  ;
    (call(presentsValidEntry, ValidEntryMessage),
    mainMenu(ValidEntryMessage))
  ).

getMenu(1, OpeningSentence) :-
  clearT,
  call(presentsOpponents, PresentsOp),
  call(opponentsMenuTitle, OpponentsMT),
  call(opponentsMenuOptions, OpponentsMO),
  drawMenuGenie(PresentsOp, OpponentsMT, OpponentsMO),
  read(Option1),
  (validateRange(2, Option1) ->
     (Option1 =:= 1 ->
       call(presentsNamePlayer1, Player1),
       call(presentsNamePlayer2, Player2),
       getNamePlayer(Player1, NamePlayer1),
       getNamePlayer(Player2, NamePlayer2),
       createStack(4, Stack),
       gameLoop(Stack, 0, NamePlayer1, NamePlayer2)
     ;
       call(PresentsChallenges, challenges),
       createDifficulty(challenges)
    ),
    call(PresentsMainMenu, main),
    mainMenu(main)
  ;
    getMenu(1, OpeningSentence)
  ).

getMenu(2, OpeningSentence) :-
  clearT,
  call(presentsChallengesTypes, PresentsCT),
  call(challengeTypes, ChallengeT),
  drawHintGenie(PresentsCT, ChallengeT),
  read(Option),
  call(presentsChallenges, Challenges),
  mainMenu(Challenges).

getMenu(3, OpeningSentence) :-
  clearT,
  call(presentsChallengesPerforms, PresentsCP),
  call(performsChallenge, PerformsC),
  drawHintGenie(PresentsChallengesPerforms, PerformsC),
  read(Option),
  mainMenu(PresentsMainPerforms).

getMenu(4, OpeningSentence) :-
  clearT,
  call(presentsWithdrawal, PresentsW),
  drawStartGenie(PresentsW).

getNamePlayer(Phrase, Name) :-
  clearT,
  drawStartGenie(Phrase),
  read(user_input, Name),
  call(presentsNameError, NameError),
  (validateName(Name) -> true ; getNamePlayer(NameError, Name)).

createDifficulty(Phrase) :-
  clearT,
  challengesMenuTitle(Title),
  challengesMenuOptions(Options),
  drawMenuGenie(Phrase, Title, Options),
  read_line_to_string(user_input, Option2),
  (validateRange(3, Option2) ->
    atom_number(Option2, Difficulty),
    call(PresentsNamePlayer, PhraseNamePlayer),
    getNamePlayer(PhraseNamePlayer, Name),
    createStack(Difficulty, Stack),
    gameLoop(Stack, Difficulty, Name, "")
  ;
    call(PresentsValidEntry, PhraseValidEntry),
    createDifficulty(PhraseValidEntry)
  ).

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