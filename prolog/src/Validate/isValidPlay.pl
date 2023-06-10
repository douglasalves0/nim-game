isValidPlay(CoinsQuantity, IndexStack, StackList):-
  number(IndexStack),
  number(CoinsQuantity),
  CoinsQuantity < 4,
  CoinsQuantity > 0,
  nth0(IndexStack, StackList, V),
  V >= CoinsQuantity.
