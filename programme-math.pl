containsBothOperatorNumber(E):-
	consult('francais.pl'),

	/* "Explose" l'expression E en atomes */
	atom_chars(E, E_LIST),
	writeln(E_LIST),
	
	nb_setval('CURR_ELEMENT', ''),
	nb_setval('FINAL_LIST', []),
	
	/* Parcours de chaque caractères */
	forall(member(CHAR, E_LIST),
		(
			(isOperator(CHAR)) -> 
				/* Récupération de CURR_ELEMENT dans C */
				nb_getval('CURR_ELEMENT', CURR),
		
				/* Récupération de FINAL_LIST */
				nb_getval('FINAL_LIST', FINAL_L),
					
				/* Transformation de C en CLIST */
				atom_codes(CURR_LIST, CURR),
					
				/* Ajout de CLIST dans L, le résultat étant R */
				append(FINAL_L, CURR_LIST, R),
				R_LIST=[R],
	
				/* Ajout de R et CHAR dans L */
				CHAR_LIST = [CHAR],
				append(R_LIST, CHAR_LIST, LIST),
					
				nb_setval('FINAL_LIST', LIST),	
				nb_setval('CURR_ELEMENT', '')
			;
				/* Récuperer le CHAR et le mettre dans CURR_ELEMENT à la suite */
				nb_getval('CURR_ELEMENT', X),				
				string_concat(X, CHAR, RES),
				nb_setval('CURR_ELEMENT', RES),				
			true		
		)
	),
	
	/* Ajout du dernier elment */
	nb_getval('CURR_ELEMENT', CURR),

	/* Récupération de FINAL_LIST */
	nb_getval('FINAL_LIST', FINAL_L),

	/* Transformation de C en CLIST */
	atom_codes(CURR_LIST, CURR),

	/* Ajout de CLIST dans L, le résultat étant R */
	append(FINAL_L, CURR_LIST, RE),
	nb_setval('FINAL_LIST', RE),	

	
	flatten(F, FFLATTEN),
	nb_setval('FINAL_LIST', FFLATTEN),
	
	
	nb_getval('FINAL_LIST', F),	
	write('Resultat FINAL : '),
	writeln(FFLATTEN)
.
	
