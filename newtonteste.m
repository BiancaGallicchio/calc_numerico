function newtonteste()
 %x = [1 2 3];

 % Exemplo2 - funcao y = 12./(t+2)
 %x = [-1 0 1 2];
 x = [-1 0 1 2 10];

 y = f(x);
 disp(y);
 n = length(x)-1;      % n eh o grau do polinomio interpolador

 dd = zeros(n+1);      % Comecamos com uma matriz zerada
 dd(:,1) = y;          % Primeira coluna são os valores de y

 % CUIDADO: somar 1 a cada indice, pois no Matlab nao existe posicao zero !!!
for j=1:n % Para j de 1 ate n        (ordem 1 ate n)
    for i=0:(n-j) %   Para i de 0 ate n-j    (linha 0 ate n-j)
        dd(i+1,j+1) = (dd(i+2,j) - dd(i+1,j)) / (x(i+j+1) - x(i+1)); % Fazer dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j) - x(i))
    end
end

 % Impressao dos coeficientes
 disp('Coeficientes do polinomio de Newton:');
 for j=0:n             % ordem 0 ate ordem n
  fprintf('dif.div.%d: %1.2f\n', j, dd(1,j+1));
 end
 disp('');             % pula linha

end

function y = f(t)
  %y = 6./t;             % x=1:3
  y = 12./(t+2);
end
