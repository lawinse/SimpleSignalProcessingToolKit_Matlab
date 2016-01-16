function [ res,a0,an ] = FourierS( fun,Tl,Tr,N )
%FOURIERS Summary of this function goes here
%   Detailed explanation goes here
syms t n;
T = Tr-Tl;
a0 = int(fun,t,Tl,Tr)/T;
an = int(fun*exp(-j*n*2*pi*t/T),t,Tl,Tr)/T;
if (N == 0)
    res = a0;
else 
    res = limit(an,n,N);
end

end

