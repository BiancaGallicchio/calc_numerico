% Este programa calcula o valor de uma funcao por serie (polinomio) de Taylor
% Taylor: f(x) = Sum(0,infty,f^(n)(a)/n!*(x-a)^n
% Se a=0: f(x) = Sum(0,infty,f^(n)(0)/n!*x^n    (serie de Maclaurin)

function taylor()
 % clc
 format long

 disp('Calculo da expansao de Taylor de uma funcao em torno de a = 0');
 x = input('Entre com o valor de x: ');
 g = input('Entre com o grau do polinomio: ');

 s = 0;
 for k=0:g
  s = s + coef(k)*x^k/factorial(k);
 end;

 %            ======= coef(k) = f^(n)(0) ========
 %  ---------------------------------------------
 %  k         0  1  2  3  4  5  6  7  8  9 10 11
 %  =============================================
 %  e^x       1  1  1  1  1  1  1  1  1  1  1  1
 %  cos(x)    1  0 -1  0  1  0 -1  0  1  0 -1  0
 %  sen(x)    0  1  0 -1  0  1  0 -1  0  1  0 -1
 %  =============================================
 %  mod(k,4)  0  1  2  3  0  1  2  3  0  1  2  3

 fprintf('Taylor: %12.10f\n',s);
 fprintf('Exato : %12.10f\n',f(x));
end

function y = f(t)
  %y = exp(t);
  %y = cos(t);
  y = sin(t);
end

function c = coef(k)
 % funcao exponencial
 %c = 1/factorial(k);

 % funcao cosseno
 %if mod(k, 2) == 0
 % c = (-1)^(k/2)/factorial(k);
 % else
 %   c = 0;
 %end

 % funcao seno
 if mod(k, 2) == 0
    c = 0;
  else
    n = (k - 1) / 2;
    c = (-1)^n / factorial(2*n + 1);
  end
end
