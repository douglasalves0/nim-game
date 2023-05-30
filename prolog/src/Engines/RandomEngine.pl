randomEngine(Stacks, R) :-
    length(Stacks, L),
    random(0, L, Rng),
    nth0(Rng, Stacks, V),
    (V =:= 0 ->
        randomEngine(Stacks, R);
        V2 is V + 1,
        Lim is min(4, V2),
        random(1, Lim, Rng2),
        R = [Rng2, Rng]
    ).
