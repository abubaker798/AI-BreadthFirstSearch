:- module(getSolution, [solution/5]).
:- use_module(helpeFunctions).
:- use_module(allHorizontal).

solution(Bombs1, Bombs2,Rows, Column, NewList):-
allHorizontal(Bombs1, Bombs2, Rows, Column, List),
count(0,List,R),
repetition(0, List, R2),
Count is R - R2,!,
getSolution(Count,List,[],NewList).


getSolution(Count,[],List,NewList):-
count(0,List,R),
R = Count,
NewList = List.

getSolution(Count,[_|L],List,NewList):-
L = [],
count(0,List,R),
R = Count,
NewList = List.

getSolution(Count,[[H1,H2]|L],List,NewList):-
L = [],
getLast(List,[_,T2]),
H1 = T2,
removeLast(List,[],List2),
append(List2,[[H1,H2]],List3),
count(0,List,R),
R = Count,
NewList = List3,!.

getSolution(_,[[H1,H2]|L],[],NewList):-
L = [],
NewList = [[H1,H2]],!.

getSolution(_,[_],[],[]):-!.
getSolution(_,[],[],[]):-!.

getSolution(Count,[[H1,H2],[H3,H4]|T],List,NewList):-
H2 \= H3,
append(List,[[H1,H2]],List2),
append(List2,[[H3,H4]],List3),
getSolution(Count,T,List3,NewList).

getSolution(Count,[[H1,H2],[H3,H4]|T],List,NewList):-
H2 = H3,
move([[H1,H2],[H3,H4]|T],List,List2),
getSolution(Count,T,List2,NewList).

getSolution(Count,[_,_|T],List,NewList):-
getSolution(Count,T,List,NewList).




















