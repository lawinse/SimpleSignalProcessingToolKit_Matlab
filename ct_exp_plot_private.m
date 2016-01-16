function [ y,t ] = ct_exp_plot_private( C,a,b,xl,xr,x0,isplot,varargin)
%CT_EXP_PLOT_PRIVATE Summary of this function goes here
%   Detailed explanation goes here
t = xl:0.01:xr;
if nargin < 7
    isplot  = 1;
    if nargin < 6
        x0 = 0;
    end
end

if (b == 0)
    y = C.*exp(a.*(t-x0));
    if isplot == 1
        figure('NumberTitle', 'off', 'Name', 'Exp_Time_Domain');
        plot(t,y,'LineWidth',2);
        ttl = strcat(num2str(C),'*exp(',num2str(a),'*(t-',num2str(x0),'))');
        title(ttl);
        xlabel('t');
        ylabel('f(t)');
        grid on;
    end
else
    y = C.*exp((a+b.*j)*(t-x0));
    yr = real(y);
    yi = imag(y); 
    if isplot == 1
    figure('NumberTitle', 'off', 'Name', 'Exp_Time_Domain');
    subplot(2,1,1);
    plot(t,yr);
    title('realPart');
    subplot(2,1,2);
    plot(t,yi);
    title('imagPart');
    end
end


end

