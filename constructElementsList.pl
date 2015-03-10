constructElementsList(E, X):-
	consult('francais.pl'),
	
	/* "Explose" l'expression E en atomes */
	atom_chars(E, E_LIST),
	write('Liste des caract�res transmis : '),
	writeln(E_LIST),
	
	nb_setval('CURR_ELEMENT', ''),
	nb_setval('FINAL_LIST', []),
	
	/* Parcours de chaque caract�res */
	write('Analyse en cours '),
	forall(member(CHAR, E_LIST),
		(
			write('>> '),
			(isOperator(CHAR)) -> RES = operator(CHAR, _),
				/* R�cup�ration de CURR_ELEMENT dans CURR */
				nb_getval('CURR_ELEMENT', CURR),
				
				/* R�cup�ration de FINAL_LIST */
				nb_getval('FINAL_LIST', FINAL_L),
				
				/* Transformation de CURR en CURR_LIST */
				atom_codes(CURR_LIST, CURR),
					
				/* Ajout de CURR_LIST dans FINAL_L, le r�sultat �tant R */
				append(FINAL_L, CURR_LIST, R),
				R_LIST=[R],
	
				/* Ajout de R_LIST et CHAR_LIST dans LIST */
				CHAR_LIST = [CHAR],
				append(R_LIST, CHAR_LIST, LIST),
					
				nb_setval('FINAL_LIST', LIST),	
				nb_setval('CURR_ELEMENT', '')
			;
				
			(isComma(CHAR)) -> RES = comma(CHAR, _),
				/* R�cup�ration de CURR_ELEMENT dans CURR */
				nb_getval('CURR_ELEMENT', CURR),
				
				/* R�cup�ration de FINAL_LIST */
				nb_getval('FINAL_LIST', FINAL_L),
				
				/* Transformation de CURR en CURR_LIST */
				atom_codes(CURR_LIST, CURR),
					
				/* Ajout de CURR_LIST dans FINAL_L, le r�sultat �tant R */
				append(FINAL_L, CURR_LIST, R),
				R_LIST=[R],
	
				/* Ajout de R_LIST et CHAR_LIST dans LIST */
				CHAR_LIST = [CHAR],
				append(R_LIST, CHAR_LIST, LIST),
					
				nb_setval('FINAL_LIST', LIST),	
				nb_setval('CURR_ELEMENT', ''),
				nb_setval('COMMA', true)
			;
				/* R�cuperer le CHAR et le mettre dans CURR_ELEMENT � la suite */
				nb_getval('CURR_ELEMENT', X),
				string_concat(X, CHAR, RES),
				nb_setval('CURR_ELEMENT', RES),	
				nb_setval('COMMA', false),				
			true		
		)
	),
	
	/* Ajout du dernier elment */
	nb_getval('CURR_ELEMENT', CURR),
	
	/* R�cup�ration de FINAL_LIST */
	nb_getval('FINAL_LIST', FINAL_L),

	/* Transformation de CURR en CURR_LIST */
	atom_codes(CURR_LIST, CURR),

	/* Ajout de CURR_LIST dans FINAL_L, le r�sultat �tant RES */
	append(FINAL_L, CURR_LIST, RES),
	nb_setval('FINAL_LIST', RES),	
	
	flatten(RES, FFLATTEN),
	nb_setval('FINAL_LIST', FFLATTEN),
	
	nb_getval('FINAL_LIST', F),	
	writeln('Fin analyse'),
	X = F
.
	
