Program N03INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{FUP que leia uma s�rie de datas, VALIDAR. O programa s� continua ap�s ler uma data v�lida. 
Assim sendo, para cada validada lida, mostrar a data lida como abaixo:
Leu 17 para o dia, 8 para o m�s e 2010 para o ano, mostrar:
CURITIBA, 17 DE AGOSTO DE 2010.
Usar um vetor de 12 posi��es para guardar o extenso dos meses.
O programa dever�, NECESSARIAMEMTE, usar os m�dulos da UNIT tardenoite.pas, ENVIADA, para 
validar as datas lidas, ler dia, m�s e ano do teclado e encerrar o programa. Ap�s mostrar 
a data com o extenso do m�s, perguntar se quer continuar com as op��es 1 (SIM), outro n�mero
(N�O).}

USES TARDENOITE;
VAR MESES:ARRAY[1..12] OF STRING = ('JANEIRO', 'FEVEREIRO', 'MARCO', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO', 'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');
	  DIA,MES,ANO,RESPOSTA:INTEGER;
Begin
	REPEAT
		LEIA('Digite o dia: ', DIA); 
		LEIA('Digite o mes: ', MES); 
		LEIA('Digite o ano: ', ANO); 
		
		IF VALDATA(DIA,MES,ANO) THEN
			BEGIN
				WRITELN('CURITIBA, ',DIA:2, ' DE ', MESES[MES], ' DE ', ANO);
				WRITE('Digite 1 para continuar ou 2 para encerrar');
				READ(RESPOSTA);
			END
		ELSE
			WRITELN('DATA INVALIDA'); 
	UNTIL(RESPOSTA>1);
End.



