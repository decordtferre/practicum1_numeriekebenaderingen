function Z = kkb_spline(t, x, f, xplot)
R = length(x);
%t_length = n + 2k + 1
t_length = length(t);
k = floor((t_length-R)/2);
n = t_length - k - 1;


M = zeros(R, n+k);

for graad = 1:R
    xg = x(graad);
    % graad 0
    N = zeros(n, k+1);
    for i = 1:n
        if (t(i) <= xg && xg < t(i+1))
            N(i,1) = 1;
        end
    end

    % recursief verder werken
    for ki = 1:k
        for i = 1:n
            % Eerste term opstellen
            if (t(i+ki) - t(i) == 0)
                term1 = 0;
            else
                term1 = (xg-t(i))/ (t(i+ki) - t(i)) * N(i, ki);
            end

            % Tweede term opstellen
            if (t(i+ki+1)-t(i+1) == 0)
                term2 = 0;
            else
                term2 = (t(i+ki+1)-xg)/(t(i+ki+1)-t(i+1)) * N(i+1, ki);
            end

            N(i,ki+1) = term1 + term2;
        end
    end

    M(graad,:) = N(:,k+1)';
end

% Normaalstelsel oplossen
c = M\f;

% Evalueren van de splinefuncties
Z = deboor(k, t, c, xplot);
            
end