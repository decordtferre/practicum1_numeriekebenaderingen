%% Kostenfunctie plotten van de twee vorige datasets
% Dataset 1: Gaussische fucntie
% Dataset 2: Membrane
clear; clc;

N = 31; M = 31;
x = linspace(-1, 1, N);
y = linspace(-1, 1, M);
[X, Y] = meshgrid(x, y);

% Datasets
F1 = exp(1 - (2.5*X).^2 - (2*Y).^2);
F2 = membrane(1, 15);

graden = 1:40;
kost1 = zeros(1, 20);
kost2 = zeros(1, 20);

for n = graden
    % Legendre matrices
    A = get_leg_mtx(x, n);
    B = get_leg_mtx(y, n);
    
    % Dataset 1: Gaussische functie
    C1 = kkb(x, y, F1, n, n);
    F1_approx = B * C1 * A';
    kost1(n) = sum(sum((F1 - F1_approx).^2));
    
    % Dataset 2: Membrane
    C2 = kkb(x, y, F2, n, n);
    F2_approx = B * C2 * A';
    kost2(n) = sum(sum((F2 - F2_approx).^2));
end

% Plot, semilogplot voor betere visuele representatie
figure;
semilogy(graden, kost1, 'b-o', 'DisplayName', 'Gauss');
hold
semilogy(graden, kost2, 'r-o', 'DisplayName', 'Membrane');
legend;
xlabel('Graad van de polynomen (n)');
ylabel('Totale kwadratische fout (logaritmische schaal)');
title('Convergentie van de KKB-benadering');
grid on;

% Bevinding: Gaussische functie convergeert sneller dan membrane
% omdat de Gaussische functie glad is en dus oneindig differentieerbaar
% is, en daarom dus beter te benaderen is met een beperkt aantal polynomen.
% De Membrane-functie (het MATLAB logo) is de oplossing van de
% eigenfunctie van van de Laplaciaan van een L-vormige regio en bevat ook
% scherpe overgangen en niet differentieerbare punten, waardoor er dus met
% een hogere graad moet benaderd worden om een degelijk resultaat te
% krijgen.

% Vanaf graad 30 is de figuur eigenlijk niet meer zo representatief om dat
% we dan eigenlijk niet meer aan het benaderen zijn, maar aan het
% interpoleren zijn omdat we bij graad 30 31 coëfficiënten hebben. Met 31 
% coëfficiënten kun je een polynoom construeren die precies door alle 31 
% meetpunten (gekozen in N & M) gaat. De wiskundige fout wordt dan 
% theoretisch nul.
