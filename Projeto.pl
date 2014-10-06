concluiuCurso(RA,CC):-cursa(RA,CC),concluiuHistorico(RA,ITENS),concluiuCurriculo(CC,ITENS).

concluiuCurriculo(CC,[item(CM,_,_,NT,FQ)]):-curriculo(CC,CM).
concluiuCurriculo(CC,[item(CM,_,_,NT,FQ)|R):-concluiuCurriculo(CC,R),curriculo(CC,CM).

concluiuHistorico(RA,ITENS):-historico(RA,ITENS),materiaConcluida(RA,ITENS).

materiaConcluida(RA,[item(CM,_,_,NT,FQ)|R],CM):-terminouMateria(RA,item(CM,_,_,NT,FQ)).
materiaConcluida(RA,[item(CM,_,_,NT,FQ)|R],CMA):-materiaConcluida(RA,R,CMA),CMA\==CM.
materiaConcluida(RA,[item(CM,_,_,NT,FQ)|R],CM):-materiaConcluida(RA,R,CM).

terminouMateria(RA,item(CM,S,AN,NT,FQ)):-NT@>=5,FQ@>=0.75.