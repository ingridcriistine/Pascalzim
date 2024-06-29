Program N03INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{FUP que leia uma série de datas, VALIDAR. O programa só continua após ler uma data válida. 
Assim sendo, para cada validada lida, mostrar a data lida como abaixo:
Leu 17 para o dia, 8 para o mês e 2010 para o ano, mostrar:
CURITIBA, 17 DE AGOSTO DE 2010.
Usar um vetor de 12 posições para guardar o extenso dos meses.
O programa deverá, NECESSARIAMEMTE, usar os módulos da UNIT tardenoite.pas, ENVIADA, para 
validar as datas lidas, ler dia, mês e ano do teclado e encerrar o programa. Após mostrar 
a data com o extenso do mês, perguntar se quer continuar com as opções 1 (SIM), outro número
(NÃO).}

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



