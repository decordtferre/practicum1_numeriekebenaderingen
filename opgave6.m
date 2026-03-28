clear; clc;

N = 31; M = 31;
x = linspace(-1, 1, N);
y = linspace(-1, 1, M);
[X, Y] = meshgrid(x, y);

% Datasets
F1 = exp(1 - (2.5*X).^2 - (2*Y).^2);
F2 = membrane(1, 15);

graden = 1:20;
kost1 = zeros(1, 20);
kost2 = zeros(1, 20);

for n = graden
    % Legendre matrices
    A = get_leg_mtx(x, n);
    B = get_leg_mtx(y, n);
    
    % Dataset 1
    C1 = kkb(x, y, F1, n, n);
    F1_approx = B * C1 * A';
    kost1(n) = sum(sum((F1 - F1_approx).^2));
    
    % Dataset 2
    C2 = kkb(x, y, F2, n, n);
    F2_approx = B * C2 * A';
    kost2(n) = sum(sum((F2 - F2_approx).^2));
end

% Plot
figure;
semilogy(graden, kost1, 'b-o', 'DisplayName', 'Gauss');
hold
semilogy(graden, kost2, 'r-o', 'DisplayName', 'Membrane');
legend;
