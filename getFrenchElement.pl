getFrenchElement(E):-
	RESULT,
	
	/* Si le caract�re est un op�rateur */
	(
		isOperator(E)) -> addToFinalVariable(E);
		getFrenchNumber(E)
	)
.
