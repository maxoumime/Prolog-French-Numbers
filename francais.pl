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
	(DIZAINE =:= 1) ; (DIZAINE =:= 7) ; (DIZAINE =:= 9) -> true;
	false
.
/* Retourne la dizaine */
getDizaine(DIZAINE, NEW_DIZAINE) :-
(	
	lessOne(DIZAINE) -> NEW_DIZAINE is (DIZAINE-1)
	;
	NEW_DIZAINE is DIZAINE
).


/* Condition grammatical pour la mise au pluriel de cent */
pluralCent(CENTAINE, E):-
	(CENTAINE > 1, (E mod 100) =:= 0) -> true;
	false
.

unite(UNITE) :- 
(
	UNITE > 0 -> 
		number(UNITE, U),
		nb_setval('FINAL_UNITE', U)
	;
		nb_setval('FINAL_UNITE', '')
).

dizaine(DIZAINE) :-
(
	(DIZAINE =:= 0) ; (DIZAINE =:= 1) -> 
		nb_setval('FINAL_DIZAINE', '')
	;
		REAL_DIZ is DIZAINE * 10,
		number(REAL_DIZ, D),
		nb_setval('FINAL_DIZAINE', D)
).

centaine(CENTAINE, E) :-
(	
	number(100, CENT),
	(
		(CENTAINE =:= 1) ->
			atom_concat(CENT, ' ', C),
			nb_setval('FINAL_CENTAINE', C)
		;
		(CENTAINE > 1) -> 
		(
			number(CENTAINE, NBR_CENTAINE),
			atom_concat(NBR_CENTAINE, ' ', R_1),
			atom_concat(R_1, CENT, R_2),
				
			(pluralCent(CENTAINE, E) ->
				atom_concat(R_2, 's', C),
				nb_setval('FINAL_CENTAINE', C)
			;
				atom_concat(R_2, ' ', C),
				nb_setval('FINAL_CENTAINE', C)
			)
		)
		;
			nb_setval('FINAL_CENTAINE', '')
	)
).



