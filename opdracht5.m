%% Benaderen van twee verschillende functievoorschriften

% Rooster aanmaken
N = 31; M = 31;
x = linspace(-1, 1, N);
y = linspace(-1, 1, M);
[X, Y] = meshgrid(x, y);
n = 7; m = 7;

A = get_leg_mtx(x, n);
B = get_leg_mtx(y, m);

%% Dataset 1: Gaussische functie
F1 = exp(1 - (2.5*X).^2 - (2*Y).^2);
C1 = kkb(x, y, F1, n, m);
F1_approx = B * C1 * A';

figure;
scatter3(X(:), Y(:), F1(:), 10, 'r', 'filled');
hold on;
surf(X, Y, F1_approx, 'EdgeColor', 'none', 'FaceAlpha', 0.8);
legend('Data', 'Benadering');
xlabel('x'); ylabel('y'); zlabel('z');
title('Dataset 1');

%% Dataset 2: Membrane
F2 = membrane(1, 15);
C2 = kkb(x, y, F2, n, m);
F2_approx = B * C2 * A';

figure;
scatter3(X(:), Y(:), F2(:), 10, 'r', 'filled');
hold on;
surf(X, Y, F2_approx, 'EdgeColor', 'none', 'FaceAlpha', 0.8);
legend('Data', 'Benadering');
xlabel('x'); ylabel('y'); zlabel('z');
title('Dataset 2: Membrane');