:- include('../Interface/StringsAndCommand.pl').

isValidPlay(_, IndexStack, _, Msg) :- (atom_number(IndexStack, _) -> false; presentsValidEntry(Msg), !).

isValidPlay(_, IndexStack2, StackList, Msg) :- 
  atom_number(IndexStack2, IndexStack),
  length(StackList, L),
  ((IndexStack >= 1 , IndexStack =< L) -> false ; presentsValidEntryStack(Msg), !).

isValidPlay(CoinsQuantity, _, _, Msg) :- (atom_number(CoinsQuantity, _) -> false; presentsValidEntryPositive(Msg), !).

isValidPlay(CoinsQuantity2, _, _, Msg) :- 
  atom_number(CoinsQuantity2, CoinsQuantity),
  ((CoinsQuantity > 0 , CoinsQuantity < 4) -> false; presentsValidEntryCoins(Msg), !).

isValidPlay(CoinsQuantity2, IndexStack2, StackList, Msg) :-
  atom_number(IndexStack2, IndexStack),
  atom_number(CoinsQuantity2, CoinsQuantity),
  Index2 is IndexStack - 1,
  nth0(Index2, StackList, V),
  (V >= CoinsQuantity -> false; presentsValidEntryStackCoins(Msg), !).

isValidPlay(_,_,_,"").
