Program N01INGRID ;
//FEITO POR INGRID CRISTINE ROCHA

{FUP que leia uma lista de n�meros terminada pelo n�mero 0 e que, para cada n�mero lido, mostre o pr�prio n�mero e a rela��o de seus
divisores. 
Exemplo: leu 10 
Mostra: numero lido = 10
Divisores 1, 2, 5, 10       }

VAR NUM,C,RESULTADO:INTEGER;
 
Begin
	WRITE('>>>>>DIGITE UM NUMERO: ');
	READLN(NUM); 
	
	WHILE NUM<>0 DO
		BEGIN
			WRITELN('NUMERO LIDO:', NUM); 
			WRITELN('DIVISORES: ');  
			                
			FOR C:=NUM DOWNTO 0 DO
				IF(C<>0) THEN 
					IF((NUM MOD C)=0) THEN   
						BEGIN
							RESULTADO:= NUM DIV C;
							WRITELN(RESULTADO);								
						END;
						
		WRITE('>>>>>DIGITE UM NUMERO: ');
		READLN(NUM);
	 	END;     
	WRITE('ENTER PARA ENCERRAR');
 	READLN;   
End.