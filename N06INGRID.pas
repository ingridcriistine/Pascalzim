Program N06INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{O trabalho consiste em alterar o programa ARQUIVO2.PAS (ENVIADO), validando todas as informações 
que serão digitadas (algumas já foram validadas na aula), a menos do nome e do cpf. Ou seja
Validar a data lida, usando unit TARDENOITE e garantir que dia e mês tenham 2 dígitos (a data 
válida, já garante que o ano digitado tenha 4 dígitos);
Validar o cargo (entre 1 e 12, inclusive), garantindo que tenha 2 dígitos.}

USES TARDENOITE;

VAR REGIS:STRING[60];
    ARQ:TEXT;
    NUM,ANO:STRING[4];
    DIA,MES,CAR:STRING[2];
    NOME:STRING[35];
    CPF:STRING[11];
    A,B,NI,E:INTEGER;
    TOTC:INTEGER;
Begin
   ASSIGN(ARQ,'ARQUIVO1.TXT');
   APPEND(ARQ);
   
//VALIDAR O NUMERO
   REPEAT
	  WRITE('NUM=>');
    READLN(NUM);
    VAL(NUM,NI,E);//ENTREGA O STRING NUM E RECEBE OS INTEIROS NI e E
    IF (E<>0)THEN
     WRITELN('CARACTER NAO NUMERICO');
   UNTIL(E=0);
//FIM DA VALIDACAO

   WHILE (NI>0) DO
    BEGIN
		 //GARANTIR QUE O CAMPO NUM TENHA 4 DIGITOS
     TOTC:=LENGTH(NUM);
     FOR A:=1 TO 4 - TOTC DO
      INSERT('0',NUM,1);
      
		 WRITE('NOM=>');
     READLN(NOME);
     NOME:=UPCASE(NOME);
		 //GARANTIR QUE O NOME TENHA 35 CARACTERES
		 TOTC:=LENGTH(NOME);
		 FOR A:=TOTC+1 TO 35 DO
		  INSERT(' ',NOME,TOTC+1);
		  
     WRITE('CPF=>');
     READLN(CPF);
     
     WRITE('DIA=>');
     READLN(DIA);
     //GARANTIR QUE O CAMPO DIA TENHA 2 DIGITOS
     TOTC:=LENGTH(DIA);
     FOR A:=1 TO 2 - TOTC DO
      INSERT('0',DIA,1);
      
     WRITE('MES=>');
     READLN(MES);
     //GARANTIR QUE O CAMPO DIA TENHA 2 DIGITOS
     TOTC:=LENGTH(MES);
     FOR A:=1 TO 2 - TOTC DO
      INSERT('0',MES,1);
      
     WRITE('ANO=>');
		 READLN(ANO);
		 
		 WRITE('CARGO=>');
		 READLN(CAR);
		 REGIS:=NUM+NOME+CPF+DIA+MES+ANO+CAR;
		 
//VALIDAR O NUMERO
     REPEAT
	    WRITE('NUM=>');
      READLN(NUM);
      VAL(NUM,NI,E);//ENTREGA O STRING NUM E RECEBE OS INTEIROS NI e E
      IF (E<>0)THEN
       WRITELN('CARACTER NAO NUMERICO');
     UNTIL(E=0);
//FIM DA VALIDACAO

		END;
	 CLOSE(ARQ);
	 TERMINE; 
  
End.