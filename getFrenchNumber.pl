getFrenchNumber(NUMBER, C, X):-
	
	atom_number(C, COMMA),
	
	(
		COMMA =:= 1 -> 
			getDecimalPart(NUMBER, X)
			;
			getIntegerPart(NUMBER, X)
	)
.
