%Lab 3


%% A. 
%1) 2.4pi/2pi = m/n ---> n = 5,  3.2pi/2pi = m/n ---> 5. No = 5
%2) x[𝑛] = 4 cos(2.4𝜋𝑛) + 2 sin(3.2𝜋𝑛)


T = 1/1000; N_0 = 100; n = (0:N_0-1);
x = 4*cos(2.4*pi*n)+ 2*sin(3.2*pi*n);
X = fft(x)/N_0; f = (0:N_0-1)/(T*N_0);
stem(f-1/(2*T),fftshift(abs(X)),'k.');
axis([-500 500 -0.05 3]); xlabel('f [Hz]'); ylabel('|X(f)|');


%angle for phase

%% 3) y[n] = 3abs(cos(pi*n))

y = 3*abs(pi*n);
Y = fft(y)/N_0; f = (0:N_0-1)/(T*N_0);
stem(f-1/(2*T),fftshift(abs(X)),'k.');
axis([-500 500 -0.05 3]); xlabel('f [Hz]'); ylabel('|Y(f)|');



%% B. 
%1) 

N_0 = 32; n = (0:N_0-1); Omega_0 = 2*pi/N_0;
x_n = [ones(1,5) zeros(1,23) ones(1,4)];

for r = 0:N_0-1 
    X_r(r+1) = sum(x_n.*exp(-1i*r*Omega_0*n))/N_0; 
end

x = real(ifft(X_r)*N_0); stem(n,x,'k.');
axis([0 99 -1.1 1.1]); xlabel('n ); ylabel(’x[n]');




%% C. 

N_0 = 32;n = -16:N_0-17; N_0 = 32; Omega_0 = (2*pi)/N_0;
u = @(n) (n>=-4).*(n<=4);
x = [zeros(1,N_0)];

for r = 0:N_0-1
    x(r+1) = (r-16)*Omega_0;
end


stem(x,u(n)); axis([-pi pi 0 2]);
title ('System Response C.I)'); xlabel('n'); ylabel('Y[r]');


%% II.)

n = (1:N_0); N_0 = 16; Omega_0 = 2*pi/N_0;
x_1 = 4*cos((pi.*n)/8);
X_r = [zeros(1,N_0)];


for r = 0:N_0-1
    X_r(r+1) = sum(x_1.*exp(-1i*r*Omega_0*n))/N_0;
end



n_h = -16:15;
u_h = @(n_h) (n_h>=-4).*(n_h<=4);
X_r_dim = cat(2,X_r,X_r);
figure;
stem(n_h,u_h(n_h).*real(X_r_dim)); axis([-16 16 0 2]);


%% III


n = (1:N_0); N_0 = 16; 
Omega_0 = 2*pi/N_0;
x_2 = 4*cos((pi.*n)/2);
X_r = [zeros(1,N_0)];

for r = 0:N_0-1
    X_r(r+1) = sum(x_2.*exp(-1i*r*Omega_0*n))/N_0;
end


n_h = -16:15;
u_h = @(n_h) (n_h>=-4).*(n_h<=4);
zero = [1,zeros(8)];
X_r_dim = cat(2,X_r,X_r);
stem(n_h,u_h(n_h).*real(X_r_dim)); axis([-16 16 0 2]); 

