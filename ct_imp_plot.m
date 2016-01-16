function [y1] = ct_imp_plot(x0,xl,xr,co,isplot,varargin)
%CT_IMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0 偏移量
%   xl ，xr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   x 时间序列

    if nargin < 5
        isplot = 1;
    end
p = 0.01;
%xl = x0-20;
%xr = x0+20;
%p = 0.01;

syms t;
y1 = co*dirac(t-x0);
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Imp_Time_Domain');
    x = xl:p:xr;
    n = length(x);
    y = zeros(1,n);
    y(1,(x0-xl)/p+1) = co.*1/p;
    plot(x,y,'LineWidth',2);

    if (co==1)
        ttl = strcat('δ(t-',num2str(x0),')');
    else
        ttl = strcat(num2str(co),'δ(t-',num2str(x0),')');
    end
    title(ttl);
    xlabel('t');
    ylabel('f(t)');
    axis([x0-10 x0+10 min(0,co*1.5) max(0,co*1.5)]);
    grid on
end

end

