% test.

clc;
clear;

%solve('-1 + l1 + l2 - l3 = 0', '-1 + l1 - l4 = 0', '-1 + l2 - l5 = 0', 'l1 * (x1 + x2 - 1) = 0', 'l2 * (x1 + x3 - 1) = 0', 'l3 * x1 = 0', 'l4 * x2 = 0', 'l5 * x3 = 0', 'l4 = 0', 'l5 = 0');

% l1 l2 l3 l4 l5 l6 x1 x2 x3
A = [];

x1 = 0:0.1:10;
x2 = 0:0.1:10;
x3 = 0:0.1:10;

%f = - sqrt(x1) - sqrt(x2) - sqrt(x3);
x3=(- sqrt(x1) - sqrt(x2)).^2;
axis=[0 10 0 10 0 10];
figure;
surfc(x3,x1,x2);



%plot(f, x1, x2, x3);