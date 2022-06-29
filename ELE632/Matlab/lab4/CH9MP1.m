function [h] = CH9MP1(N,H_d)

    Omega = linspace(0,2*pi*(1-1/N),N);

    H = 1.0*H_d(Omega); h = real(ifft(H));
end