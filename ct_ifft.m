function [ y,t ] = ct_ifft( X,t,tl,tr ,isplot,varargin)
%CT_IFFT Summary of this function goes here
%   Detailed explanation goes here
if nargin<5
    isplot = 1;
if nargin < 3
    tl = -20;
    tr = 20;
end
end

syms t;
y = ifourier(X,t);
tt = tl:0.01:tr;
tmp = subs(y,t,tt);

for i = 1:length(tmp)
    if abs(tmp(i)) == Inf
        if sign(tmp(i)) == 1
            tmp(i) = 100;
        else
            tmp(i) = -100;
        end
    end
end



maxx = max(tmp)* 1.25;
minx = min(tmp)* 1.25;
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'Time_Domain');
    plot(tl:0.01:tr,tmp,'LineWidth',2);
    if (minx == maxx)
        axis([tl tr minx-0.5 maxx+0.5]);
    else
    axis([tl tr minx maxx]);
    end
    grid on;
end

end

