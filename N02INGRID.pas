Program N02INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{FUP que leia dia, mês e ano de nascimento, VALIDAR, após leia dia, mês e ano do dia de hoje, VALIDAR. Após calcule e mostre a idade em anos, 
em meses e em dias. (Ex.:15 anos, 3 meses e 7 dias). O programa deverá, NECESSARIAMEMTE, usar os módulos da UNIT tardenoite.pas, ENVIADA, para 
validar as datas lidas e calcular o número de dias máximo do mês anterior à data de hoje.}

USES TARDENOITE;
VAR DIAN,MESN,ANON,DIAH,MESH,ANOH,DIAID,MESID,ANOID,MESANT,DMAXH:INTEGER;
		CHAVE:BOOLEAN;

Begin
	WRITE('Digite o dia do seu nascimento: ');  
	READLN(DIAN); 
	
	WHILE DIAN>0 DO
	  BEGIN
	   WRITE('Digite o mes do seu nascimento: ');  
		 READLN(MESN);
	   WRITE('Digite o ano do seu nascimento: ');  
		 READLN(ANON);
		 
		 IF VALDATAF(DIAN,MESN,ANON) THEN
		 	BEGIN
	   	 	WRITELN('DATA VALIDA:',DIAN:2,'/',MESN:2,'/',ANON);
				CHAVE:=TRUE;
				
				WHILE CHAVE=TRUE DO
					BEGIN	 
				 	 WRITE('Digite o dia de hoje: ');  
					 READLN(DIAH);
					 WRITE('Digite o mes atual: ');  
					 READLN(MESH); 
					 WRITE('Digite o ano atual: ');  
					 READLN(ANOH);
					 	   	
					 IF VALDATAF(DIAH,MESH,ANOH) THEN
					  BEGIN
				   		WRITELN('DATA VALIDA:',DIAH:2,'/',MESH:2,'/',ANOH);
				   		  ANOID:=ANOH-ANON;
				   		  MESID:=MESH-MESN;
								DIAID:=DIAH-DIAN; 
							  
								IF DIAID<0 THEN
									BEGIN
									  IF MESH>1 THEN
									  	MESANT:=MESH-1
									  ELSE
									  	MESANT:=12;
										DMAXH:=DMAX(MESANT,ANOH);
										DIAID:=DIAID+DMAXH;
										MESID:=MESID-1;
									END;
									 
								IF MESID<0 THEN
									BEGIN
									  MESID:=MESID+12;
									  ANOID:=ANOID-1;
									END;
									
								WRITELN('Voce tem ', ANOID, ' anos, ', MESID, ' meses e ', DIAID, ' dias.'); 
								
								CHAVE:=FALSE;
								DIAN:=0;
				   	END
				   ELSE
						WRITELN('DATA DE HOJE INVALIDA'); 
				END;
			END 	 
		 ELSE
		 		BEGIN
			   	WRITELN('DATA DE NASCIMENTO INVALIDA');
			   	WRITE('Digite o dia do seu nascimento: ');  
					READLN(DIAN);
				END; 
		END;
		WRITE('ENTER PARA ENCERRAR');
		READLN;
End.