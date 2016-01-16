function [ ft,Hs ] = LCCDE_LT( ak,bk ,isCa,varargin)
%LCCDE_LT Summary of this function goes here
%   Detailed explanation goes here
if nargin < 3
    isCa = 1
end

asz = length(ak);
bsz = length(bk);
nu = '0';
de = '0';   
for i = 1:asz
    de = strcat(de,'+',num2str(ak(i)),'*s^',num2str(i-1));
end

for j = 1:bsz
    nu = strcat(nu,'+',num2str(bk(j)),'*s^',num2str(j-1));
end

ss = strcat('(',nu,')/(',de,')');

Hs = sym(ss)*laplace(sym('dirac(t)'));
ft = ilaplace(Hs);
if (isCa == 1)
    ft = ft.*sym('heaviside(t)');
else
    ft = -ft.*sym('heaviside(-t)');
end
figure('NumberTitle', 'off', 'Name', 'Result');
subplot(2,1,1);
ezplot(ft);
subplot(2,1,2);
ezplot(Hs);
end

