clc; clear all; close all;

load("exercise10.mat")
xplot = linspace(min(x), max(x), 1000);
[evaluatie1, M] = kkb_spline(t1, x, y', xplot);

figure;
spy(M);
title('Structuur van matrix M voor knooppuntenrij t1');
xlabel('B-spline index'); ylabel('Datapunt index');