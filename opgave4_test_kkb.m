% Correctheidstest voor kkb
x = linspace(-1, 1, 10);
y = linspace(-1, 1, 12);
[X, Y] = meshgrid(x, y);
graad = 9;

F = sin(5*X + 3*Y);
% Benadering
C = kkb(x, y, F, graad, graad);
disp('Coëfficiëntenmatrix C:')
disp(C)

% Benaderende oppervlak evalueren
A = get_leg_mtx(x, graad);
B = get_leg_mtx(y, graad);
F_approx = B * C * A';

% Plot residu
residu = abs(F_approx(:) - F(:));
disp('Residu:')
disp(max(residu))  % moet ongeveer 0 zijn
figure;
surf(X, Y, abs(F_approx - F), 'EdgeColor', 'none');
colorbar;
xlabel('x'); ylabel('y'); zlabel('Absolute waarde residu');
title('Residu benadering');