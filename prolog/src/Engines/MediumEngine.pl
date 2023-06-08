:- include('RandomEngine.pl').

haveMove([], false) :- !.
haveMove([X|_], true) :- (X mod 4) =\= 0, !.
haveMove([_|Y], R) :- haveMove(Y, R).

makeMove(Idx,[X|_], [V, Idx]) :-
    V is X mod 4,
    V =\= 0,
    !.

makeMove(Idx, [_|Y], R) :- 
    Idx2 is Idx + 1,
    makeMove(Idx2, Y, R).

mediumEngine(Stacks, R) :- 
    haveMove(Stacks, true),
    makeMove(0, Stacks, R),!.

mediumEngine(Stacks, R) :-
    randomEngine(Stacks, R).
