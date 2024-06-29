Program N09INGRID;
//Feito por Ingrid Cristine Rocha

{FUP que atualize os campos CLG (classificação geral), CLC (classificação no cargo) e CCL (cargo de
classificação) no arquivo CAND.IND, conforme critérios da folha anterior.}

USES TARDENOITE;

VAR 
	 //arquivos
	 arq:file of regis;
	 reg:regis;
	 vagas:text;
	 //outras
	 vet:vetor;
	 a,b,c,posiv,np,ii,tot,tc,tt,contReg,intData,erro,dataConvertInt,clgeral:integer;
	 vetNota: array[1..6] of string;
	 vag:string[31];
	 strData:string[8];
	 dataConvertStr:string[6];
	 numCargo: array[1..12] of integer;
	 somaN:string[3];
	 clcargo: array[1..12] of integer;
 
Begin
	 assign(arq,'cand.ind');
	 assign(vagas,'vagas.txt');
	 reset(arq);
	 reset(vagas);

	 for b := 1 to 12 do
	 	begin
	 		readln(vagas,vag);
	 		val(copy(vag,30,2),numCargo[b],erro);
	 		end;
	 		c:=0;
	 		
	 writeln('Aguarde...');
  
	 repeat
	 		begin
			  read(arq,reg);
			  ii:=c+1;          
				vet[ii].pf:=c;    
				str(reg.som:3,somaN);
				
				for b:=1 to 6 do
					str(reg.notas[b]:3,vetNota[b]);
					
				strData:=reg.data.ano+reg.data.mes+reg.data.dia;
				val(strData, intData, erro);
				dataConvertInt:= 20240115-intData;
				str(dataConvertInt:6,dataConvertStr);
				
				vet[ii].cc:=somaN+vetNota[4]+vetNota[5]+vetNota[3]+vetNota[2]+vetNota[6]+vetNota[1]+dataConvertStr; 
				
				c:=c+1;
			end;
	 until(eof(arq));	
	
	 tot:=ii;
	 ordem(vet,tot);
	 writeln('Programa ordenado');
	 
	 for a := tot downto 1 do
	 	begin
	 		seek(arq,vet[a].pf);
	 		read(arq,reg);
			clgeral:= clgeral+1;
			clcargo[reg.car]:= clcargo[reg.car]+1;
			if clcargo[reg.car] <= numCargo[reg.car] then
				reg.ccl:= reg.car;
			reg.clg:= clgeral;
			reg.clc:= clcargo[reg.car];
			seek(arq, vet[a].pf);
		  write(arq, reg);
		end;	 	
	 		 
	CLOSE(vagas);
	CLOSE(ARQ);
End.