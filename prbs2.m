function out = prbs2(n,m,N)
in = [ ones(1,1), zeros(1,m-1) ];
for i=1:N
    xr(1) = xor(in(n),in(m));
    j=1:m-1;
    in(m+1-j)=in(m-j);
    in(1)=xr(1);
    out(i)=in(m);
end
end

