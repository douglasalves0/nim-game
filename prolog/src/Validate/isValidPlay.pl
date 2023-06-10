:- include('../Interface/StringsAndCommands').

isValidPlay(CoinsQuantity, IndexStack, StackList, Msg):-
  number(IndexStack) -> Msg is presentsValidEntryNumber,
  number(CoinsQuantity) Msg is presentsValidEntryPositive,
  CoinsQuantity > 3 -> Msg is presentsValidEntryCoins,
  CoinsQuantity < 1 -> Msg is presentsValidEntryCoins,

  nth0(IndexStack, StackList, V),
  V <= CoinsQuantity -> Msg is presentsValidEntryStackCoins,

  nonvar(Msg) -> Msg is "" ; true.
  
