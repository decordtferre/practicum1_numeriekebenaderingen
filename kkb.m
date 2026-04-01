function C = kkb(x,y,F,n,m)
    A = get_leg_mtx(x, n);
    B = get_leg_mtx(y, m);
    
    % Berekent de kleinste-kwadratenoplossing voor B*C*A' = F
    C = B \ F / A';
end