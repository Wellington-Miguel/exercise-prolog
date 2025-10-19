%Questão 1 concatenar 2 listas 
concatenar([],L,L).
concatenar([A|R],L,[A|Z]):- 
    concatenar(R,L,Z).
  %------------------------------------------------------------------------------
%Questão 2 - concatenação inversa
concatenar(L,[],L).
concatenar(L,[A|R],[A|Z]):- 
    concatenar(L,R,Z).
  %------------------------------------------------------------------------------
%Questão 3 - Concatenar lista de lista
concatenar([],L,L).
concatenar([A|R],L,[A|Z]):- 
    concatenar(L,R,Z).

concatenarLista([],[]).
concatenarLista([Lista|Resto], Resultado):-
    concatenarLista(Resto,ListaInter),
    concatenar(Lista, ListaInter, Resultado). 
  %------------------------------------------------------------------------------
%Questão 4 - Intercalar listas
interLista([],[],[]).
interLista([],L,L).
interLista(L,[],L).
interLista([A|Lista1],[B|Lista2],[A,B|Resultado]):-
    interLista(Lista2,Lista1, Resultado).
%------------------------------------------------------------------------------
%Questão 5 - Escreva as cláusulas para adicionar um elemento ao final de uma lista.
adicionarFinal(Elem,[],[Elem]).
adicionarFinal(Elem,[A|R],[A|Z]):-
    adicionarFinal(Elem,R,Z).    
%------------------------------------------------------------------------------
%Questão 6 - Inverter uma lista
inverter([],[]).
inverter([A|R],ListaInvertida):-
    inverter(R,RInvertida),
    concatenar(RInvertida,[A],ListaInvertida).

%------------------------------------------------------------------------------

%Questão 7 -  inverter uma lista genérica de tal forma que todas as suas sublistas sejam também invertidas
%verificar se é uma lista
is_list([]).
is_list([_|_]).
% criar auxilair com acumulador vazio
reverter(L, Linv) :- 
    reverter(L, [], Linv).
%reverter listas
reverter([], Linv, Linv). % Caso Base: Quando a Lista está vazia, o Acumulador é a ListaInvertida final.
reverter([H|T], Acc, Linv) :- 
    reverter(T, [H|Acc], Linv). % Caso Recursivo: Move a Cabeça (H) para a frente do Acumulador (Acc).

% inverterLG(+LG, -Linv)
inverterLG(LG, Linv) :-
    inverter_profundo(LG, [], Linv).

% inverter_profundo(+Lista, +Acumulador, -Resultado)
inverter_profundo([], Linv, Linv). 

% Caso 1: O elemento é uma sublista e precisa ser invertido recursivamente
inverter_profundo([H|T], Acc, Linv) :-
    is_list(H),
    inverterLG(H, H_invertido), % Chama recursivamente para inverter a sublista H
    inverter_profundo(T, [H_invertido|Acc], Linv). % Move a sublista invertida para o Acumulador

% Caso 2: O elemento é um átomo (não é lista)
inverter_profundo([H|T], Acc, Linv) :-
    \+ is_list(H),
    inverter_profundo(T, [H|Acc], Linv). % Move o átomo diretamente para o Acumulador




