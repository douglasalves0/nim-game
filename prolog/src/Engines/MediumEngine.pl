:- include('RandomEngine.pl').

haveMove([]) :- false.
haveMove([X|_]) :- (X mod 4) =\= 0, !.
haveMove([_|Y]) :- haveMove(Y).

makeMove(Idx,[X|_], [V, Idx]) :-
    V is X mod 4,
    V =\= 0,
    !.

makeMove(Idx, [_|Y], R) :- 
    Idx2 is Idx + 1,
    makeMove(Idx2, Y, R).

mediumEngine(Stacks, R) :- 
    haveMove(Stacks),
    makeMove(0, Stacks, R),!.

mediumEngine(Stacks, R) :- randomEngine(Stacks, R).
