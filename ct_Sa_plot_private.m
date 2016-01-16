function [ Sa,t,p] = ct_Sa_plot_private( x0,xl,xr,co,isplot,p,varargin )
%SA_PLOT Summary of this function goes here
%   Detailed explanation goes here
%   x0 ƫ����
%   xl ��xr ������
%   co ϵ��
%   p ������
%   y ʱ���ź�
%   x ʱ������
if nargin < 6
    p = 0.01;
    if nargin < 5
        isplot = 1;
        if nargin < 4
            co = 1;
        end
    end
end
%p = 0.01;
t = xl:p:xr;
Sa = (sin(co*(t-x0))./(co*(t-x0)));
 
Sa((x0-xl)./p+1) = 1;

if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Sa_Time_Domain');
    plot(t,Sa,'LineWidth',2);
    ttl = strcat('sin(',num2str(co),'*(t-',num2str(x0),'))/(t-',num2str(x0),')');
    title(ttl);
    xlabel('t');
    ylabel('f(t)');
    ylim([-co*0.25,co*1.05]);
    grid on;
end

end

