% Forma Basica do polinomio interpolador - Exemplos
% Exemplo 1
x = [1, 2, 3];
y = [6, 3, 2];         % f(x) = 6/x;
v = 2.5;
% Exemplo 2
%x = [-1; 0;  2];
%y = [ 4; 1; -1];
%v = 1;
% Exemplo 3
%x = [ -2;  -1;  0;  1;  2];
%y = [ 33; -11; -9; -3; 13];
%v = 3;
% Processamento
n = length(x);    % n eh o grau do polinomio interpolador
% Criar matriz X
X = ones(n, n);
% Calcular o vetor "a" resolvendo sistema com recursos do Matlab
for i = 1:n
    X(:,i) = x.^(i-1);
end
a = X\y';
% aplicar o "flip" ao vetor "a"
flip(a);

% Impressao dos coeficientes
disp('Coeficientes do polinomio interpolador'); %disp(a);
for i=1:(n)
 fprintf('coef. de x%1d: %1.2f\n', n-i, a(i));
end
disp('');

% Impressao do valor interpolado
%r = polyval(a1, a2, a3); % Usar funcao polyval e armazenar na variavel "r"
disp('Valor interpolado:');
disp(a);
disp('');

% Impressao do polinomio interpolador
fprintf('Polinomio Interpolador:\n');
fprintf('p%1d(x)= ',n);
for i=1:(n)
 fprintf('%+1.4f', a(i));
 if n-i+1 > 1
   fprintf('x^%d ', n-i);
 elseif n-i == 1
   fprintf('x ');
 end
end
fprintf('\n\n');