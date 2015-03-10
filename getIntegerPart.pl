getIntegerPart(NUMBER, X) :-
	
	atom_number(NUMBER, NBR),
	E is NBR,
	UNIT is (E mod 10),
	CENTAINE is (E // 100),
	DIZAINE is (E-(100 * CENTAINE)) // 10,
	
	
	/* Si la dizaine est 10, 70 et 90 alors l'unité sera onze, douze etc */
	(
		((DIZAINE =:= 1) ; (DIZAINE =:= 7) ; (DIZAINE =:= 9)) -> UNITE is (UNIT + 10)
	;
		UNITE = UNIT
	),
	
	/* Condition Grammaticale de la lisaison */
	(
		(UNITE =:= 0) -> LIAISON = ''
	;
		(UNITE =:= 1, DIZAINE \= 8) -> LIAISON = ' et '
	;
		(UNITE =:= 11, DIZAINE == 7) -> LIAISON = ' et '
	;
		(DIZAINE > 1) -> LIAISON = '-'
	;
		LIAISON = ''
	),
	
	/* Récupération du mot correspondant à la bonne dizaine */
	(
		/* Si la dizaine est nulle ne récupérer que l'unité */
		(DIZAINE =:= 0) -> 
			number(UNITE, R),
			RESULTAT = R
	;
		/* Si la dizaine est 10 alors récupérer UNITE, précédemment incrémentée de 10 (ex: 2 devient 12) */
		(DIZAINE =:= 1) -> 
			number(UNITE, UN),
			atom_concat(UN, LIAISON, RESULTAT)
	;
		/* Si la dizaine est 70 ou 90 alors récupérer la dizaine - 1 */
		(DIZAINE =:= 7 ; DIZAINE =:= 9) ->
			DIZ is (DIZAINE -1)*10,
			number(DIZ, DI),
			number(UNITE, UN),
			atom_concat(DI, LIAISON, V), 
			atom_concat(V, UN, RESULTAT)
	;
		UNITE > 0 -> 
			DIZ is DIZAINE * 10,
			number(DIZ, DI),
			number(UNITE, UN),
			atom_concat(DI, LIAISON, V), 
			atom_concat(V, UN, RESULTAT)
	;	
		DIZ is DIZAINE * 10,
		number(DIZ, R),
		RESULTAT = R
	),
	
	/* Récupération du terme avec la centaine correspondante */
	(
		(CENTAINE =:= 1 , (E mod 100) > 0) -> 
			number(100, CE),
			atom_concat(CE, ' ', C),
			atom_concat(C, RESULTAT, FINAL_RESULT)
	;
		(CENTAINE =:= 1 ,(E mod 100) =:= 0) -> 
			number(100, CE),
			FINAL_RESULT = CE
	;
		(CENTAINE > 1, (E mod 100) > 0) -> 
			number(CENTAINE, CE),
			number(100, C),
			atom_concat(CE, ' ', C1),
			atom_concat(C1, C, C2),
			atom_concat(C2, ' ', C3),
			atom_concat(C3, RESULTAT, FINAL_RESULT)
	;
		/* cent prend un s dans le cas : */
		(CENTAINE > 1, (E mod 100) =:= 0) -> 
			number(CENTAINE, CE),
			number(100, C),
			atom_concat(CE, ' ', C1),
			atom_concat(C1, C, C2),
			atom_concat(C2, 's ', FINAL_RESULT)
	;
		FINAL_RESULT = RESULTAT
	
	),   
	
	X = FINAL_RESULT
.