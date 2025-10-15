% questão 1 - ocutar palavra de uma lista de palavra
oculte(_, [], []).
oculte(Palavra, [Palavra|Cauda], [*****|CaudaOculta]) :-
    oculte(Palavra, Cauda, CaudaOculta).
oculte(Palavra, [PalavraDiferente|Cauda], [PalavraDiferente|CaudaOculta]) :-
    Palavra \= PalavraDiferente,
    oculte(Palavra, Cauda, CaudaOculta).
% questão 2 - ocultar uma lista de palavras
oculteLista([], L,L):-!.
oculteLista([Palavra|Cauda], ListaOrin, ListaFinal):-
    oculte(Palavra,ListaOrin,ListaOculta),
    oculteLista(Cauda,ListaOculta,ListaFinal).
% questão 3 - intercalar palavras n vezes 
intercalar(_,_,0,[]):-!.
intercalar(X,Y,N,[X|R]):-
    N>0,
    N1 is N - 1,
    intercalar(Y, X,N1,R).