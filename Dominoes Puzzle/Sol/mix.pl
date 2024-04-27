:- module(mix, [mix/5]).
:- use_module(allHorizontal).
:- use_module(allVertical).
:- use_module(horizontal).
:- use_module(vertical).

mix(Bombs1, Bombs2, Rows, Column, NewList):-
allHorizontal(Bombs1, Bombs2, Rows, Column, Horiz),
mix(0,Bombs1, Bombs2, Rows, Column,Horiz, _, NewList).


mix(1,_,_, _, _, _,List,List).

mix(_,Bombs1, Bombs2, Rows, Column, [],_,NewList):-
allVertical(Bombs1, Bombs2, Rows, Column, [H|_]),
vertical(Bombs1, Bombs2, H, Rows, Column, Vertic),
horizontal(Bombs1, Bombs2,Vertic,Rows, Column, NewList).

mix(_,Bombs1, Bombs2, Rows, Column,[H|T],_,NewList):-
vertical(Bombs1, Bombs2,H,Rows, Column, Vertic),
Vertic \= [H],
horizontal(Bombs1, Bombs2,Vertic,Rows, Column, List),
mix(1,Bombs1, Bombs2, Rows, Column,T,List,NewList).


mix(_,Bombs1, Bombs2, Rows, Column,[H|T],_,NewList):-
vertical(Bombs1, Bombs2,H,Rows, Column, Vertic),
Vertic = [H],
mix(0,Bombs1, Bombs2, Rows, Column,T,_,NewList).




