clear; clc;

% Data inlezen
F = double(imread('matterhorn.png'));
[M, N] = size(F);

% Rooster
x = linspace(-1, 1, N);
y = linspace(-1, 1, M);
[X, Y] = meshgrid(x, y);

n = 25; m = 25;
C = kkb(x, y, F, n, m);
A = get_leg_mtx(x, n);
B = get_leg_mtx(y, m);
F_approx = B * C * A';

%% Plot 1: originele data
figure;
surf(X, Y, F, 'EdgeColor', 'none', 'LineStyle', 'none', 'FaceLighting', 'phong');
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]);
title('Matterhorn - origineel');
xlabel('relatieve x-richting'); ylabel('relatieve y-richting'); zlabel('relatieve hoogte');

%% Plot 2: benadering
figure;
surf(X, Y, F_approx, 'EdgeColor', 'none', 'LineStyle', 'none', 'FaceLighting', 'phong');
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]);
title('Matterhorn - benadering (n=m=25)');
xlabel('relatieve x-richting'); ylabel('relatieve y-richting'); zlabel('relatieve hoogte');

%% Plot 3: bovenaanzicht origineel
figure;
imagesc(F);
colorbar;
cb = colorbar;
xlabel('relatieve x-richting'); ylabel('relatieve y-richting');cb.Label.String = 'Hoogte';
title('Matterhorn - bovenaanzicht origineel');
axis equal tight;

%% Plot 4: bovenaanzicht benadering
figure;
imagesc(F_approx);
colorbar;
cb = colorbar;
xlabel('relatieve x-richting'); ylabel('relatieve y-richting');cb.Label.String = 'Hoogte';
title('Matterhorn - bovenaanzicht benadering (n=m=25)');
axis equal tight;

%% Plot 5: contourplot origineel
figure;
contourf(X, Y, F, 20);
colorbar;
cb = colorbar;
xlabel('relatieve x-richting'); ylabel('relatieve y-richting');cb.Label.String = 'Hoogte';
title('Matterhorn - contour origineel');

%% Plot 6: contourplot benadering
figure;
contourf(X, Y, F_approx, 20);
colorbar;
cb = colorbar;
xlabel('relatieve x-richting'); ylabel('relatieve y-richting');cb.Label.String = 'Hoogte';
title('Matterhorn - contour benadering (n=m=25)');