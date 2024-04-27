:- module(allVertical, [allVertical/5]).
:- use_module(helpeFunctions).

allVertical(Bombs1, Bombs2,Rows, Column, NewList):-
transportMatriex(Rows, Column, List),
ignorBombs(Bombs1, Bombs2, List,[], List2),
intersection1(List2,[],NewList),!.


ignorBombs(_, _, [],List, List).
ignorBombs(Bombs1, Bombs2, [[H1,H2|_]|T],List, NewList):-
H1 \= Bombs1,
H1 \= Bombs2,
H2 \= Bombs1,
H2 \= Bombs2,
append(List,[[H1,H2]],List2),
ignorBombs(Bombs1, Bombs2, T,List2, NewList).


ignorBombs(Bombs1, Bombs2, [[_,_|_]|T],List, NewList):-
ignorBombs(Bombs1, Bombs2, T,List, NewList).


intersection1([],NewList,NewList):-!.

intersection1([[H1,H2]|L],List,NewList):-
L = [],
append(List,[[H1,H2]],NewList),!.

intersection1([[H1,H2],[H3,H4]|L],List,NewList):-
L = [],
append(List,[[H1,H2]],List2),
append(List2,[[H3,H4]],NewList),!.


intersection1([[H1,H2|_],[H3,H4|_],[H5,H6|_]|T],List,NewList):-
H2 = H3,
H4 = H5,
append(List,[[H1,H2]],List2),
append(List2,[[H5,H6]],List3),
intersection1(T,List3,NewList).

intersection1([[H1,H2|_],[H3,H4|_],[H5,H6|_]|T],List,NewList):-
notEqual(H2,H3,H4,H5),
append(List,[[H1,H2]],List2),
append(List2,[[H3,H4]],List3),
append(List3,[[H5,H6]],List4),!,
intersection1(T,List4,NewList).




