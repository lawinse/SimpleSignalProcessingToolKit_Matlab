function [ Sa,t ] = dt_Sa_plot( n0,nl,nr,co,isplot,varargin )
%DT_IMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   n0 偏移量
%   nl ，nr 定义域
%   co 系数
%   y 时域信号
%   x 时间序列
if nargin < 5
    isplot = 1;
end

t = nl:nr;
Sa = (sin(co.*(t-n0))./(co*(t-n0))).*(t-n0<0)+(sin(co.*(t-n0))./(co*(t-n0))).*(t-n0>0);

Sa(n0-nl+1)= 1;

if isplot == 1
    figure('NumberTitle', 'off', 'Name', 'Sa_Time_Domain');
    stem(t,Sa);
    ttl = strcat('sin(',num2str(co),'*(n-',num2str(n0),'))/(n-',num2str(n0),')');
    title(ttl);
    xlabel('n');
    ylabel('f(n)');
    ylim([-co*0.25,co*1.05]);
    grid on;
end

end

