% questão 1 - ocutar palavra de uma lista de palavra
oculte(_, [], []).
oculte(Palavra, [Palavra|Cauda], [*****|CaudaOculta]) :-
    oculte(Palavra, Cauda, CaudaOculta).
oculte(Palavra, [PalavraDiferente|Cauda], [PalavraDiferente|CaudaOculta]) :-
    Palavra \= PalavraDiferente,
    oculte(Palavra, Cauda, CaudaOculta).

%------------------------------------------------------------------------------

% questão 2 - ocultar uma lista de palavras
oculteLista([], L,L):-!.
oculteLista([Palavra|Cauda], ListaOrin, ListaFinal):-
    oculte(Palavra,ListaOrin,ListaOculta),
    oculteLista(Cauda,ListaOculta,ListaFinal).

%------------------------------------------------------------------------------

% questão 3 - intercalar palavras n vezes 
intercalar(_,_,0,[]):-!.
intercalar(X,Y,N,[X|R]):-
    N>0,
    N1 is N - 1,
    intercalar(Y, X,N1,R).

%------------------------------------------------------------------------------

%Questão 4 - sumarize
% ----------------------------------------------------------
% sumarize(L, L1, L2)
%   L  -> lista original
%   L1 -> lista de elementos únicos (na ordem de primeira aparição)
%   L2 -> lista de contagens correspondentes
% ----------------------------------------------------------

sumarize([], [], []).  % caso base: lista vazia

sumarize([H|T], [H|L1], [N|L2]) :-
    \+ meu_member(H, T),       % se H não se repete mais
    count(H, [H|T], N),        % conta quantas vezes H aparece
    sumarize(T, L1, L2).       % segue pro resto da lista

sumarize([H|T], [H|L1], [N|L2]) :-
    meu_member(H, T),          % se H aparece mais vezes
    count(H, [H|T], N),        % conta quantas vezes H aparece
    remove_all(H, T, Resto),   % remove todas as outras ocorrências
    sumarize(Resto, L1, L2).   % continua com o restante

% ----------------------------------------------------------
% count(Elemento, Lista, N)
% Conta quantas vezes Elemento aparece em Lista.
% ----------------------------------------------------------

count(_, [], 0).
count(X, [X|T], N) :-
    count(X, T, N1),
    N is N1 + 1.
count(X, [Y|T], N) :-
    X \= Y,
    count(X, T, N).

% ----------------------------------------------------------
% remove_all(Elemento, Lista, Resultado)
% Remove todas as ocorrências de Elemento da Lista.
% ----------------------------------------------------------

remove_all(_, [], []).
remove_all(X, [X|T], R) :-
    remove_all(X, T, R).
remove_all(X, [Y|T], [Y|R]) :-
    X \= Y,
    remove_all(X, T, R).

% ----------------------------------------------------------
% meu_member(Elemento, Lista)
% Verdadeiro se Elemento pertence à Lista.
% ----------------------------------------------------------

meu_member(X, [X|_]).
meu_member(X, [_|T]) :-
    meu_member(X, T).

%Questão 5 - empacote
% ----------------------------------------------------------
% empacote(L, LL)
% L  -> lista original
% LL -> lista de listas, com elementos consecutivos iguais empacotados
% ----------------------------------------------------------

empacote([], []).  % caso base: lista vazia

empacote([H|T], LL) :-
    empacote(T, H, [H], LL).  % inicia com Current = [H]

% ----------------------------------------------------------
% empacote(ListaRestante, ElemAtual, CurrentSublist, Resultado)
% ----------------------------------------------------------

% Caso base: lista restante vazia, adiciona CurrentSublist ao resultado
empacote([], _, Current, [Current]).

% Próximo elemento igual ao atual: adiciona à CurrentSublist
empacote([H|T], H, Current, LL) :-
    meu_append(Current, [H], NewCurrent),
    empacote(T, H, NewCurrent, LL).

% Próximo elemento diferente: fecha CurrentSublist e inicia nova
empacote([H|T], Prev, Current, [Current|LL]) :-
    H \= Prev, 
    empacote(T, H, [H], LL).

meu_append([], L, L).
meu_append([H|T], L2, [H|R]) :-
    meu_append(T, L2, R).
% ----------------------------------------------------------
