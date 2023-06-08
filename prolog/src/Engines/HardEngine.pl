:- include('RandomEngine.pl').

xorMod4([], B, B).
xorMod4([H | T], B, X) :-
	UB is B xor (H mod 4),
	xorMod4(T, UB, X).

move([H | T], [V, Idx], I, X) :-
    (
        H-1 >= 0, X xor H xor (H-1) =:= 0, V is 1, Idx is I;
        H-2 >= 0, X xor H xor (H-2) =:= 0, V is 2, Idx is I;
        H-3 >= 0, X xor H xor (H-3) =:= 0, V is 3, Idx is I
    );
    move(T, [V, Idx], I+1, X).

hardEngine([H | T], [V, Idx]) :-
    xorMod4([H | T], 0, 0),
    randomEngine([H | T], [V, Idx]),
    !.

hardEngine([H | T], [V, Idx]) :-
    xorMod4([H | T], 0, X),
    X \= 0,
    move([H | T], [V, Idx], 0, X),
    !.
