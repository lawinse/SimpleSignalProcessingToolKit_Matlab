function [ y,k,p ] = dt_ifft( k,Y,isplot,p,varargin )
%CT_IFFT Summary of this function goes here
%   Detailed explanation goes here
%   k 频域时间序列
%   Y 频谱
%   p 时域采样率
%   y 时域信号
%   k 时域序列
[ll,rr,pp] = getFromT(k);

if nargin < 4
    p = 0.01;
    if nargin < 3
    isplot = 1;
    end
    
end  

magY = abs(Y);
angY = angle(Y);
%Y1 = Y * 0.9;
oriY = magY.*exp(i*angY);
len = length(k);
y = ifft(oriY,len);
if (isplot == 1)
figure('NumberTitle', 'off', 'Name', 'Time_Domain');
stem(k,real(y));
end
end

