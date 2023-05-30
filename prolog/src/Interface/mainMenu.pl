getStacks(Coins, 1, [Coins]) :- !.

getStacks(Coins, Stacks, R) :-
    Lim is (Coins div Stacks) + 1,
    random(2, Lim, Take),
    RestCoins is Coins - Take,
    RestStacks is Stacks - 1,
    getStacks(RestCoins, RestStacks, R2),
    R = [Take|R2].
