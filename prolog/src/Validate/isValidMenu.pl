:- use_module(library(clpfd)).

validateRange(Size, Option2) :-
  atom_number(Option2, Option),
  Option >= 1,
  Option =< Size.

validateName(Name) :-
  Name \= "", !.
