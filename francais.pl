/* Dans le cas 10, 70 et 90 l'unité prend 10 ex: 1 -> 11 */
moreTen(DIZAINE) :-
	(DIZAINE =:= 1) ; (DIZAINE =:= 7) ; (DIZAINE =:= 9) -> true;
	false
.
/* Retourne l'unité */
getUnite(DIZAINE, UNITE, NEW_UNITE) :-
	moreTen(DIZAINE) -> NEW_UNITE is (UNITE + 10) 
	;
	NEW_UNITE is UNITE
.

/* Dans le 70 et 90, la dizaine prend -1, ex: 90 -> 80 */
lessOne(DIZAINE) :-
	(DIZAINE =:= 7) ; (DIZAINE =:= 9) -> true;
	false
.

/* Condition grammatical pour la mise au pluriel de cent */
pluralCent(CENTAINE, E):-
	(CENTAINE > 1, (E mod 100) =:= 0) -> true;
	false
.




