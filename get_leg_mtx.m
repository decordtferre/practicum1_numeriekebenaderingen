function A = get_leg_mtx(x, n)
    
    x = x(:); % Zorgt ervoor dat x een kolomvector is
    N = length(x);
    A = zeros(N, n+1);
    
    % Basisgevallen
    A(:, 1) = 1; % P0(x) = 1
    if n >= 1
        A(:, 2) = x;
    end
    
    % Recursie voor de rest
    for k = 1:n-1
        A(:, k+2) = ((2*k+1) .* x .* A(:, k+1) - k .* A(:, k)) / (k+1);
    end
end