:- module(helpeFunctions, [notEqual/4, getLast/2, count/3, repetition/3, move/3, removeLast/3, isMember/2, printSol/1, listOfSolution/5, maxmum/3, getListOfMax/4, matriex/3, transportMatriex/3]).
:- use_module(part1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
matriex(Rows, Column, List):-
row(-1,0,_, Rows, Column,[], List),!.

row(Temp,R,_,Rows,Column,List, Newlist):- % 0, 0
NewR is R + 1,
NewC is Temp + 1,
NewTemp is NewC,
column(NewTemp,NewR, 0, Rows, Column, List, Newlist). % 0, 1

column(R,_, _, R, _, List, List).
column(Temp,R, C, Row, Column, List, NewList):-
NewC is Column - 1,
C = NewC,
row(Temp,R,0,Row,Column,List, NewList).

column(Temp, R, C, Rows, Column, List,Newlist):- % 2, 1
C1 is C + 1,
C2 is C + 2,
P1 = (R,C1), %
P2 = (R,C2),
append(List,[[P1,P2]],List2), % [[(1,1),(2,1)], [(2,1), (2,2)]]
column(Temp, R, C1, Rows, Column, List2,Newlist). % 2,1



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
transportMatriex(Rows, Column, List):-
tColumn(-1, _, 0, Rows, Column,[], List),!.

tColumn(Temp,_,C,Rows,Column,List, Newlist):-
NewC is C + 1,
NewR is Temp + 1,
NewTemp is NewR,
tRow(NewTemp, 0, NewC, Rows, Column, List, Newlist).

tRow(C, _, _, _, C, List, List).
tRow(Temp, R, C, Row, Column, List, NewList):-
NewR is Row - 1,
R = NewR,
tColumn(Temp,0,C,Row,Column,List, NewList).

tRow(Temp, R, C, Rows, Column, List,Newlist):-
R1 is R + 1,
R2 is R + 2,
P1 = (R1,C),
P2 = (R2,C),
append(List,[[P1,P2]],List2),
tRow(Temp, R1, C, Rows, Column, List2,Newlist).

%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
getLast([T],T).
getLast([_|T],Last):-
getLast(T,Last).

count(Count,[],Count):-!.
count(Count,[_|T],R):-
NewCount is Count + 1,
count(NewCount, T, R).


%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
repetition(Count,[], Count):-!.
repetition(Count,[[_,H2], [H3,_]|T], R):-
H2 = H3,
NewCount is Count + 1,
List = [[H3,H2]|T],
repetition(NewCount, List, R).

repetition(Count,[[_,_]|T], R):-
repetition(Count, T, R).


%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
move([[H1,H2],[_,_]|_],List,NewList):-
append(List,[[H1,H2]],NewList).

move([[_,_],[H3,H4]|_],List,NewList):-
append(List,[[H3,H4]],NewList).
isMember(H1, [[H1,_]|_]):-!.
isMember(H2, [[_,H2]|_]):-!.

isMember(Place, [[_,_]|T]):-
isMember(Place, T).

%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
removeLast([_],List,List).
removeLast([H|T],List,NewList):-
append(List,[[H]],List2),
removeLast(T,List2,NewList),!.

%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
printSol([]):-nl,!.
printSol([H|T]):-!,
write(H),nl,
printSol(T).

%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
listOfSolution(Bombs1, Bombs2,Rows, Column,NewList):-
listOfSolution(Bombs1, Bombs2,Rows, Column,[], NewList),!.

listOfSolution(Bombs1, Bombs2,Rows, Column,List, NewList):-
part1(Bombs1, Bombs2,Rows, Column, List2),
not(member(List2, List)),
append(List,[List2],List3),
listOfSolution(Bombs1, Bombs2,Rows, Column,List3, NewList).

listOfSolution(_, _,_, _, List, List).


%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
maxmum(Max,[],Max):-!.
maxmum(Max, [H|T], R):-
count(0, H, Count),
Count > Max,
maxmum(Count, T, R).

maxmum(Max, [_|T], R):-
maxmum(Max, T, R).


%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
getListOfMax(_, [],  List, List):-!.
getListOfMax(Max, [H|T], List, ListOfMax):-
count(0,H,Count),
Count = Max,
append(List,[H],NewList),
getListOfMax(Max, T, NewList, ListOfMax).

getListOfMax(Max, [_|T], List, ListOfMax):-
getListOfMax(Max, T, List, ListOfMax).


%%%%%%%%%%%%%%%%%%%%%%%%
notEqual(H2,H3,H4,H5):- H2\= H3 ; H4 \= H5,!.















