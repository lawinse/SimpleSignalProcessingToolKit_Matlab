function [ y,x,p ] = ct_Rec_plot_private( x0,x1,xl,xr,co,isplot,p,varargin )
%CT_REC_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0，x1 带宽
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
    if nargin < 5
        co = 1;
    end
end

x = xl:p:xr;
y = co.*(x>x0&x<x1);
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Rec_Time_Domain');
    plot(x,y,'LineWidth',2);
    xlabel('t');
    ylabel('f(t)');
    ylim([min(0,co*1.25) max(0,co*1.25)]);
    xlim([x0+(xl-x0).*0.2 x1+(xr-x1).*0.2]);
    grid on;
end



end

