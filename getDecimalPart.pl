getDecimalPart(NUMBER, X) :-

	atom_chars(NUMBER, N_LIST),
	nb_setval('DECIMAL_RES', ''),
	nb_setval('NEED', 0),
	
	forall(member(CURR_N, N_LIST),
		(
			atom_number(CURR_N, N),
			nb_getval('NEED', NEED),
			
			(N =:= 0 , NEED =:= 0 -> 
				/* Récupération de la partie DECIMALE zone "0" */
				nb_getval('DECIMAL_RES', DECIMAL),
				atom_concat(DECIMAL, 'zéro ', D),
				nb_setval('DECIMAL_RES', D)
			; 
				nb_setval('NEED', 1)
			)
		)
	),
		
	/* Récupération de la partie DECIMALE zone "nombre" */
	nb_getval('DECIMAL_RES', DECIMAL),
	getIntegerPart(NUMBER, NUM),
	atom_concat(DECIMAL, NUM, X),
	nb_setval('DECIMAL_RES', '')
.