x = @(n)2.*cos(2*pi*n/6).*(n>=0 & n<10);
some = filter(b,a,delta(n),z);

result = conv(x(n),some(n));


stem([0:60],result,'k'); xlabel('n'); ylabel('y[n]');