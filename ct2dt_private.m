function [ ydt,xdt,pdt,pct] = ct2dt_private( yct,xct,n,isplot,pct,varargin )
%CT2DT Summary of this function goes here
%   Detailed explanation goes here
%   yct 连续时间信号
%   xct 连续时间时间序列
%   n   采样倍数
%   pct 连续时间采样率
%   ydt 采样后信号
%   xdt 采样后时间序列
%   pdt 采样后采样率

[ll,rr,pp] = getFromT(xct);

if nargin < 4
    pct = pp;
    isplot = 1;
    if nargin < 3
        n = 1/pct;
    end
end

x = downsample(xct,n);
y = downsample(yct,n);
xlen = length(x);
pdt = (x(xlen)-x(1))./(xlen+1);
xdt = x;
ydt = y;
if (isplot == 1)
figure('NumberTitle', 'off', 'Name', 'Change');
subplot(2,1,1);
stem(x,y);
title('After');
subplot(2,1,2);
plot(xct,yct);
title('Origin');
end



end

