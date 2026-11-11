
%integral donde k es una constante numérica.
%ejemplo a utilizar definida(x,5,3,5,I,R).
definida(Var, K, S, I, K*Var, R):-
    atomic(Var), number(K), number(I), number(S),
    is(Ls,*(S,K)),
    is(Li,*(I,K)),
    is(R,-(Ls,Li)).

% integral de x
% ejemplo definida(x,x,3,5,I,R).
definida(Var, Var, S, I, Var^2/2, R):-
    atomic(Var), number(I), number(S),
    is(Ls, (S^2)/2),
    is(Li, (I^2)/2),
    is(R, Ls-Li).

% integral de k*x donde k es una constante
% ejemplo definida(x,2*x,5,3,I,R).
definida(Var, K*Var, S, I, K*Var^2/2, R):-
    atomic(Var), number(K), number(I), number(S),
    is(Ls, *(K,(S^2)/2)),
    is(Li, *(K,(I^2)/2)),
    is(R, Ls-Li).

% integral de x^n donde n es un numero entero
% ejemplo definida(x,x^5,5,3,I,R).
definida(Var, Var^N, S, I, Var^M/M, R):-
    atomic(Var), number(N), number(I), number(S), is(M, N+1), M =\= 0,
    is(Ls, (S^M)/M),
    is(Li, (I^M)/M),
    is(R, -(Ls, Li)).

% integral U+V donde u y v son funciones de x.
%  ejemplo definida(x,x^5+x^6,5,3,I,R).
definida(Var, X+Y, S, I, Xi+Yi, R):-
    atomic(Var), number(I), number(S),
    definida(Var,X,S,I,Xi,R1), definida(Var,Y,S,I,Yi,R2),
    is(R,+(R1,R2)).

% integral U-V donde u y v son funciones de x.
% ejemplo definida(x,x^5-x^6,5,3,I,R).
% definida(x, x^5-x^6+x^7, 5, 3, I, R).
definida(Var, X-Y,S,I, Xi-Yi,R):-
    atomic(Var), number(I), number(S),
    definida(Var,X,S,I,Xi,R1), definida(Var,Y,S,I,Yi,R2),
    is(R,-(R1,R2)).

% Integral de una constante por una variable elevada a la N
%  ejemplo definida(x,5*x^5,5,3,I,R).
definida(Var, K*Var^N, S, I, E, R):-
    atomic(Var), number(K), number(N), number(I), number(S), is(M, N+1),
    =(E, K/M*Var^M),
    is(D, /(K, M)),
    is(Lsuperior, D*S^M),
    is(Linferior, D*I^M),
    is(R, -(Lsuperior, Linferior)).

% Integral de seno
% ejemplo definida(x,sin(x),5,3,I,R).
definida(Var, sin(Var), S, I, E, R):-
    atomic(Var), number(I), number(S),
    =(E, -cos(Var)),
    is(Lsuperior, -(cos(S))),
    is(Linferior, -(cos(I))),
    is(R, -(Lsuperior, Linferior)).

% Integral de coseno
%  ejemplo definida(x,cos(x),5,3,I,R).
definida(Var, cos(Var), S, I, E, R):-
    atomic(Var), number(I), number(S),
    =(E, sin(Var)),
    is(Lsuperior, sin(S)),
    is(Linferior, sin(I)),
    is(R, -(Lsuperior, Linferior)).

% Integral de la tangente
% ejemplo definida(x,tan(x),5,3,I,R).
definida(Var, tan(Var), S, I, E, R):-
    atomic(Var), number(I), number(S),
    =(E, (-ln(abs(cos(Var))))),
    is(Lsuperior, -(log(abs(cos(S))))),
    is(Linferior, -(log(abs(cos(I))))),
    is(R, -(Lsuperior, Linferior)).

% Integral de senh(x)
% ejemplo definida(x,sinh(x),5,3,I,R).
definida(Var, sinh(Var), S, I, E, R):-
    atomic(Var),
    =(E, cosh(Var)),
    is(Lsuperior, cosh(S)),
    is(Linferior, cosh(I)),
    is(R, -(Lsuperior, Linferior)).

% Integral de cosh(x)
% ejemplo definida(x,cosh(x),5,3,I,R).
definida(Var, cosh(Var), S, I, E, R):-
    atomic(Var),
    =(E, sinh(Var)),
    is(Lsuperior, sinh(S)),
    is(Linferior, sinh(I)),
    is(R, -(Lsuperior, Linferior)).

% Integral de tanh(x)
% definida(x,tanh(x),5,3,I,R).
definida(Var, tanh(Var), S, I, E, R):-
    atomic(Var),
    =(E, log(cosh(Var))),
    is(Lsuperior, log(cosh(S))),
    is(Linferior, log(cosh(I))),
    is(R, -(Lsuperior, Linferior)).
