%% A. Unit Impulse Response

%I.
n = (-5:20); 

delta = @(n) 1.0.*(n==0);
a=[1 -0.16 -0.16];
b= [0 0 0.33];

h = filter(b,a,delta(n));

clf; 
stem(n,h,'k'); 
xlabel('n'); 
ylabel('h[n]');


%II. 

a=[1 0 0.25];
b= [0 0 1];

h = filter(b,a,delta(n));
clf; 

stem(n,h,'k'); 
xlabel('n'); 
ylabel('h[n]');




%%B. Zero Input Response


delta = @(n) 1.0.*(n==0);
a=[1 -0.16 -0.16];
b= [0 0 0.33];

z = filtic(b,a,[1 2]);
some = filter(b,a,delta(n),z);

stem(n,some,'k'); 
xlabel('n'); 
ylabel('y[n]');



%%C. Zero-state Response

n = (0:11);
x = @(n)2.*cos(2*pi*n/6).*(n>=0 & n<10);


a = [1 -0.3 -0.1]; 
b = [0 0 2]; 


z = filtic(b,a,[1 2]);
y0 = filter(b,a,zeros(size(n)),z);
stem(n,y0,'k'); 
xlabel('n'); 
ylabel('y_{0} [n]');



%%D. Total Response 

y = filter(b,a,x(n));
stem(n,y,'k'); xlabel('n'); ylabel('y[n]');




%%E. 

result = conv(some(n),x(n));
stem([0:60],y,'k'); xlabel('n'); ylabel('y[n]');
