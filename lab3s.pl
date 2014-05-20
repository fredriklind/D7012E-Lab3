% Unsafe if Fox and Goose or Goose and beans are left alone.
safe([M,F,G,B]):- not((M\=F,F=G);(M\=G,G=B)).

% Go from west to east, and vice versa.
i(e,w).
i(w,e).

% Move either Fox, Goose or man either west or east.
move([X,X,G,B],[Y,Y,G,B],f,Y):- i(X,Y). % Fox
move([X,F,X,B],[Y,F,Y,B],g,Y):- i(X,Y). % Goose
move([X,F,G,X],[Y,F,G,Y],b,Y):- i(X,Y). % Beans
move([X|T],[Y|T],m,Y):- 		i(X,Y). % Man

% Goal, everything at Destination
solvefgb([D,D,D,D],D,_,[]).
solvefgb(State,Dest,N,[(Moved,To)|Trace]):-
	N>0,
	move(State,NewState,Moved,To),
	safe(NewState),
	solvefgb(NewState,Dest,N-1,Trace).