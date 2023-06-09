:- include('EasyEngine.pl').
:- include('MediumEngine.pl').
:- include('HardEngine.pl').

%useEngine(1, Stacks, R) :- easyEngine(Stacks, R).
useEngine(2, Stacks, R) :- mediumEngine(Stacks, R).
useEngine(3, Stacks, R) :- hardEngine(Stacks, R).
