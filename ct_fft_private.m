function [ y1,f,t,p] = ct_fft_private( t,x,xl,xr,isplot,p ,varargin)
%CT_FFT Summary of this function goes here
%   Detailed explanation goes here
%   t 连续信号时间序列
%   x 连续信号
%   xl，xr 定义域
%   p 采样率
%   y1 频谱
%   f  频谱序列

[ll,rr,pp] = getFromT(t);

if nargin < 6
    p = 0.01;
    if nargin < 5
    isplot = 1;
    end
    if nargin < 3
         xr = rr;
         xl = ll;
    end
    
    
end  

Fs = 1/p;
n = (xr-xl)/p+1;
y1 = fft(x);
y2 = fftshift(y1);
f = (0:n-1)*Fs/n-Fs/2;
%hold on;
lenf = length(f);
leny2 = length(y2);
if (lenf > leny2)
    f = resample(f,leny2,lenf);
end
if(lenf < leny2)
    y2 = resample(y2,lenf,leny2);
end
if (isplot == 1)
figure('NumberTitle', 'off', 'Name', 'Freq_Domain');
plot(f,abs(y2)*p,'b');
end



end

