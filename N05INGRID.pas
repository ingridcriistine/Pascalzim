Program N05INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{Faça um programa que leia uma série de no máximo 50 nomes (30 caracteres), com as respectivas notas de uma disciplina qualquer 
(vai ler o nome e depois a nota do nome lido) encerrada por nome igual a “FIM” (que não deve fazer parte da lista), colocando-os 
(nome e nota) em um vetor (usar o conceito de registro). Após o encerramento da leitura, mostrar os nomes lidos com as respectivas 
notas, menores ou iguais a LUIZ SALGADO, em ordem alfabética crescente (A ? menor ou igual a LUIZ SALGADO) e os nomes maiores que 
LUIZ SALGADO, em ordem alfabética decrescente (Z ? menor que LUIZ SALGADO).}

USES TARDENOITE;

TYPE
  SERIE=RECORD
    NOME:STRING[30];
    NOTA:INTEGER;
  END;
  
VAR VET:ARRAY[1..50] OF SERIE;
  	MENOR:ARRAY[1..50] OF SERIE;
  	MAIOR:ARRAY[1..50] OF SERIE;
    A,B,C,NOTALIDA,CMAIOR,CMENOR:INTEGER;
    AUX:SERIE;
    NOMELIDO:STRING[30];
    TROCA:BOOLEAN;
    REF:STRING[30];
    
BEGIN
	 
	 WRITE('NOME==>');
	 READLN(NOMELIDO);
	 NOMELIDO:=UPCASE(NOMELIDO) ;
	 
	 //Se o nome digitado for igual a FIM, o programa encerra. Se não, digitar nota.
	 WHILE(NOMELIDO<>'FIM') DO
		  BEGIN
			   C:=C+1;
				 VET[C].NOME:=NOMELIDO;
				 LEIA('NOTA=>',NOTALIDA);
				 VET[C].NOTA:=NOTALIDA;
			   WRITE('NOME=>');
			   READLN(NOMELIDO);
			   NOMELIDO:=UPCASE(NOMELIDO) ;
			END;
	
	 REF:='LUIZ SALGADO';		
	 
	 //verifica se o nome digitado é menor ou maior que LUIZ SALGADO
	 FOR A:=1 TO C DO
	 	BEGIN 
			 IF(VET[A].NOME<=REF)THEN
			 		BEGIN
				  	CMENOR:=CMENOR+1;
				  	MENOR[CMENOR].NOME:=VET[A].NOME;
				  	MENOR[CMENOR].NOTA:=VET[A].NOTA;				  	
				  END
				  
			 ELSE
			  	BEGIN
			 			CMAIOR:=CMAIOR+1;
			 			MAIOR[CMAIOR].NOME:=VET[A].NOME;
			 			MAIOR[CMAIOR].NOTA:=VET[A].NOTA;
			 		END;
			END;
	 
	//ordena os nomes
	 REPEAT
		  TROCA:=TRUE;
				 		
			FOR A:=1 TO CMENOR-1 DO 
				 IF(MENOR[A].NOME>MENOR[A+1].NOME)THEN
					  BEGIN
							 AUX:=MENOR[A];
							 MENOR[A]:=MENOR[A+1];
							 MENOR[A+1]:=AUX;
							 TROCA:=FALSE;
						END;
				
			FOR A:=1 TO CMAIOR-1 DO 
			 IF(MAIOR[A].NOME<MAIOR[A+1].NOME)THEN
				  BEGIN
						 AUX:=MAIOR[A];
						 MAIOR[A]:=MAIOR[A+1];
						 MAIOR[A+1]:=AUX;
						 TROCA:=FALSE;
					END;			
	 UNTIL TROCA;   
		
		//mostra a sequência de nomes na tela de acordo com os critérios de ordenação	
		FOR B:=1 TO CMENOR DO
	 		BEGIN
				WRITELN(MENOR[B].NOME:50,'  ',MENOR[B].NOTA:4);
			END;
			
		FOR B:=1 TO CMAIOR DO
	 		BEGIN
	 			WRITELN(MAIOR[B].NOME:50,'  ',MAIOR[B].NOTA:4);
			END;		 

	 TERMINE;
End.