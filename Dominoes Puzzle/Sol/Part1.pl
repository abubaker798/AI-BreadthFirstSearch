:- module(part1, [part1/5]).
:- use_module(getSolution).
:- use_module(mix).

part1(Bombs1, Bombs2,Rows, Column, NewList):-
solution(Bombs1, Bombs2,Rows, Column, List),
possible(Bombs1, Bombs2,Rows, Column,List,NewList).

possible(_, _,_, _,Solution,NewSolution):-
Solution \= [],
NewSolution = Solution.

possible(Bombs1, Bombs2,Rows, Column,[],Solution):-
mix(Bombs1, Bombs2, Rows, Column,Solution).






















