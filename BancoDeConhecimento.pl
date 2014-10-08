% curso(cc,nc).
curso(1,informatica).
curso(2,eletroeletronica).
curso(3,mecanica).
curso(4,alimentos).
curso(5,enfermagem).
curso(6,plasticos).

% materia(cm,mm,am).
materia(1,tecnicas_de_programacao,8).
materia(2,programacao_orientada_a_objetos,5).
materia(3,estruturas_de_dados,4).
materia(4,topicos_em_metodologias_de_programacao,3).
materia(5,circuitos_eletricos,4).
materia(6,eletronica_digital,5).
materia(7,arquitetura_computadores,6).
materia(8,microcontroladores,4).

<<<<<<< HEAD
% curriculo(cc,[cm1,cm2,...,cmn]).
curriculo(1,[1,2,3,4]).
curriculo(2,[7,8]).
=======
%curriculo(cc,[cm1,cm2,...,cmn]).
curriculo(1,[1,2,3,4]).
curriculo(2,[5,6,7,8]).
>>>>>>> 661a60ec7a292f0bc12d32dd750b3aca6ab90dbe

% aluno(ra,na).
aluno(12808,jose).
aluno(12080,marcos).
aluno(12909,joao).
aluno(12090,ana).

% cursa(ra,cc)
cursa(12909,1).
cursa(12080,2).
cursa(12090,2).

<<<<<<< HEAD
% historico(ra,itens).
historico(12808,[item(1,1,2012,3.0,0.77),item(1,2,2013,6.5,0.90),item(5,1,2014,8.0,0.80)]).
historico(12909,[item(1,1,2012,7.0,0.80),item(2,2,2013,8.5,0.80),item(3,1,2014,5.0,0.75)]).
historico(12080,[item(5,1,2012,6.0,0.70),item(5,2,2013,7.5,0.90),item(6,1,2014,5.0,0.90)]).
historico(12090,[item(7,1,2012,6.0,0.75),item(8,2,2014,8.0,0.89)]).

concluiuCurso(RA,CC):-cursa(RA,CC),curriculo(CC,CODSCURR),historico(RA,ITENSH),pegarItens(CODSCURR,ITENSCURR),concluiuCurriculo(CC,ITENSCURR,ITENSH).

% (ITENSH,ITENSCURR)
concluiuCurriculo(HIST,[X|Y]):-materiaConcluida(HIST,X),concluiCurriculo(HIST,Y).

% Matéria concluida (ITENS_DO_HISTORICO,CODIGO_MATERIA)
materiaConcluida([item(CM,S,AN,NT,FQ)|R],CM):-materiaConcluidaAux(Ritem(CM,_,_,NT,FQ),CM).
materiaConcluida([item(CMA,S,AN,NT,FQ)|R],CM):-CM\==CMA,materiaConcluida(RR,CM).
materiaConcluidaAux(item(CM,_,_,NT,FQ),CM):-terminouMateria(item(CM,_,_,NT,FQ)).

% Terminou Matéria (RA,MATERIA)
terminouMateria(RA,item(CM,_,_,NT,FQ)):-NT@>=5.0,FQ@>=0.75,temNoHistorico(RA,item(CM,_,_,NT,FQ)).

% Existe no histórico(RA,MATERIA)
temNoHistorico(RA,item(CM,S,AN,NT,FQ)):-historico(RA,X),temNoHistoricoAux(RA,item(CM,S,AN,NT,FQ),X).
temNoHistoricoAux(RA,item(CM,S,AN,NT,FQ),[item(CMH,SH,ANH,NTH,FQH)|R]):-CMH==CM.
temNoHistoricoAux(RA,item(CM,S,AN,NT,FQ),[item(CMH,SH,ANH,NTH,FQH)|R]):-temNoHistoricoAux(RA,item(CM,S,AN,NT,FQ),R),CM2\==CM.
=======
%item(cm,sm,an,nt,fq).
historico(12808,[item(1,1,2012,3.0,0.77),item(1,2,2013,6.5,0.90),item(5,1,2014,8.0,0.80)]).
historico(12909,[item(1,1,2012,4.0,0.80),item(2,2,2013,8.5,0.80),item(3,1,2014,5.0,0.75)]).
historico(12080,[item(5,1,2012,6.0,0.70),item(5,2,2013,7.5,0.90),item(6,1,2014,5.0,0.90)]).
historico(12090,[item(7,1,2012,3.0,0.75),item(8,2,2014,8.0,0.89)]).

%Exercicio2
% falta(12909,OQUE).
% OQUE = [tópicos_em_metodologias_de_programacao]

%Inserir um elemento numa lista.
insereLista(X,[],[X]).
insereLista(X,[L|R],[X,L|R]).

%Inserir Unico elemento
insereUnico(X,[],[X]).
insereUnico(X,[L|R],[L|R]):-existe(X,[L|R]).
insereUnico(X,[L|R],[X,L|R]):-not(existe(X,[L|R])).

%Existe elemento na lista
existe(X,[X|_]).
existe(X,[L|R]):-X\==L,existe(X,R).

%remover
removerLista(_,[],[]).
removerLista(X,[X|R],R).
removerLista(X,[L|R],[L|NL]):-X\==L,removerLista(X,R,NL).

concluiuItem(item(_,_,_,NM,FQ)):-NM@>=5.0,FQ@>=0.75.
naoConcluiuItem(item(_,_,_,NM,FQ)):-NM@<5.0,FQ@<0.75.
>>>>>>> 661a60ec7a292f0bc12d32dd750b3aca6ab90dbe

% Pegar códigos(ITENS,LISTADECODIGOS)
pegarCodigos([],[]).
pegarCodigos([item(CM,_,_,_,_)|R],[CM|Q]):-pegarCodigos(R,Q).

<<<<<<< HEAD
% Pegar itens(CODIGOS,LISTADEITENS)
pegarItens([],[]).
pegarItens([P|R],[item(P,_,_,_,_)|Y]):-pegarItens(R,Y).


% materiaConcluida(RA,[item(CM,_,_,_,_)|R],CM):-terminouMateria(RA,item(CM,_,_,NT,FQ)).
% materiaConcluida(RA,[item(CM,_,_,_,_)|R],CMA):-materiaConcluida(RA,R,CMA),CMA\==CM.
% materiaConcluida(RA,[item(CM,_,_,_,_)|R],CM):-materiaConcluida(RA,R,CM).

% concluiuCurriculo(CC,[item(CM,_,_,NT,FQ)]):-curriculo(CC,CM).
% concluiuCurriculo(CC,[item(CM,_,_,NT,FQ)|R]):-concluiuCurriculo(CC,R),curriculo(CC,CM).
=======
%2
falta(RA,CC,LM):-historico(RA,H),curriculo(CC,M),retirar(M,H,LM).

%Retirar 2ª da 1ª
retirar([],[],[]).
retirar([X|R],[],[X|R]).
retirar([L|S],[item(COD,_,_,N,F)|R],LISTA):-retirar([L|S],R,NL),existe(COD,[L|S]),concluiuItem(item(COD,_,_,N,F)),removerLista(COD,NL,LISTA).
retirar([L|S],[item(COD,_,_,_,_)|R],NL):-not(existe(COD,[L|S])),retirar([L|S],R,NL).

%3 FALTA EXTRA
extra(RA,CC,LM):-historico(RA,H),curriculo(CC,M),pegarCodigos(H,HIST),extraAux(M,HIST,LM).

%extraAux(CURRICULO,HISTORICO)
extraAux([],[],[]).
extraAux([_|_],[],[]).
extraAux([L|S],[X|R],LISTA):-extraAux([L|S],R,NL),not(existe(X,[L|S])),insereUnico(X,NL,LISTA).
extraAux([L|S],[X|R],NL):-existe(X,[L|S]),extraAux([L|S],R,NL).
>>>>>>> 661a60ec7a292f0bc12d32dd750b3aca6ab90dbe
