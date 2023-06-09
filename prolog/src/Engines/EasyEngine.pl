countPositive([], 0).
countPositive([H | T], C) :-
    H > 0,
    countPositive(T, R),
    C is R + 1.
    
countPositive([H | T], C) :-
    H =< 0,
    countPositive(T, C).
	
smallPositiveIdx(List, Index) :-
    smallPositiveIdxH(List, 0, -1, -1, Index).

smallPositiveIdxH([], _, _, SIdx, Idx) :- Idx is SIdx.
smallPositiveIdxH([H | T], CIdx, CS, SIdx, Idx) :-
    H > 0,
    (CS =:= -1; H < CS),
    smallPositiveIdxH(T, CIdx+1, H, CIdx, Ans), Idx is Ans, !;
    smallPositiveIdxH(T, CIdx+1, CS, SIdx, Ans), Idx is Ans, !.

min(A, B, Min) :-
    A =< B,
    Min is A.
min(A, B, Min) :-
    A > B,
    Min is B.

easyEngine(L, [V, Idx]) :-
    countPositive(L, C),
    smallPositiveIdx(L, Idx),
    nth0(Idx, L, Target),
    (
        C > 1,
        min(Target, 3, R),
        V is R,
        !;
        Target > 3,
        V is 1,
        !;
        V is Target,
        !
    ).
