:- use_module(library(clpfd)).

validateRange(Size, Option) :-
  number(Option),
  Option >= 1,
  Option =< Size.

validateRange(_, Option) :-
  \+ number(Option).


validateName(Name) :-
  Name \= "".