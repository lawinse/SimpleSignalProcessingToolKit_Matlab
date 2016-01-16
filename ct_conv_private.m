function [ f,k,p ] = ct_conv_private( f1,f2,k1,k2,p ,varargin)
%SCONV Summary of this function goes here
%   Detailed explanation goes here
%   f1,f2 两个时间信号
%   k1,k2 两个时间序列
%   p   采样率
%   f   卷积结果
%   k   卷积时间序列

len1 = length(k1);
len2 = length(k2);
if (len1 > len2)
    [f2,k2] = reSam(f2,k2,k1);
    %f
%     k3 = len2+len2-2;
%     k0 = k1(1)+k2(1);
    
end

if (len1 < len2)
    [f1,k1] = reSam(f1,k1,k2);
%     k3 = len1+len1-2;
%     k0 = k1(1)+k2(1);
end

    k0 = k1(1) + k2(1);
    k3 = length(f1) + length(f2) -2;


[ll,rr,pp] = getFromT(k2);

if nargin < 5
    p = pp;
    
end  

figure;
f = conv(f1,f2);
f = f*p;

k = k0:p:k0 + k3*p;
subplot(2,2,1);
plot(k1,f1);
ylim([min(f1)*1.2 max(f1)*1.2])
%axis([-1 1.5 0 2])
title('f1(t)');
xlabel('t');
ylabel('f1(t)');
grid on;
subplot(2,2,2);
plot(k2,f2);
ylim([min(f2)*1.2 max(f2)*1.2])
title('f2(t)');
grid on;
subplot (2,2,3);
plot(k,f);
xlim([k1(1),k1(length(k1))]);
ylim([min(f)*1.2 max(f)*1.2])
%axis([-1 4 0 1]);
grid on;
h = get(gca,'position');
h(3) = 2.5*h(3);
set(gca,'position',h);
title('f(t) = f1(t) * f2(t)');
xlabel('t');
ylabel('f(t)');


end

