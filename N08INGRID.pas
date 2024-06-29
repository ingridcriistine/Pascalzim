Program N08INGRID;
//Feito por Ingrid Cristine Rocha

{FUP atualize os campos das 6 notas e o campo soma das notas dos registros do arquivo CAND.IND, 
dos candidatos presentes. Antes, executar o programa MARCAFALTAS.PAS, (atualiza o campo reg.falta
com 1) enviado. Para atualizar as notas, utilize o arquivo NOTAS.TXT, criado pelo “terceiro” 
(usando o arquivo “PROVA.TXT”). Antes de encerrar, mostrar a média das 6 disciplinas, CONFORME ABAIXO:
DISCIPLINA                         MEDIA
L.E.M.                             43.27
INFORMATICA                        58.12
......                             ...... }

USES TARDENOITE;

VAR 
	 //arquivos
	 arq:file of regis;
	 reg:regis;
	 notas:text;
	 //outras
	 vet:vetor;
	 a,b,c,posiv,np,ii,tot,tc,tt,contReg,aux:integer;
	 vetNota: array[1..6] of integer;
	 numa,num, insc:string[4];
	 somaNotas: array[1..6] of integer;
	 mediaNotas: array[1..6] of real;
	 disciplinas: array[1..6] of string = ('L.E.M', 'Matematica', 'Logica', 'Conhecimentos esp.', 'Informatica', 'Atualidades');
 
Begin
	 assign(arq,'cand.ind');
	 assign(notas,'notas.txt');
	 reset(arq);
	 reset(notas);
	 
	 a := 0;
	 for b := 1 to 6 do
     somaNotas[b] := 0;
	 contReg := 0;
	 
	 writeln('Aguarde...');

	 repeat
		  read(arq,reg);
		  ii:=a+1;          
			vet[ii].pf:=a;    
			str(reg.num,num);
			tc:=length(num);
			for b:=1 to 4-tc do
			 insert('0',num,1);  //insere zeros a esquerda para ficar compativel com o numero lido em notas
			vet[ii].cc:=num; 
			A:=A+1;
	 until(eof(arq));	
	
	 tot:=ii;
	 ordem(vet,tot);

	 repeat
	  tt:=tt+1;
	  readln(notas,insc,vetNota[1],vetNota[2],vetNota[3],vetNota[4],vetNota[5],vetNota[6]);
	  numa := copy(insc, 1, 4);
	  
		pebin1(vet,numa,tot,posiv);
		if posiv > 0 then
		begin  
		  seek(arq,vet[posiv].pf);
		  read(arq,reg);
		  
		  FOR a:=1 TO 6 DO
		  	BEGIN
		  		reg.notas[a] := vetNota[a];
		  		somaNotas[a] := somaNotas[a] + vetNota[a];
		  	END;
		  	
		  	reg.som := 0;
	      for a := 1 to 6 do
	      begin 
	        reg.som := reg.som + reg.NOTAS[a];
	      end;
	
			SEEK(ARQ,VET[POSIV].PF);//RETORNA APONTADOR PARA INICIO DO REGISTRO
			WRITE(ARQ,REG);
			contReg := contReg + 1;
		end;
	 until eof(notas);
	 
	 writeln(' total de candidatos com notas --',tt:5,' candidatos');
	 writeln;
	 
	 for a := 1 to 6 do
	 	begin
	    if contReg > 0 then
	      mediaNotas[a] := somaNotas[a] / contReg
	    else
	      mediaNotas[a] := 0; //
	  end;
	  
	  writeln('            DICIPLINAS                         MÉDIA');
	  writeln;
	  for a := 1 to 6 do
	  begin
	    writeln(disciplinas[a]:20, ': ', mediaNotas[a]:30:2);
	  end;
	  writeln;
	 		
	 
	 termine; 
	CLOSE(notas);
	CLOSE(ARQ);
End.