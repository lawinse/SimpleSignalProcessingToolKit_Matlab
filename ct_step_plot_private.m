function [ y ,x,p] = ct_step_plot_private(x0,xl,xr,co,xco,isplot,p,varargin)
%CT_IMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0 偏移量
%   xl ，xr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   x 时间序列
if nargin < 7
    p = 0.01;
    if nargin < 6
    isplot = 1;
    end
end
%xl = x0-20;
%xr = x0+20;
%p = 0.01;
x = xl:p:xr;
if xco > 0
    y = co*(x>=x0./xco);
else
    y = co*(x<=(x0./xco));
end
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Step_Time_Domain')
    plot(x,y,'LineWidth',3);
    ttl = strcat(num2str(co),'u(',num2str(xco),'*t-',num2str(x0),')');
    title(ttl);
    xlabel('t');
    ylabel('f(t)');
    axis([x0-10 x0+10 min(0,co*1.5) max(0,co*1.5)]);

    grid on
end

end

