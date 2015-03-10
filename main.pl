full_words(E):-
	consult('francais.pl'),
	consult('constructElementsList.pl'),
	consult('getFrenchNumber.pl'),
	
	nb_setval('FINAL_TRADUCTION', ''),
	nb_setval('COMMA_BEFORE', 0),
	
	constructElementsList(E, ELEMENTS),
	
	forall(member(EL, ELEMENTS),
	/*Pour chaque element "EL" de "ELEMENTS" */
		(
			nb_getval('FINAL_TRADUCTION', CURR),
			nb_getval('COMMA_BEFORE', COM),
			atom_number(COMMA, COM),
			
			(isOperator(EL) -> 
				operator(EL, OP),
				atom_concat(CURR, OP, R),
				atom_concat(R, ' ', RESULT)				
			;
			isComma(EL) -> 
				comma(EL, CO),
				atom_concat(CURR, CO, R),
				atom_concat(R, ' ', RESULT),				
				nb_setval('COMMA_BEFORE', 1)
			;
				getFrenchNumber(EL, COMMA, NB),
				atom_concat(CURR, NB, R),
				atom_concat(R, ' ', RESULT),
				nb_setval('COMMA_BEFORE', 0)
			),	
			nb_setval('FINAL_TRADUCTION', RESULT)
		)
	),
	nb_getval('FINAL_TRADUCTION', R),
	print(R)
.
