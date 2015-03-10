constructElementsList(E, X):-
	consult('francais.pl'),
	
	/* "Explose" l'expression E en atomes */
	atom_chars(E, E_LIST),
	write('Liste des caractères transmis : '),
	writeln(E_LIST),
	
	nb_setval('CURR_ELEMENT', ''),
	nb_setval('FINAL_LIST', []),
	
	/* Parcours de chaque caractères */
	write('Analyse en cours '),
	forall(member(CHAR, E_LIST),
		(
			write('>> '),
			(isOperator(CHAR)) -> RES = operator(CHAR, _),
				/* Récupération de CURR_ELEMENT dans CURR */
				nb_getval('CURR_ELEMENT', CURR),
				
				/* Récupération de FINAL_LIST */
				nb_getval('FINAL_LIST', FINAL_L),
				
				/* Transformation de CURR en CURR_LIST */
				atom_codes(CURR_LIST, CURR),
					
				/* Ajout de CURR_LIST dans FINAL_L, le résultat étant R */
				append(FINAL_L, CURR_LIST, R),
				R_LIST=[R],
	
				/* Ajout de R_LIST et CHAR_LIST dans LIST */
				CHAR_LIST = [CHAR],
				append(R_LIST, CHAR_LIST, LIST),
					
				nb_setval('FINAL_LIST', LIST),	
				nb_setval('CURR_ELEMENT', '')
			;
				
			(isComma(CHAR)) -> RES = comma(CHAR, _),
				/* Récupération de CURR_ELEMENT dans CURR */
				nb_getval('CURR_ELEMENT', CURR),
				
				/* Récupération de FINAL_LIST */
				nb_getval('FINAL_LIST', FINAL_L),
				
				/* Transformation de CURR en CURR_LIST */
				atom_codes(CURR_LIST, CURR),
					
				/* Ajout de CURR_LIST dans FINAL_L, le résultat étant R */
				append(FINAL_L, CURR_LIST, R),
				R_LIST=[R],
	
				/* Ajout de R_LIST et CHAR_LIST dans LIST */
				CHAR_LIST = [CHAR],
				append(R_LIST, CHAR_LIST, LIST),
					
				nb_setval('FINAL_LIST', LIST),	
				nb_setval('CURR_ELEMENT', ''),
				nb_setval('COMMA', true)
			;
				/* Récuperer le CHAR et le mettre dans CURR_ELEMENT à la suite */
				nb_getval('CURR_ELEMENT', X),
				string_concat(X, CHAR, RES),
				nb_setval('CURR_ELEMENT', RES),	
				nb_setval('COMMA', false),				
			true		
		)
	),
	
	/* Ajout du dernier elment */
	nb_getval('CURR_ELEMENT', CURR),
	
	/* Récupération de FINAL_LIST */
	nb_getval('FINAL_LIST', FINAL_L),

	/* Transformation de CURR en CURR_LIST */
	atom_codes(CURR_LIST, CURR),

	/* Ajout de CURR_LIST dans FINAL_L, le résultat étant RES */
	append(FINAL_L, CURR_LIST, RES),
	nb_setval('FINAL_LIST', RES),	
	
	flatten(RES, FFLATTEN),
	nb_setval('FINAL_LIST', FFLATTEN),
	
	nb_getval('FINAL_LIST', F),	
	writeln('Fin analyse'),
	X = F
.
	
