function [ f,k ] = dt_conv( f1,f2,k1,k2,isplot,varargin )
%DT_CONV Summary of this function goes here
%   Detailed explanation goes here
%f:   卷积和序列f(k)对应的非零样值向量 
%k:   序列f(k)的对应序号向量 
%f1:  序列f1(k)非零样值向量 
%f2:  序列f2(k)非零样值向量 
%k1:  序列f1(k)的对应序号向量  
%k2:  序列f2(k)的对应序号向量
if nargin < 5
    isplot = 1;
end
len1 = length(k1);
len2 = length(k2);
if (len1 > len2)
    [f2,k2] = reSam(f2,k2,k1);
end

if (len1 < len2)
    [f1,k1] = reSample(f1,k1,k2);
end
    


f = conv(f1,f2);
k0 = k1(1) + k2(1);
k3 = length(f1)+length(f2)-2;
k = k0:k0 + k3;
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Result');
    subplot(2,2,1);
    stem(k1,f1);
    title('f1[n]');
    xlabel('n');
    ylabel('f1[n]');
    subplot(2,2,2);
    stem(k2,f2);
    title('f2[n]');
    xlabel('n');
    ylabel('f2[n]');
    subplot(2,2,3);
    stem(k,f);
    title('f[n]=f1[n]*f2[n]');
    xlabel('n');
    ylabel('f[n]');
    h = get(gca,'position');
    h(3) = 2.5*h(3);
    set(gca,'position',h);
    grid on
end
end

