:p- module(removeFromStack, [removeFromStack/5]).

removeFromStack(_, _, _, [], []).
removeFromStack(CoinsQuantity, IndexStack, Index, [H | T], [NewH | Result]):-
  Index2 is Index + 1,
  (
    Index2 =:= IndexStack -> 
      NewH is H - CoinsQuantity
    ;
      NewH is H
  ),
  removeFromStack(CoinsQuantity, IndexStack, Index2, T, Result).
