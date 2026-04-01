clc; clear all;

k = 3;  % graad
n = 4;  % aantal vrije coëfficiënten - 1
t = [0, 0, 0, 0, 0.25, 0.5, 0.75, 1, 1, 1, 1]; % knooppuntenrij
% herhaling aan het begin en eind is nodig om de spline 'vast te zetten'
m = length(t) - k - 1;  % aantal basisfuncties
x = linspace(0, 1, 1000);

figure; hold on;
for i = 1:m
    c = zeros(m, 1);
    c(i) = 1;  % één basisfunctie tegelijk
    s = deboor(k, t, c, x);
    plot(x, s);
end
title(sprintf('B-spline basis, graad k=%d', k));
xlabel('x'); ylabel('B_{i,k}(x)');
hold on;
grid on;
legend;

