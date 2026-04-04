clc; clear all; close all;

%% Plot voor get_leg_mtx.m
% Visueel checken of de Legendrepolynomen correct zijn.

clear all;
x_test = linspace(-1, 1, 100);
n_test = 5;
A = get_leg_mtx(x_test, n_test);
disp(A)
plot(x_test, A, 'LineWidth', 2);
grid on;
title('Legendre-veeltermen P_0 t/m P_5');
legend('P_0','P_1','P_2','P_3','P_4','P_5');

% Het verschil berekenen tussen onze evaluatie en de Matlabfunctie

x_cor = 0.5;
n_max = 4;
A = get_leg_mtx(x_cor, n_max);

val_matlab = legendreP(4, 0.5);
val_my = A(1, 5);

diff = abs(val_matlab - val_my);
disp(diff)

%% Correctheidstest voor kkb.m
clear all;
x = linspace(-1, 1, 10);
y = linspace(-1, 1, 12);
[X, Y] = meshgrid(x, y);
max_graad = 9;
normen1 = zeros(max_graad,1);

F1 = sin(5*X + 3*Y);
C1 = kkb(x, y, F1, max_graad, max_graad);

for graad = 1:max_graad
    
    C1 = kkb(x, y, F1, graad, graad);
    A1 = get_leg_mtx(x, graad);
    B1 = get_leg_mtx(y, graad);
    F1_approx = B1 * C1 * A1';
    
    % Frobeniusnorm van residu
    residu1 = F1_approx - F1;
    normen1(graad) = norm(residu1, 'fro');
end

% Plot
figure;
semilogy(1:max_graad, normen1, '-o', 'DisplayName', 'Sine Wave function');
xlabel('Graad');
ylabel('Frobeniusnorm van residu');
title('Fout (Frobeniusnorm) vs graad');
legend;
grid on;
hold on;

% Zelfde test met polynoom
normen2 = zeros(max_graad,1);

Coef = 10*rand(10,1);
p2 = Coef';
F2 = polyval(p2, X) + polyval(p2, Y);

for graad = 1:max_graad
    
    C2 = kkb(x, y, F2, graad, graad);
    A2 = get_leg_mtx(x, graad);
    B2 = get_leg_mtx(y, graad);
    F2_approx = B2 * C2 * A2';
    
    % Frobeniusnorm van residu
    residu2 = F2_approx - F2;
    normen2(graad) = norm(residu2, 'fro');
end

% Plot
figure;
semilogy(1:max_graad, normen2, '-o', 'DisplayName', 'Random polynomial');
xlabel('Graad');
ylabel('Frobeniusnorm van residu');
title('Fout (Frobeniusnorm) vs graad');
grid on;
legend;
%% Correctheidstest voor kkb_spline.m
clear all;
f = @(x) (1/2)*x.^3 + 3*x.^2 -5*x +7;

x_eval = linspace(-5, 5, 11);
k = 3;
n = 5;
t = linspace(min(x_eval), max(x_eval), n + k + 1)';
y_eval = f(x_eval);

xplot = linspace(min(x_eval), max(x_eval), 1000);
z_benadering = kkb_spline(t, x_eval, y_eval', xplot);
z_controle = f(xplot);

fout = norm(z_benadering - z_controle);
disp(fout);

