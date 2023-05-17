%%%%% � Este programa encontra um zero REAL de uma funcao pelo �%%%%%%
%%%%% � � � � � � � � � �METODO DA BISSECAO � � � � � � � � � � %%%%%%

function BissecModeloAAAA()
%clc
format long

%%% Criterio para x ser raiz: valor absoluto de f(x) menor que "prec"
%%% Se os dados fossem digitados:
%a = � �input('Entre com o limite inferior do intervalo [a,b]: ');
%b = � �input('Entre com o limite superior do intervalo [a,b]: ');
%prec = input('Entre com a precisao desejada: ');

%%% Intervalos e precisoes utilizados para cada funcao
%a=1; b=3; prec = 10^(-6);  %y = t*log10(t) - 1
%a=0; b=2; prec=10^-4;  %y = t^2 - .5 � � �
a=2; b=4; prec=10^-4; %y = t^3 - 9*t + 3

fa = f(a);
fb = f(b);

% Abandonar se a for um zero
if fa == 0
    disp('A raiz encontrada foi a = 0');
    return;
end

% Abandonar se b for um zero
if fb == 0
    disp('A raiz encontrada foi b = 0');
    return;
end

% Abandonar se nao houver garantia de raiz no intervalo
if fa * fb > 0
    disp('Nao ha garantia de raiz no intervalo [a, b]');
    return;
end

MaxIter = 1000;
for k = 1:MaxIter
 % Calcular a bisse��o x e o valor da fun��o em x
 x = (a + b) / 2;
 fx = f(x);

 % Verificar se x j� � um zero: se sim, abandonar itera��es
 if abs(fx) < prec
    break;
 end

% Ajustar "a" ou "b" e o valor correspondente da fun��o para que o intervalo [a, b] diminua mas continue contendo a raiz
if fa * fx < 0
    b = x;
    fb = fx;
else
    a = x;
    fa = fx;
end
end

% imprimir raiz encontrada, valor da fun��o na raiz e o n�mero de itera��es
disp ('***** �A SOLUCAO ENCONTRADA PELO METODO DA BISSECCAO FOI: �*****');
disp (x);
disp ('O valor de f(x) calculado na solucao foi: ');
disp (fx);
disp ('O numero de iteracoes foi: ');
disp (k);

end

function y = f(t)
%y = t*log10(t) - 1;
%y = t^2 - .5;
y = t^3 - 9*t + 3;
end