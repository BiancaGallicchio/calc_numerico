x = [-2, -1, 0, 1, 2];
y = [33, -11, -9, -3, 13];
v = 2.5;
n = length(x);

A = ones(n,n);
for i = 1:n
    A(:,i) = x.^(i-1);
end
coeficientes = A\y';

disp(coeficientes);
