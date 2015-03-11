/* Cas '-' */
tiret(DIZAINE) :- 
	(DIZAINE > 1) -> true;
	false
.
 
/* Cas 'et' */
et(UNITE, DIZAINE) :-
	(UNITE =:= 1 , DIZAINE \= 8;
	UNITE =:= 11, DIZAINE == 7) -> true;
	false
.

/* Cas none */
none(UNITE) :-
	(UNITE =:= 0) -> true;
	false
.

liaison(UNITE, DIZAINE, LIAISON) :-
	none(UNITE) -> LIAISON = '' ;
	et(UNITE, DIZAINE) -> LIAISON = ' et ' ;
	tiret(DIZAINE) -> LIAISON = '-' ;
	LIAISON = ''
.