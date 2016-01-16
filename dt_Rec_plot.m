function [ y,n ] = dt_Rec_plot( n0,n1,nl,nr,co,isplot,varargin )
%DT_REC_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   n0��n1 ����
%   nl ��nr ������
%   co ϵ��
%   y ʱ���ź�
%   n ʱ������
if nargin < 6
    isplot = 1;
end
n = nl:nr;
y = co.*(n>=n0&n<=n1);
if isplot == 1
    figure('NumberTitle', 'off', 'Name', 'Rec_Time_Domain')
    stem(n,y);
    xlabel('n');
    ylabel('f(n)');
    axis([n0-10 n1+10 min(0,co*1.5) max(0,co*1.5)]);

    grid on

end
end

