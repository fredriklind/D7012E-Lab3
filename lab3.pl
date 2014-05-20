del(X, [X | Tail], Tail).
del([], [X], [X]).
del(X, [Y | Tail], [Y | Tail1]):-
del(X, Tail, Tail1).

insert([],L,L).
insert(X,List, BiggerList):-
del(X,BiggerList, List).

safe2([s1,s2]):-
	safe(s1), safe(s2).

safe([]).
safe([_]).
safe(L):-
	member(m,L).


s([W,E],[W3,E3],X, e):-
	del(m,W,W2),
	del(X,W2,W3),
	del(X,E2,E),
	del(m,E3,E2).

s([W,E],[W3,E3],X, w):-
	del(m,E,E2),
	del(X,E2,E3),
	del(X,W,W2),
	del(m,W3,W2).

solvefgb(State,Dest,N,(Mvd,Dir)|Trace):-
	N>0,
	s(State,NewState,Mvd,Dir),
	safe2(NewState),
	N1 is N-1,
	solvefgb(NewState,Dest,N1,Trace).

% solve([[f,b,g],[]],Solution)