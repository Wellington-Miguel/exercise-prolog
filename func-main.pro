%Remover todas as ocorrências de um elemento em uma lista
remover(_,[],[]).   
remover(Elem,[Elem|R],Resultado):- 
    remover(Elem,R,Resultado).  
remover(Elem,[A|R],[A|Z]):-
    Elem \= A,
    remover(Elem,R,Z).  
%------------------------------------------------------------------------------
%Merge duas listas ordenadas em uma única lista ordenada
merge([],L,L).
merge(L,[],L).
merge([A|R1],[B|R2],[A|Z]):-
    A =< B,
    merge(R1,[B|R2],Z).     
merge([A|R1],[B|R2],[B|Z]):-
    A > B,      
    merge([A|R1],R2,Z). 
%------------------------------------------------------------------------------
%merge um elemento ao final da lista
mergeFinal(Elem,[],[Elem]).
mergeFinal(Elem,[A|R],[A|L]):-
    mergeFinal(Elem,R,L).

%pertence a lista / member
pertence(X, [X|_]).
pertence(X, [_|T]) :-
    pertence(X, T).

%remove duplicatas    
sumarizar(X,R):-
    sumarizar(X,[],R).
sumarizar([],Acc,Acc).
sumarizar([X|T],Acc,R):-
    \+pertence(X,Acc),
    concatenar(Acc,[X],NovoAcc),
    sumarizar(T,NovoAcc,R).
sumarizar([X|T],Acc,R):-
    pertence(X,Acc),
    sumarizar(T,Acc,R). 
