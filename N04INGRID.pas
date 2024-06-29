Program N04INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{Faça um programa que leia uma série de CPF’s e informe se o CPF lido é válido ou não. CPF
“00000000000” (onze zeros) encerra o programa. Use o exercício 10 da lista 2 (enviado) como
referência. Garantir que sejam digitados 11 dígitos (validar).}

USES TARDENOITE;
VAR VET:ARRAY[1..11] OF INTEGER;
		CPF:STRING;
		SOMA,RESTO,J,K,A,M,ERR:INTEGER;

Begin
  WRITE('DIGITE O SEU CPF=>');
  READLN(CPF);//LE COMO STRING[11]
  
  IF(CPF='00000000000') THEN
  		TERMINE
  ELSE
  	BEGIN
		  //validação da quantidade de digitos
		  IF(LENGTH(CPF)<>11) THEN
				REPEAT
			    Begin
			      IF(LENGTH(CPF)<>11) THEN
			      WRITELN('CPF DIGITADO INVALIDO.');
			      WRITE('DIGITE O CPF COM 11 DIGITOS=>');
			      READLN(CPF);
			    END;
			  UNTIL LENGTH(CPF)=11;
			
			IF(CPF='00000000000') THEN
  			TERMINE
  		ELSE
  			BEGIN
			  FOR A:=1 TO 11 DO
			  VAL(CPF[A],VET[A],ERR);
			  
			  //calculo primeiro digito
			  SOMA:=0;
				M:=11;
			  FOR A:=1 TO 9 DO
			  BEGIN
			    M:=M-1;
			    SOMA:=SOMA+VET[A]*M;
			  END;
			  RESTO:=SOMA MOD 11;
			  IF (RESTO > 1) THEN
			  J:=11-RESTO
			  ELSE
			  J:=0;
			  
			  //WRITELN(J);
			  IF(J<>VET[10]) THEN
			  	WRITELN('CPF LIDO INVALIDO. PRIMEIRO DIGITO VERIFICADOR: ', J);
			  
			  IF(J=VET[10]) THEN
			  BEGIN
			    //calculo segundo digito
			    SOMA:=0;
					M:=12;
			    FOR A:=1 TO 10 DO
			    BEGIN
			      M:=M-1;
			      SOMA:=SOMA+VET[A]*M;
			    END;
			    RESTO:=SOMA MOD 11;
			    IF (RESTO > 1) THEN
			    K:=11-RESTO
			    ELSE
			    K:=0;
			    //WRITELN(K);
			    
			    IF(K=VET[11]) THEN
			    	WRITELN('CPF LIDO VALIDO. DIGITOS VERIFICADORES: ', J , K)
			    ELSE
			   	 	WRITELN('CPF LIDO INVALIDO. SEGUNDO DIGITO VERIFICADOR: ', K)
			  END;
			  END;
		END;
	  
  		TERMINE;
End.