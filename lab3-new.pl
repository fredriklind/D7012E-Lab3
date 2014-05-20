
%[w,w,w,w].

unsafe([X,Y,Y,_]):-
	unsafe([X,_,Y,Y]). 
	

solvefgb(+State, +Dest, +N, -Trace):-