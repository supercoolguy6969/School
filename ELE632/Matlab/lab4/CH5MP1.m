function [H] = CH5MP1(B,A,Omega)

    N_1 = length(B)-1; N_2 = length(A)-1;
    H = polyval(B,exp(1j*Omega))./polyval(A,exp(1j*Omega)).*...
    exp(1j*Omega*(N_2-N_1));

end
