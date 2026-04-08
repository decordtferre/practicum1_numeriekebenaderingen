clc; clear all; close all;
load("exercise10.mat")

xplot = linspace(min(x), max(x), 1000);
evaluatie1 = kkb_spline(t1, x, y', xplot);
evaluatie2 = kkb_spline(t2, x, y', xplot);

figure;
hold on
plot(x, y, 'ob');
plot(xplot, evaluatie1, 'r', 'LineWidth', 2);
plot(xplot, evaluatie2, 'g', 'LineWidth', 2);
legend('Meetpunten', 'Knooppuntenrij t1', 'Knooppuntenrij t2');
xlabel('x'); ylabel('y');
title('Kleinstekwadratenbenadering met B-splines');
