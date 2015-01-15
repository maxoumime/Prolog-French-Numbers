number(1, 'un').
number(2, 'deux').
number(3, 'trois').
number(4, 'quatre').
number(5, 'cinq').
number(6, 'six').
number(7, 'sept').
number(8, 'huit').
number(9, 'neuf').
number(10, 'dix').
number(11, 'onze').
number(12, 'douze').
number(13, 'treize').
number(14, 'quatorze').
number(15, 'quinze').
number(16, 'seize').
number(17, 'dix-sept').
number(18, 'dix-huit').
number(19, 'dix-neuf').
number(20, 'vingt').
number(30, 'trente').
number(40, 'quarante').
number(50, 'cinquante').
number(60, 'soixante').
number(70, 'soixante-dix').
number(80, 'quatre-vingt').
number(90, 'quatre-vingt-dix').
number(100, 'cent').

operator(+, 'plus').
operator(-, 'moins').
operator(/, 'divisé par').
operator(*, 'multiplié par').

virgule(,).
virgule(.).

isOperator(X) :- operator(X, _).

isNumber(X) :- number(X, _).

containsComma(Y) :- 
	atom_codes(X, Y),
	atom_chars(X, CLIST),
	nb_setval('COMMA', 0),
	forall(member(C, CLIST),
		(
			(virgule(C)) -> nb_setval('COMMA', 1); true
		)
	),
	nb_getval('COMMA', RESULTAT),
	RESULTAT=:=1, !; fail
.

francaisBase(X) :- ( number(X, _), ! ); ( operator(X, _), !); fail.

francaisCharEcrit(X) :- francaisBase(X, Y), print(Y).

getFrenchNumber :- (
	
).

francais(X) :- 
	( francaisBase(X, _), francaisCharEcrit(X), ! );
	( print('HEY'), fail )
.