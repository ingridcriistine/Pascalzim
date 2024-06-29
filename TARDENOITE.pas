UNIT TARDENOITE;

interface //serve para criar as variáveis globais e indicar os módulos que fazem parte da UNIT

type  								//cria novos tipos de informaçao
		 redata=record    //DESCRICAO do registro para o campo data invertido
		  ano:string[4];     //4*8 --     32
		  mes,dia:string[2]; //2*8+2*8 -- 32
		 end;                //TAMANHO==> 64 BITS                   20210000-20000517=
		                                                                  //  209483
		                                                          //20210000-20010710= 
																															        //  199290     
		 
		 regis=record     //descricao do registro de cand.ind
      num:integer;                 //--           32
      nome:string[35];             //35*8 --     280
      cpf:string[11];              //11*8 --      88
      data:redata;                 //--           64
      car:INTEGER;                 //             32
			NOTAS:ARRAY[1..6] OF INTEGER;//6*32 --     192
			som,clg,clc,ccl,FALTA:INTEGER;     //5*32 --     140
     end;                          //tamanho ==> 848 bits

		 cc=record 			//descrição de registro para ser usada no vetor
      pf:integer;      //--                32
      cc:string[35];   //35*8 --          280
     end;              //tamanho ==>      312
     
     vetor=array[1..3000] of cc; 	// tipo vetor vetor de 3000 posições com duas informaçoes (integer e string[35]) por posição
     tipo=string[35];      				// tipo tipo 35 caracteres	
     a35=string[35];              // tipo a35 35 caracteres
		 vet1=array[1..3000] of a35;  // tipo vet1 vetor de 3000 posições com uma informação, (string[35]) por posição

    
procedure dvcpf(var num:string[11]);
{CALCULA OS DIGITOS VERIFICADORES DE UM CPF COM 9 DIGITOS E DEVOLVE COM 11 DIGITOS}

procedure TERMINE;
{FIM EH UM PROCEDIMENTO PARA ENCERRAR O PROGRAMA}

PROCEDURE VALDATAPRO(DD,MM,AA:INTEGER;VAR RES:BOOLEAN);
{valdataPRO eH umA PROCEDURE que a partir do diA, mes e ano como entrada, verifica se a data de entrada e valida
 ou nao, devolve true se data ok ou false se data invalida NO PARAMETRO RES...
 exemplo 10 06 1995->RESa=true -- 31 06 2000->RES=false (mes 6 so tem 30 dias) }
 
PROCEDURE pebin1(vet:vetor;ext:tipo;t:integer;VAR posi:INTEGER);
{pebin1 eh um procedimento que atraves de pequisa binaria devolve a posicao do elemento externo dentro
de um vetor ou zero caso não encontre.}
 
procedure cabeca1(relat:string[20];var pag:integer);
{cabeca1 eh um procedimento que mostra o cabecalho dos relatorios e incrementa a pagina }

procedure ordem(var vet:vetor; t:integer);
{ordem eh um procedimento que ordena um vetor com DUAS informações por posicao(posicao=record com pf+cc)}

procedure ordea(var vet:vet1; t:integer);
{ordea eh um procedimento que ordena um vetor com UMA informação por posicao(string[35])}

function validacpf(num:string[11]):boolean;
{validacpf eh uma funcao que calcula os digitos verificadores de um cpf e devolve true se digitos calculados iguais ao digitos
 lidos (índices 10 e 11). Transforma o string[11] em um vetor integer de 11 posiçoes}
 
function potr(x,y:integer):real;
{pot eh uma funcao que devolve a potencia de x elevado a y, tipo real, aceita y negativo}

function poti(x,y:integer):integer;
{pot eh uma funcao que devolve a potencia de x elevado a y, tipo integer, NAO aceita y negativo}

function diamaxM(ano,mes:integer):integer;
{diamaxM eH uma funcao que a partir do ano e do mes como entrada, devolve o numero maximo de dias do mes
 exemplo ano=2020, mes=6->diamax=30 --  ano=2020, mes=2->diamax=29 (2020 eh ano bissesto)}

FUNCTION VALDATA(DIA,MES,ANO:INTEGER):BOOLEAN;
{valdata eH um funcao que a partir do di, mes e ano como entrada, verifica se a data de entrada e valida
 ou nao, devolve true se data ok ou false se data invalida
 exemplo 10 06 1995->valdata=true -- 31 06 2000->valdata=false (mes 6 so tem 30 dias) }

procedure LEIA(OQUE:string[50];var int:integer);
{leia eH um procedimento que informa o que deve ser digitado (oque) e faz a leitura de informcoes do 
 teclado como caractere (max 50- - string[50]) e devolve o valor como inteiro (int) }

procedure cortela(n:integer);
{cortela eh um procedimento que altera a cor da tela (textbackground 
	0=PRETO, 1=AZUL, 2=VERDE, 3=CIANO, 4=VERMELHO, 5=MAGENTA, 6=MARROM, 7=CINZA CL'
  8=CINZA ES, 9=AZUL CL, 10=VERDE CL,11=CIANO CL, 12=VERMELHO CL, 13=MAGENTA CL, 14=AMARELO, 15= BRANCO' 
	VEJA - TEXTCOLOR(N:INTEGR)}

IMPLEMENTATION  //MODULOS FISICOS

//======================================================================

PROCEDURE VALDATAPRO(DD,MM,AA:INTEGER;VAR RES:BOOLEAN);
//PROCEDIMENTO QUE
//RECEBE DIA MES E ANO E DEVOLVE TRUE OR FALSE EM FUNCAO DA DATA SER VALIDA OU INVALIDA,
//NO PARAMETRO PASSADO POR REFERENCIA  RES
{	INICIO DO PROCEDURE}
VAR DMMES:INTEGER;
    CHAVE:BOOLEAN;
Begin
 CHAVE:=TRUE;
//COMEÇA A VALIDAR A DATA LIDA, A PARTIR DO ANO
//CONSIDERAR ANOS MENORES QUE 1940 E MAIORES QUE 2010 INVALIDA
 IF(AA<1940) OR (AA >2024) THEN
  CHAVE:=FALSE
 ELSE
//SE ANO OK, VALIDA O MES
  IF(MM<1) OR (MM>12)THEN
	 CHAVE:=FALSE
	ELSE
//VERIFICA O DIA
//PARA VERIFICAR O DIA TENHO QUE SABER O NUMERO MAXIMO DE DIAS DO MES LIDO
   BEGIN
		DMMES:=DIAMAXM(MM,AA);
		IF(DD<1) OR (DD>DMMES)THEN
		 CHAVE:=FALSE;
    RES:=CHAVE;//PARAMETRO QUE CONTERA A INFORMAÇAÕ SE A DATA EH VALIDA OU NAO
	 END;
END;
//==================================================
procedure dvcpf(var num:string[11]);
var vet:array[1..11] of integer;
    dvs:array[1..2] of integer;
    som,a,b,e,f,m,r:integer;
    x:string[1];
    aux:boolean;
begin
 aux:=true;
 for a:=1 to 11 do
  val(num[a],vet[a],e);{o string "num" já vem validado}
 f:=8;
 m:=10;
 a:=0;
 repeat
   som:=0;
   a:=a+1;
	 f:=f+1;
	 m:=m+1;
	 for b:=1 to f do
	  som:=som+vet[b]*(m-b);
   r:=som mod 11;
   dvs[a]:=11-r;
   if(r<2)then
    dvs[a]:=0;
   str(dvs[a],x);
   insert(x,num,m-1);
//   if(vet[m-1] <> dvs[a])then
//    aux:=false;
 until ((a=2) or (not aux));
// vercpf:=aux;
end;

//=========================================================
procedure TERMINE;
 begin
  write('enter para encerrar');
	readln;
 end;
 
//================================================== 
PROCEDURE pebin1(vet:vetor;ext:tipo;t:integer;VAR posi:INTEGER);//vet, ext, t por valor e posi por referencia, parametros formais
														 // o resultado da tarefa eh devolvido em posi
														 // vet possui duas informações por posicao o campo chave e a posicao fisica
var ini,fim,meio,XX:integer; //variaveis locais
    achou:boolean;
begin
 achou:=false;
 XX:=0;
 ini:=1;
 fim:=t;
 repeat
  meio:=(ini+fim) div 2;
 if(ext = vet[meio].cc)then
	  achou:=true
  else
   if(ext > vet[meio].cc)then
    ini:=meio+1
   else
    fim:=meio-1;
 until ((achou) OR (ini > fim));
 if( achou ) then
  posi := meio
 else
  posi := 0;
end;

//============================================================================================
PROCEDURE CABECA1(relat:string[20];var pag:integer); //relat por valor e pag por referencia, parametros formais
BEGIN
 WRITE('ENTER PARA CONTINUAR');
 READLN;
 CLRSCR ;
 PAG:=PAG+1;
 WRITELN('                         RELATORIO GERAL - ORDEM:',relat:20,'     PAGINA:',PAG:3);
 WRITELN;
 write('  ORD  NUM N O M E                              ===C P F=== NASCIMENTO CS  N1');
 WRITELN('  N2  N3  N4  N5  N6  SO  CG CC CV');
END;

//============================================================================================
procedure ordem(var vet:vetor; t:integer);  //vet por referencia e t por valor, parametros formais
var aux:cc;             //variaveis locais
    tot,a,jor:integer;
    tro:boolean;
begin
 tot:=t;
 jor:=1;  //variavel que conterah o total de elementos jah ordenados, começa com 1 (danca youtub, viu????)
 repeat
  tro:=true;
  tot:=tot-jor;
  for a:=1 to tot do
   if(vet[a].cc>vet[a+1].cc) then //<<========= compara o campo CHAVE (cc) para ordenar
    begin
     aux:=vet[a];
     vet[a]:=vet[a+1];
     vet[a+1]:=aux;
     tro:=false;
     jor:=1;     //se houve troca, jah ordenados volta para 1
    end
   else
    jor:=jor+1; //não houve troca, incrementa jah ordenados
 until tro;
end;

//============================================================================================
procedure ordea(var vet:vet1; t:integer);  //vet por referencia e t por valor, parametros formais
var aux:a35;         //variáveis locais
    tot,a,jor:integer;
    tro:boolean;
begin
 tot:=t;
 jor:=1;
 repeat
  tro:=true;
  tot:=tot-jor;
  for a:=1 to tot do
   if(vet[a]>vet[a+1]) then
    begin
     aux:=vet[a];
     vet[a]:=vet[a+1];
     vet[a+1]:=aux;
     tro:=false;
     jor:=1;
    end
   else
    jor:=jor+1;
 until tro;
end;

//=================================================================================================
function validacpf(num:string[11]):boolean;  //num parametro por valor, parametro formal
var vet:array[1..11] of integer;   //variaveis locais
    dvs:array[1..2] of integer;
    som,a,b,e,f,m,r:integer;
    aux:boolean;
begin
 aux:=true;
 for a:=1 to 11 do
  val(num[a],vet[a],e);{o string "num" já vem validado}
 a:=1;
 repeat                           //digitos iguais
   a:=a+1;
 until(a=11) or (vet[1]<>vet[a]);
 if(a=11)then                    //fim digitos iguais 
  aux:=false //<<<<<<<<<<<<<<<<<<<ATENÇÃO PARA FUNCIONAR DIGITOS IGUAIS, MUDAR =true PARA =false
 else 
  begin                          //calculo dos digitos verificadores
   f:=8;
   m:=10;
   a:=0;
   repeat
    som:=0;
    a:=a+1;
	  f:=f+1;
	  m:=m+1;
	  for b:=1 to f do
	   som:=som+vet[b]*(m-b);       //soma dos produtos
    r:=som mod 11;
    dvs[a]:=11-r;
    if(r<2)then
     dvs[a]:=0;
    if(vet[m-1] <> dvs[a])then
     aux:=false;
	 until ((a=2) or (not aux));
	end;
 validacpf:=aux;
end;

//===================================================================================
function potr(x,y:integer):real;// x,y por valor, parametros formais
                                //o resultado da tarefa eh devolvido no nome da funcao
var neg,ex,a,pot:integer; //variaveis locais
 begin
  pot:=1;
	neg:=1;
	if(y<0)then
	 neg:=-1;
	ex:=y*neg;
	for a:= 1 to ex do
	 pot:=pot*x; 
	if(y<0)then
	 potr:=1/pot
	else
	 potr:=pot;
 end;
 
//===================================================================================================                                
function poti(x,y:integer):integer;// x,y por valor, parametros formais
                                   //o resultado da tarefa eh devolvido no nome da funcao
var pot,a:integer;//variável local
 begin
  pot:=1;
  if(y>0)then 
    for a:=1 to y do
     pot:=pot*x;
  poti:=pot;
 end;
 
//===================================================================================================
FUNCTION VALDATA(DIA,MES,ANO:INTEGER):BOOLEAN;//dia,mes,ano passado por valor, parametros formais
                                               //o resultado da tarefa devolvido no nome da funcao
VAR  CHAVE:BOOLEAN;  // variavel local
BEGIN
 CHAVE:=TRUE;
 IF(ANO < 1900) OR (ANO > 2008)THEN //VERIFICA O ANO (depende do usuario)
  CHAVE:=FALSE
 ELSE
  IF(MES < 1) OR (MES > 12)THEN //VERIFICA O MES
   CHAVE:=FALSE
  ELSE
   BEGIN //INICIO DA VERIFICACAO DO DIA
      IF(DIA < 1) OR (DIA > DIAMAXM(ano,mes)) THEN //chama a funcao diamaxM
      CHAVE:= FALSE;
    END;
 VALDATA:=CHAVE;
END;

//============================================================================================================================
function diamaxM(ano,mes:integer):integer; //ano,mes passados por valor, parametros formais 
                                          //o resultado da tarefa devolvido no nome da funcao
 begin
    DIAMAXM:=31;  //PARA TODOS OS MESES
    IF(MES=4) OR (MES=6) OR (MES=9) OR (MES=11) THEN  //ALTERA 
     DIAMAXM:=30;
    IF(MES=2)THEN // ALTERA
     BEGIN
      DIAMAXM:=28;
      IF(ANO MOD 4 = 0)THEN //ALTERA
       DIAMAXM:=29;
    end;
 end;
 
//===========================================================================================================================
 procedure leiA(OQUE:string[50];var int:integer);//OQUE PASSADO POR VALOR E INT POR REFERENCIA, PARAMETROS FORMAIS
                                                  //O RESULTADO DA TAREFA, DEVOLVIDO EM iNT
  var
	 dm:string[20];  //variavel local
	  e:integer;     //variavel local
  begin
	  repeat
     write(OQUE,'=>');
     readln(dm);
     val(dm,int,e);
     if(e>0)then
      writeln(oque,' ilegal');
    until (e=0);
  end;
  
//==========================================================================================================
procedure cortela(n:integer); //n (COR DA TELA) passado por valor, parametro formal
{ 0=PRETO, 1=AZUL, 2=VERDE, 3=CIANO, 4=VERMELHO, 5=MAGENTA, 6=MARROM, 7=CINZA CL'
  8=CINZA ES, 9=AZUL CL, 10=VERDE CL,11=CIANO CL, 12=VERMELHO CL, 13=MAGENTA CL, 
	14=AMARELO, 15= BRANCO' }
 begin
  textbackground( n ); 
	CLRSCR;                              
	gotoxy(1,1);
 end;
END.