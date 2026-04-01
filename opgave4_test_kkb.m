clc; clear all; close all;

% Correctheidstest voor kkb
x = linspace(-1, 1, 10);
y = linspace(-1, 1, 12);
[X, Y] = meshgrid(x, y);
max_graad = 9;
normen2 = zeros(max_graad,1);

F = sin(5*X + 3*Y);
% Benadering
C = kkb(x, y, F, max_graad, max_graad);
disp('Coëfficiëntenmatrix C:')
disp(C)

for graad = 1:max_graad
    
    C = kkb(x, y, F, graad, graad);
    A = get_leg_mtx(x, graad);
    B = get_leg_mtx(y, graad);
    F_approx = B * C * A';
    
    % Frobeniusnorm van residu
    residu = F_approx - F;
    normen2(graad) = norm(residu, 'fro');
end

% Plot
figure;
semilogy(1:max_graad, normen, '-o', 'DisplayName', 'Sine Wave function');
xlabel('Graad');
ylabel('Frobeniusnorm van residu');
title('Fout (Frobeniusnorm) vs graad');
grid on;
hold on;

%% Zelfde test met polynoom
normen2 = zeros(max_graad,1);

Coef = 10*rand(10,1);
p = Coef';
F = polyval(p, X) + polyval(p, Y);

for graad = 1:max_graad
    
    C = kkb(x, y, F, graad, graad);
    A = get_leg_mtx(x, graad);
    B = get_leg_mtx(y, graad);
    F_approx = B * C * A';
    
    % Frobeniusnorm van residu
    residu = F_approx - F;
    normen(graad) = norm(residu, 'fro');
end

% Plot
figure;
semilogy(1:max_graad, normen, '-o', 'DisplayName', 'Random polynomial');
xlabel('Graad');
ylabel('Frobeniusnorm van residu');
title('Fout (Frobeniusnorm) vs graad');
grid on;
legend;