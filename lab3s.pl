safe([M,F,G,B]):- not((M\=F,F=G);(M\=G,G=B)).

move([w,w,G,B],[e,e,G,B],f,e). % Fox 	east
move([w,F,w,B],[e,F,e,B],g,e). % Goose 	east
move([w,F,G,w],[e,F,G,e],b,e). % Beans 	east
move([e,e,G,B],[w,w,G,B],f,w). % Fox 	west
move([e,F,e,B],[w,F,w,B],g,w). % Goose 	west
move([e,F,G,e],[w,F,G,w],b,w). % Beans 	west
move([w|T],[e|T],m,e). 		   % Man 	east
move([e|T],[w|T],m,w). 		   % Man 	west

solvefgb([D,D,D,D],D,_,[]).
solvefgb(State,Dest,N,[(M,D)|Trace]):-
	N>0,
	move(State,NewState,M,D),
	safe(NewState),
	N1 is N-1,
	solvefgb(NewState,Dest,N1,Trace).