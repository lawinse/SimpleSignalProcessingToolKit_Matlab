function [ ya,xa Ya,Xa] = LPF(y0,x0,n,lpf_l,lpf_r,lpf_co,varargin )
%LPF Summary of this function goes here
%   Detailed explanation goes here
%   y0 时间信号
%   x0 时间序列
%   n  重采样倍数
%   lpf_f,lpf_r，lpf_co 低通带宽，系数
%   ya，xa 处理后时域
%   YA，XA 处理后频域
[ll,rr,pp,len] = getFromT(x0);
if nargin < 6
    lpf_co = 1;
    %lpf_p = 0.01;
end
[y,x] = ct2dt_private(y0,x0,n);
[Y,X] = ct_fft_private(x,y,x(1),x(length(x)),0);
[L,R,P,LEN] = getFromT(X);

Xa = X;
Ya = abs(fftshift(Y)).*(X>=lpf_l&X<=lpf_r).*lpf_co;
[ya,xa] = ct_ifft_private(Y.*(X>=lpf_l&X<=lpf_r).*lpf_co,Xa,0);
figure('NumberTitle', 'off', 'Name', 'Result');
subplot(1,2,1);
plot(xa,real(ya));
xlim([ll rr]);
title('Time Domain');
subplot(1,2,2);
plot(Xa,Ya);
xlim([lpf_l lpf_r]);
title('Freq Domain');


end

