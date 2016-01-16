function [ Sa] = ct_Sa_plot( x0,xl,xr,co,isplot,varargin )
%SA_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0 偏移量
%   xl ，xr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   x 时间序列

    if nargin < 5
        isplot= 1;
    end

%p = 0.01;
syms t;

Sa = (sin(co*(t-x0))./(co*(t-x0)));
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Sa_Time_Domain');
    tmp = subs(Sa,t,xl:0.01:xr);
    maxx = max(tmp)* 1.25;
    minx = min(tmp)* 1.25;
    %ezplot(X)
    plot(xl:0.01:xr,tmp,'LineWidth',2);
    ttl = strcat('sin(',num2str(co),'*(t-',num2str(x0),'))/(t-',num2str(x0),')');
    title(ttl);
    xlabel('t');
    ylabel('f(t)');
    axis([xl xr minx maxx]);
    grid on;
end
end

