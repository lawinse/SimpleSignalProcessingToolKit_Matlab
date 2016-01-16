function [ y ,x,p] = ct_imp_plot_private(x0,xl,xr,co,isplot,p,varargin)
%CT_IMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0 偏移量
%   xl ，xr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   x 时间序列
if nargin < 6
    p = 0.01;
    if nargin < 5
        isplot = 1;
    end
    if nargin < 4
        co = 1;
    end
end
%xl = x0-20;
%xr = x0+20;
%p = 0.01;
x = xl:p:xr;
n = length(x);
y = zeros(1,n);
y(1,(x0-xl)/p+1) = co.*1/p;
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Imp_Time_Domain');
    plot(x,y,'LineWidth',3);
    ttl = strcat(num2str(co),'*δ(t-',num2str(x0),')');
    title(ttl);
    xlabel('t');
    ylabel('f(t)');
    axis([x0-10 x0+10 min(0,co*1.5) max(0,co*1.5)]);
    grid on
end

end

