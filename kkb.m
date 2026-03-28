function C = kkb(x,y,F,n,m)
    A = get_leg_mtx(x, n);
    B = get_leg_mtx(y, m);

    C = B \ F / A';
end