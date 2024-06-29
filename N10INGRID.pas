Program N10INGRID;
//Feito por Ingrid Cristine Rocha

{FUP que possibilite mostrar os dados do arquivo CAND.IND conforme abaixo:
1 – Todos os candidatos CLASSIFICADOS nos cargos em ordem alfabética ou, 
2 – Todos os candidatos em ordem de classificação por cargo ou, 
3 – Todos os candidatos em ordem de classificação geral. 
Dar as três opções para o usuário escolher uma.}

USES TARDENOITE;

VAR //arquivos
	 arq:file of regis;
	 reg:regis;
	 //outras
	 vet:vetor;
	 a,b,c,ca,cb,ind,pfi,total,op,qtd:INTEGER;
	 cargo,clgeral,clcargo,cclassi:string;
	 cargos: ARRAY[1..12] OF STRING = ('ENGANADOR DE CHEFE', 'ENROLADOR DE TRABALHO','PENSADOR','ANALISTA DE SISTEMAS','DEGUSTADOR DE CERVEJA','TECNICO EM REDES','CONTADOR DE ESTORIAS','SAI DA AULA ANTES','ACOUGUEIRO LIMPINHO','SEGURANCA DE BANHEIRO','GESTOR DE BORBOLETAS','AGENTE LEVA E TRAZ'); 
		   
    
Begin
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);
  
  WRITELN('ORDENACAO DE DADOS');
  WRITELN('1 - Todos os candidatos classificados nos cargos em ordem alfabética');
  WRITELN('2 - Todos os candidatos em ordem de classificação por cargo');
  WRITELN('3 - Todos os candidatos em ordem de classificação geral');
  LEIA('DIGITE O NUMERO DA OPCAO DESEJADA: ', OP);

  WHILE (NOT EOF(ARQ)) DO
   BEGIN
    READ(ARQ,REG);
    IND:=IND+1;
    VET[IND].PF:=PFI;      
       
    IF(OP = 1) AND (reg.ccl <> 0) THEN
    	BEGIN
    	  str(reg.ccl:4, cclassi);
		    vet[ind].cc:= cclassi + reg.nome;
      END
      
		ELSE IF(OP = 2) THEN
    	BEGIN
    		str(reg.car:4, cargo);
    		str(reg.clg:4, clgeral);
    		vet[ind].cc:= cargo + clgeral;
      END
      
    ELSE
    	BEGIN
    		str(reg.clg:3, clgeral);
    		vet[ind].cc:= clgeral;
      END;
    	
    PFI:=PFI+1;
   END;
   
//MONTADO O VETOR ORDENAMOS...
  WRITELN('LIDOS=',IND:5,' REGISTROS');
  FOR A:=1 TO 20 DO
   WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);
  TOTAL:=IND;
	ORDEM(VET,TOTAL);
  FOR A:=1 TO 20 DO
   WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);
  WRITELN('ENTER PARA CONTINUAR');
  READLN;
  
	
	CA:=0;
  CB:=0; 
  
//MOSTRA O CONTEUDO DO ARQUIVO USANDO COMO REFERENCIA O CAMPO PF, DO VETOR ORDENADO
		FOR B:=1 TO TOTAL DO
			 BEGIN
			  SEEK(ARQ,VET[B].PF);//POSICIONA NO ARQ NA POSICAO INDICADA PELO CAMPO pf DO VETOR ORDENADO
				READ(ARQ,REG);	
					  	
				//LINHA DETALHE				
				IF (OP = 1) AND (REG.CCL <> 0) THEN
					BEGIN 
			    	IF(REG.CAR <> CA) THEN
			    		BEGIN
			    			CA := REG.CAR;   
			          READLN;
			     			CLRSCR; 
								WRITELN;
			    		  WRITELN('CARGO:', ca,' ',cargos[ca]);
								WRITELN;
				      	write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      						 WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
			    			  END;	
								WRITE(B:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
								FOR A:=1 TO 6 DO
								 WRITE(REG.NOTAS[A]:4);
								WRITELN(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
								END
					 
					ELSE IF (OP = 2) THEN
							BEGIN
							  IF(REG.CAR <> CB) THEN
			    				BEGIN
			    			 	 CB := REG.CAR;   
			             READLN;
			     				 CLRSCR;
			     				 WRITELN;
			    		  	 WRITELN('CARGO:', cb,' ',cargos[cb]);
					    	   WRITELN;
			      			 write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      						 WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
			    			  END;	
								WRITE(B:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
								FOR A:=1 TO 6 DO
								 WRITE(REG.NOTAS[A]:4);
								WRITELN(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
							END 
							
						ELSE IF (OP = 3) THEN
							BEGIN
							  IF((B-1) MOD 25 = 0)THEN
			    				BEGIN
			     				 READLN;
			      			 CLRSCR;
					    	   WRITELN;
					    	   write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      						 WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
			    			  END;	
								WRITE(B:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
								FOR A:=1 TO 6 DO
								 WRITE(REG.NOTAS[A]:4);
								WRITELN(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
							END 
	  END;
	 
	 
	 
	TERMINE;
End.