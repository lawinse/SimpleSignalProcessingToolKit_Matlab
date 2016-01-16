function [ y ] = ct_Rec_plot( x0,x1,xl,xr,co,isplot,varargin )
%CT_REC_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0，x1 带宽
%   xl ，xr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   x 时间序列

if nargin < 6
     isplot = 1;
end


syms x;
y = co*(heaviside(x-x0)-heaviside(x-x1));
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Rec_Time_Domain');
    tmp = subs(y,x,xl:0.01:xr);
    maxx = max(tmp)* 1.25;
    minx = min(tmp)* 1.25;
    %ezplot(X)
    plot(xl:0.01:xr,tmp,'LineWidth',2);
    axis([xl xr minx maxx]);
    grid on;
end
%ylim([min(0,co*1.25) max(0,co*1.25)]);
%xlim([x0+(xl-x0).*0.2 x1+(xr-x1).*0.2]);




end

