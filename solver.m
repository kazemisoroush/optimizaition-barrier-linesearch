% solver.m
% 	KKT solver. This file solves KKT and Complementary slackness equations.

clear;
clc;

Solver = solve('-1 / (2 * sqrt(x1)) + l1 - l5', '-1 / (2 * sqrt(x2)) + l1 + l2 - l6', '-1 / (2 * sqrt(x3)) + l2 + l3 - l4', '(x1 + x2 - 25) * l1', '(x1 + x2 - 30) * l2', '(x3 - 10) * l3', '-x3 * l4', '-x1 * l5', '-x2 * l6');

result = [Solver.x1 Solver.x2 Solver.x3];

disp(result);