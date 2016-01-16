function [ y,t ] = dt_exp_plot( C,a,b,xl,xr,x0,isplot,varargin)
%DT_EXP_PLOT Summary of this function goes here
%   Detailed explanation goes here
t = xl:1:xr;
if nargin < 7
    isplot = 1;
end

if (b == 0)
    %y = C.*exp(a.*(t-x0));
    y = C.*(a).^t.*(t>x0);
    if isplot == 1
        figure('NumberTitle', 'off', 'Name', 'Exp_Time_Domain');
        stem(t,y);
        ttl = strcat(num2str(C),'*',num2str(a),'^n*u(n-',num2str(x0),'))');
        title(ttl);
        xlabel('n');
        ylabel('f(n)');
        grid on;
    end
else
   % y = C.*exp((a+b.*j)*(t-x0));
    y = C.*(a+b.*j).^(t-x0);
    if (isplot == 1)
        figure('NumberTitle', 'off', 'Name', 'Exp_Time_Domain');
        tmp = subs(y,t,xl:0.01:xr);
        yr = real(tmp);
        yi = imag(tmp);
        subplot(2,1,1);
        stem(t,yr);
        title('realPart');
        subplot(2,1,2);
        stem(t,yi);
        title('imagPart');
    end

end


end


