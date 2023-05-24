%%%%%   Este programa encontra um zero REAL de uma funcao pelo   %%%%%%
%%%%%                   METODO DE NEWTON-RAPHSON                 %%%%%%

function NewtonModelo2()
%clc
format long

%%% Se os dados fossem digitados:
%x0   = input('Informe uma aproximacao inicial xo: ');
%prec = input('Entre com a precisao desejada: ');

%%% Aproximações da raiz e precisoes utilizados para cada funcao
prec = 10^-10;
%x0=2; %y=x*log10(x)-1
%x0=2; %y=x^2-1/2;

%x0=2;    %y=x^3-9*x+3;
%x0=1.4; %y=x^3-9*x+3; 
% ^ ver se o resultado final vai ser o mesmo ou não

%x0 = 1; %=> cicla                        %y = t.^3-5*t;
%x0 = sqrt(5/3); %=> y'=0 (problema)      %y = t.^3-5*t;
x0 = 0; %Sempre cicla                    %y = sqrt(abs(t));

x = x0; fx = f(x);

% Abandonar se x0 já for um zero
if ( abs(fx) < prec )
 disp ('==> A aproximacao inicial x0 eh um zero de f');
 return;
end

MaxIter = 1000;
for k = 1:MaxIter
 % Calcular nova aproximacao "x" pelo método de Newton, com base no "x" atual,
 % e o valor correspondente da função "fx"
 dfx = df(x);
%  if dfx == 0
%     disp ('==> Derivada da função igual a zero. Escolha outra aproximação inicial.');
%     return;
%  end

 fx = f(x); % primeiro vou atualizar meu fx
 x = x - fx / dfx; %fórmula de newton-rhapson

 % Verificar se x já é um zero: se sim, abandonar iterações
 if abs(fx) < prec
    break;
 end
end

% imprimir raiz encontrada, valor da função na raiz e o número de iterações
disp ('A solucao encontrada pelo metodo de Newton foi: ');
disp (x)
disp ('O valor de f(x) calculado na solucao foi: ');
disp (fx)
disp ('Total de Iteracoes: ');
disp (k);
end

function y = f(t)
%y = t.*log10(t) - 1;
%y = t.^2 - 1/2;
%y = t.^3 - 9*t + 3;

%y = t.^3-5*t;
y = sqrt(abs(t));
end

function y = df(t)
%y = log10(t)+1/log(10);
%y = 2*t;
%y = 3*t.^2 - 9;

%y = 3*t^2-5;
y = sqrt(abs(t))/(2*t);
end