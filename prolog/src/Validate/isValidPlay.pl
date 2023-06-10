:- include('../Interface/StringsAndCommand.pl').

  
isValidPlay(_, IndexStack, _, Msg) :- (number(IndexStack) -> true; presentsValidEntryNumber(Msg), !).

isValidPlay(_, IndexStack, StackList, Msg) :- 
  length(StackList, L),
  ((IndexStack >= 1 , IndexStack =< L) -> true ; presentsValidEntryStack(Msg), !).

isValidPlay(CoinsQuantity, _, _, Msg) :- (number(CoinsQuantity) -> true; presentsValidEntryPositive(Msg), !).

isValidPlay(CoinsQuantity, _, _, Msg) :- ((CoinsQuantity > 0 , CoinsQuantity < 4) -> true; presentsValidEntryCoins(Msg), !).

isValidPlay(CoinsQuantity, IndexStack, StackList, Msg) :-
  Index2 is IndexStack - 1,
  nth0(Index2, StackList, V),
  (V >= CoinsQuantity -> true; presentsValidEntryStackCoins(Msg), !).

isValidPlay(_,_,_,"").
