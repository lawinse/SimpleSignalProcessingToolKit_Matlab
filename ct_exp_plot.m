function [ y ] = ct_exp_plot( C,a,b,xl,xr,x0,isplot,varargin )
%CT_EXP_PLOT Summary of this function goes here
%   Detailed explanation goes here
syms t;

if nargin <7
    isplot = 1;
end
if (b == 0)
    y = C.*exp(a.*t);
    if isplot == 1
        tmp = subs(y,t,xl:0.01:xr);
        figure('NumberTitle', 'off', 'Name', 'Exp_Time_Domain');
        plot(xl:0.01:xr,tmp,'LineWidth',2);
        ttl = strcat(num2str(C),'*exp(',num2str(a),'*(t-',num2str(x0),'))');
        title(ttl);
        xlabel('t');
        ylabel('f(t)');
        grid on;
    end
else
    y = C.*exp((a+b*j)*t);
    if (isplot == 1)
        figure('NumberTitle', 'off', 'Name', 'Exp_Time_Domain');
        tmp = subs(y,t,xl:0.01:xr);
        yr = real(tmp);
        yi = imag(tmp);
        subplot(2,1,1);
        plot(xl:0.01:xr,yr);
        title('realPart');
        subplot(2,1,2);
        plot(xl:0.01:xr,yi);
        title('imagPart');
    end
end

end

