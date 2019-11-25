function outseq = prbs(n,m,len)
outseq = zeros(1,max(n,m)-1);
outseq = [ 1 outseq  ] ;
while length(outseq) < len+2*max(n,m)
    outseq = [xor(outseq(n),outseq(m))  outseq];
end
end
