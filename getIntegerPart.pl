getIntegerPart(NUMBER, X) :-
	
	nb_setval('FINAL_UNITE', ''),
	nb_setval('FINAL_DIZAINE', ''),
	nb_setval('FINAL_CENTAINE', ''),
	nb_setval('FINAL_LIAISON', ''),

	atom_number(NUMBER, NBR),
	E is NBR,
	UNITE is (E mod 10),
	CENTAINE is (E // 100),
	DIZAINE is (E-(100 * CENTAINE)) // 10,
	
	
	getUnite(DIZAINE, UNITE, NEW_UNITE),
	
	liaison(NEW_UNITE, DIZAINE, LIAISON),
	nb_setval('FINAL_LIAISON', LIAISON),
		
	/* Récupération de l'unité si elle n'est pas nulle */
	unite(NEW_UNITE, DIZAINE, CENTAINE),
	
	/* Récupération du mot correspondant à la bonne dizaine */
	getDizaine(DIZAINE, NEW_DIZAINE),
	dizaine(NEW_DIZAINE, NEW_UNITE),
	
	/* Récupération du terme avec la centaine correspondante */
	centaine(CENTAINE, E),   
	
	
	nb_getval('FINAL_UNITE', FINAL_UNITE),
	nb_getval('FINAL_DIZAINE', FINAL_DIZAINE),
	nb_getval('FINAL_CENTAINE', FINAL_CENTAINE),
	nb_getval('FINAL_LIAISON', FINAL_LIAISON),
	
	atom_concat(FINAL_CENTAINE, FINAL_DIZAINE, FINAL_1),
	atom_concat(FINAL_1, FINAL_LIAISON, FINAL_2),
	atom_concat(FINAL_2, FINAL_UNITE, FINAL_RESULT),
	
	
	X = FINAL_RESULT
.