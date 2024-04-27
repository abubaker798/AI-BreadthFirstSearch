:- use_module(helpeFunctions).


part2(Bombs1, Bombs2, Rows, Column,_):-
part2(Bombs1, Bombs2, Rows, Column).


part2(Bombs1, Bombs2, Rows, Column):-
listOfSolution(Bombs1, Bombs2, Rows, Column, ListSol),
maxmum(0, ListSol, Max),
getListOfMax(Max, ListSol, [], ListOfMax),
printSol(ListOfMax),!.
