function A = get_leg_mtx(x, n)
    
    x = x(:); % Zorgt ervoor dat x een kolomvector is
    N = length(x);
    A = zeros(N, n+1);
    
    % Basisgevallen
    A(:, 1) = 1;        % Graad 0 (kolom 1)
    
    if n >= 1
        A(:, 2) = x;    % Graad 1 (kolom 2)
    end


    % Recursie voor de rest
    for k = 2:n
        term1 = (2*k - 1) / k;
        term2 = (k - 1) / k;
        
        A(:, k+1) = term1 .* x .* A(:, k) - term2 .* A(:, k-1);
    end
end