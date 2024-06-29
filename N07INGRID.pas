Program N07INGRID ;

{FUP que possibilite mostrar os dados (veja leinddir.pas) do arquivo CAND.IND em ordem :
1 – Inscrição ou, 2 – Alfabética ou, 3 – Cpf ou, 4 - Cargo e alfabética dentro do cargo. 
Dar as quatro opções para o usuário escolher uma delas.}

USES TARDENOITE;
VAR ARQ:FILE OF REGIS;
    REG:REGIS;
    VET:VETOR;
    A,B,IND,PFI,TOTAL,OP:INTEGER;
    INSCRICAO:STRING;
		CARGO:STRING;    
    
Begin
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);
  
  WRITELN('ORDENACAO DE DADOS');
  WRITELN('1 - Inscricao');
  WRITELN('2 - Alfabetica');
  WRITELN('3 - CPF');
  WRITELN('4 - Cargo');
  LEIA('DIGITE O NUMERO DA OPCAO DESEJADA: ', OP);

  WHILE (NOT EOF(ARQ)) DO
   BEGIN
    READ(ARQ,REG);
    IND:=IND+1;
    VET[IND].PF:=PFI;      //COLOCA A POSICAO FISICA NO VETOR 
       
    IF(OP = 1) THEN
    	BEGIN
    		STR(REG.NUM:4, INSCRICAO);
    		VET[IND].CC:=INSCRICAO;
      END
		ELSE IF(OP = 2) THEN
    	VET[IND].CC:=REG.NOME
    ELSE IF(OP = 3) THEN
    	VET[IND].CC:=REG.CPF
    ELSE
    	BEGIN
    		STR(REG.CAR:3, CARGO);
    		VET[IND].CC:= CARGO + REG.NOME;
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
   
//MOSTRA O CONTEUDO DO ARQUIVO USANDO COMO REFERENCIA O CAMPO PF, DO VETOR ORDENADO
  FOR B:=1 TO TOTAL DO
	 BEGIN
	  SEEK(ARQ,VET[B].PF);//POSICIONA NO ARQ NA POSICAO INDICADA PELO CAMPO pf DO VETOR ORDENADO
		READ(ARQ,REG);
//LINHA DETALHE
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
	 END;
	TERMINE;
End.