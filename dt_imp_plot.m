function [ y,n ] = dt_imp_plot( n0,nl,nr,co,isplot,varargin )
%DT_IMP_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   n0 偏移量
%   nl ，nr 定义域
%   co 系数
%   p 采样率
%   y 时域信号
%   n 时间序列
if nargin < 5
    isplot = 1;
end

n = nl:1:nr;
y = co*(n==n0);
if isplot == 1
    figure('NumberTitle', 'off', 'Name', 'Imp_Time_Domain');
    stem(n,y);
    ttl = strcat(num2str(co),'*δ(n-',num2str(n0),')');
    title(ttl);
    xlabel('n');
    ylabel('f(n)');
    axis([n0-10 n0+10 min(0,co*1.5) max(0,co*1.5)]);
    grid on
end
end

