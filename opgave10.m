load("Documents/MATLAB/practicum1_numeriekebenaderingen/exercise10.mat")

xplot = linspace(min(x), max(x), 1000);
evaluatie1 = kkb_spline(t1, x, y', xplot);
evaluatie2 = kkb_spline(t2, x, y', xplot);


figure;
hold on
plot(x, y, 'ob', xplot, evaluatie1, 'r', xplot, evaluatie2, 'g');
legend('Meetpunten', 'Knooppuntenrij t1', 'Knooppuntenrij t2');
xlabel('x'); ylabel('y');