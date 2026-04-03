function Z = kkb_spline(t, x, f, xplot)
R = length(x);
%t_length = n + 2k + 1
t_length = length(t);
k = 3;
n = t_length - k - 1;


M = zeros(R, n+k);

for rij = 1:R
    xr = x(rij);
    % graad 0
    N = zeros(n+k, k+1);
    for i = 1:t_length-1
        if (t(i) <= xr && xr < t(i+1))
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
                term1 = (xr-t(i))/ (t(i+ki) - t(i)) * N(i, ki);
            end

            % Tweede term opstellen
            if (t(i+ki+1)-t(i+1) == 0)
                term2 = 0;
            else
                term2 = (t(i+ki+1)-xr)/(t(i+ki+1)-t(i+1)) * N(i+1, ki);
            end

            N(i,ki+1) = term1 + term2;
        end
    end

    M(rij,:) = N(:, k+1)';
end

% Normaalstelsel oplossen
c = M\f;

% Evalueren van de splinefuncties
Z = deboor(k, t, c, xplot);
            
end