function C = kkb(x,y,F,n,m)

    % x: rijvector met x-roosterpunten (afmeting is N)
    % y: rijvector met y-roosterpunten (afmeting is M)
    % Matrix F(i,j) bevat de werkelijke functiewaarden op die roosterpunten
    % die horen bij het punt (x_j, y_i) (afmeting is M*N)
    
    A = get_leg_mtx(x, n);
    B = get_leg_mtx(y, m);
    
    % Berekent de kleinste-kwadratenoplossing voor B*C*A' = F
    C = B \ F / A';
end