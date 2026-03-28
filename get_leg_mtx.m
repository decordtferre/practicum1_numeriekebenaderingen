function A = get_leg_mtx(x, n)
    
    x = x(:);
    N = length(x);
    A = zeros(N, n+1);

    A(:, 1) = 1;

    if n >= 1
        A(:, 2) = x;
    end

    for k = 1:n-1
        A(:, k+2) = ((2*k+1) .* x .* A(:, k+1) - k .* A(:, k)) / (k+1);
    end
end