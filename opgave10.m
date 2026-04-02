load("Documents/MATLAB/practicum1_numeriekebenaderingen/exercise10.mat")

xplot = linspace(min(x), max(x), 1000); % nog weghalen?
evaluatie1 = kkb_spline(t1, x, y, xplot);
evaluatie2 = kkb_spline(t2, x, y, xplot);


figure;
plot(x, y, 'o', xplot, evaluatie1, xplot, evaluatie2);
legend('Data', 'Knooppuntenrij t1', 'Knooppuntenrij t2');
xlabel('x'); ylabel('y');