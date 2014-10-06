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
materia(4,topicos_em_metodologias_de_programacao).
materia(5,circuitos_eletricos,4).
materia(6,eletronica_digital,5).
materia(7,arquitetura_computadores,6).
materia(8,microcontroladores,4).

%curriculo(cc,[cm1,cm2,...,cmn]).
curriculo(1,[1,2,3,4]).
curriculo(2,[5,6,7,8]).

% aluno(ra,na).
aluno(12808,jose).
aluno(12080,marcos).
aluno(12909,joao).
aluno(12090,ana).

% cursa(ra,cc)
cursa(12909,1).
cursa(12080,2).

%Exercicio2
% falta(12909,OQUE).
% OQUE = [tópicos_em_metodologias_de_programacao]

%Inserir um elemento numa lista.
insereLista(X,[],[X]).
insereLista(X,[L|R],[X,L|R]).

falta(RA,CC,LM):-