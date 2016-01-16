function [ X,w ] = ct_fft( x,w,wl,wr,isplot,varargin)
%CT_FFT Summary of this function goes here
%   Detailed explanation goes here
if (nargin < 5)
    isplot = 1;
if nargin < 3
    wl = -50;
    wr = 50;
end
end

%figure;
syms w;
X = fourier(x,w);
xx = wl:0.01:wr;
if (isempty(findsym(X)))
    
    tmp = eval(X)*(xx>=wl&xx<=wr);
else
    tmp = abs(subs(X,w,wl:0.01:wr));
end
maxx = max(tmp)* 1.25;
minx = min(tmp)* 1.25;
if (maxx == Inf) 
    for i = 1:length(tmp)
        if (tmp(i) == maxx) tmp(i) = 100;
        end
    end

end
if (maxx == minx)
    maxx = maxx + 1;
    minx = minx - 1;
end
%ezplot(X)
if (isplot == 1)
figure('NumberTitle', 'off', 'Name', 'Freq_Domain');
subplot(2,1,1);
plot(wl:0.01:wr,tmp);
axis([wl wr minx maxx]);
title('Freq');

tmp = phase(subs(X,w,wl:0.01:wr));
maxx = max(tmp)* 1.25;
minx = min(tmp)* 1.25;
if (maxx == minx)
    maxx = maxx + 1;
    minx = minx - 1;
end

%ezplot(X)
subplot(2,1,2);
plot(wl:0.01:wr,tmp);
axis([wl wr minx maxx]);
title('Phase');
end


end

