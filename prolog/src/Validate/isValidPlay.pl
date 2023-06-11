:- include('../Interface/StringsAndCommand.pl').

isValidPlay(_, IndexStack, _, Msg) :- (number(IndexStack) -> false; presentsValidEntryNumber(Msg), !).

isValidPlay(_, IndexStack, StackList, Msg) :- 
  length(StackList, L),
  ((IndexStack >= 1 , IndexStack =< L) -> false ; presentsValidEntryStack(Msg), !).

isValidPlay(CoinsQuantity, _, _, Msg) :- (number(CoinsQuantity) -> false; presentsValidEntryPositive(Msg), !).

isValidPlay(CoinsQuantity, _, _, Msg) :- ((CoinsQuantity > 0 , CoinsQuantity < 4) -> false; presentsValidEntryCoins(Msg), !).

isValidPlay(CoinsQuantity, IndexStack, StackList, Msg) :-
  Index2 is IndexStack - 1,
  nth0(Index2, StackList, V),
  (V >= CoinsQuantity -> false; presentsValidEntryStackCoins(Msg), !).

isValidPlay(_,_,_,"").
