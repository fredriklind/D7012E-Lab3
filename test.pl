male(james1).
male(charles1).
male(charles2).
male(james2).
male(george1).

female(catherine).
female(elizabeth).
female(sophia).

parent(charles1, james1).
parent(elizabeth, james1).
parent(charles2, charles1).
parent(catherine, charles1).
parent(james2, charles1).
parent(sophia, elizabeth).
parent(george1, sophia).

mother(M,X):-
	female(M),
	parent(X,M).

father(F,X):-
	male(F),
	parent(X,F).

sibling(X,Y):-
	parent(X,Z),
	parent(Y,Z).

sister(X,Y):-
	female(X),
	sibling(X,Y).

brother(X,Y)
