function [ y ,t] = ct_step_plot(x0,xl,xr,co,xco,isplot,varargin)
%CT_IMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0 偏移量
%   xl ，xr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   x 时间序列

    if nargin < 6
        isplot = 1;
    end
    
%xl = x0-20;
%xr = x0+20;
%p = 0.01;
syms t;
y = co*heaviside(xco*t-x0);
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Step_Time_Domain');
    tmp = subs(y,t,xl:0.01:xr);
    maxx = max(tmp)* 1.25;
    minx = min(tmp)* 1.25;
    %ezplot(X)
    plot(xl:0.01:xr,tmp,'LineWidth',3);
    ttl = strcat(num2str(co),'u(',num2str(xco),'*t-',num2str(x0),')');
    title(ttl);
    xlabel('t');
    ylabel('f(t)');
    axis([xl xr minx maxx]);
    grid on
end

end

