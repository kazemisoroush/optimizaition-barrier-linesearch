% main.m

clear; % Clear variables.
clc; % Clear command-line.

x_1 = [5; 2; 4]; % x0

mu(1) = 1; % mu0
nu = 0.5;
epsilon = 0.01;

syms x1 x2 x3;

f = - sqrt(x1) - sqrt(x2) - sqrt(x3);

finalX = Barrier( f, x_1, mu, nu, epsilon );

disp(finalX); % Optimum x.
disp(subs(f, [x1, x2, x3], finalX)); % Optimum f(x).

