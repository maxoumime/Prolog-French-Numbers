getIntegerPart(NUMBER, X) :-
	
	nb_setval('FINAL_UNITE', ''),
	nb_setval('FINAL_DIZAINE', ''),
	nb_setval('FINAL_CENTAINE', ''),
	nb_setval('FINAL_LIAISON', ''),

	atom_number(NUMBER, NBR),
	E is NBR,
	UNIT is (E mod 10),
	CENTAINE is (E // 100),
	DIZAINE is (E-(100 * CENTAINE)) // 10,
	
	
	getUnite(DIZAINE, UNIT, UNITE),
	
	liaison(UNITE, DIZAINE, LIAISON),
	nb_setval('FINAL_LIAISON', LIAISON),
	
	
	/* Récupération de l'unité si elle n'est pas nulle */
	(
		UNITE > 0 -> 
			number(UNITE, U),
			nb_setval('FINAL_UNITE', U)
		;
			nb_setval('FINAL_UNITE', '')
	),
	
	/* Récupération du mot correspondant à la bonne dizaine */
	(		
		(DIZAINE =:= 0) ; (DIZAINE =:= 1) -> 
			nb_setval('FINAL_DIZAINE', '')
		;
		lessOne(DIZAINE) ->
			REAL_DIZ is (DIZAINE -1)*10,
			number(REAL_DIZ, D),
			nb_setval('FINAL_DIZAINE', D)
		;
			REAL_DIZ is DIZAINE * 10,
			number(REAL_DIZ, D),
			nb_setval('FINAL_DIZAINE', D)
	),
	
	/* Récupération du terme avec la centaine correspondante */

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
			FINAL_CENTAINE = ''
		)
	),   
	
	
	nb_getval('FINAL_UNITE', FINAL_UNITE),
	nb_getval('FINAL_DIZAINE', FINAL_DIZAINE),
	nb_getval('FINAL_CENTAINE', FINAL_CENTAINE),
	nb_getval('FINAL_LIAISON', FINAL_LIAISON),
	
	atom_concat(FINAL_CENTAINE, FINAL_DIZAINE, FINAL_1),
	atom_concat(FINAL_1, FINAL_LIAISON, FINAL_2),
	atom_concat(FINAL_2, FINAL_UNITE, FINAL_RESULT),
	
	
	X = FINAL_RESULT
.