
N = 21; h = CH9MP1(N,H_d);
Omega = linspace(0,2*pi,1000); samples = linspace(0,2*pi*(1-1/N),N);
H = CH5MP1(h,1,Omega);
subplot(2,1,1); stem([0:N-1],h,'k.'); xlabel('n'); ylabel('h[n]');
subplot(2,1,2); 
plot(samples,H_d(samples),'k.',Omega,H_d(Omega),'k:',Omega,abs(H),'k');
axis([0 2*pi -0.1 1.6]); xlabel('\Omega'); ylabel('|H(\Omega)|');
legend('Samples','Desired','Actual','Location','North');



function [h] = CH9MP1(N,H_d)

    Omega = linspace(0,2*pi*(1-1/N),N);

    H = 1.0*H_d(Omega); h = real(ifft(H));
end

function [H] = CH5MP1(B,A,Omega)

    N_1 = length(B)-1; N_2 = length(A)-1;
    H = polyval(B,exp(1j*Omega))./polyval(A,exp(1j*Omega)).*...
    exp(1j*Omega*(N_2-N_1));

end