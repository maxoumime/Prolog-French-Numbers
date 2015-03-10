getFrenchNumber(NUMBER, C, X):-
	consult('getDecimalPart.pl'),
	consult('getIntegerPart.pl'),
	
	atom_number(C, COMMA),
	
	(
		COMMA =:= 1 -> 
			getDecimalPart(NUMBER, X)
			;
			getIntegerPart(NUMBER, X)
	)
.
