% function [ X,w,n ] = dt_fft( x,n,isplot,pp,varargin )
% %DT_FFT Summary of this function goes here
% %   Detailed explanation goes here
% %   n ��ɢ�ź�ʱ������
% %   x ��ɢ�����ź�
% %   xl��xr ������
% %   pp ������
% %   X Ƶ��
% %   w  Ƶ������
% 
% if nargin < 4
%     pp = 0.01;
%     if nargin < 3
%         isplot =1;
%     end
% end  
% p = pp*pi;
% k = -1/pp:1/pp;
% w = p*k;
% X = x*(exp(-j*p)).^(n'*k);
% if (isplot == 1)
% figure('NumberTitle', 'off', 'Name', 'Freq_Domain');
% subplot(2,1,1);
% plot(w,abs(X));
% xlim([-pi pi])
% grid on;
% 
% subplot(2,1,2);
% plot(w,phase(X));
% xlim([-pi pi])
% grid on;
% end
% end
% 
function [ y1,f,t,p] = dt_fft( x,t,xl,xr,isplot,p ,varargin)
%CT_FFT Summary of this function goes here
%   Detailed explanation goes here
%   t �����ź�ʱ������
%   x �����ź�
%   xl��xr ������
%   p ������
%   y1 Ƶ��
%   f  Ƶ������

[ll,rr,pp] = getFromT(t);

if nargin < 6
    p = 0.01;
    if nargin < 5
    isplot = 1;
    end
    if nargin < 3
         xr = rr;
         xl = ll;
    end
    
    
end  

Fs = 1/p;
n = (xr-xl)/p+1;
y1 = fft(x);
y2 = fftshift(y1);
f = (0:n-1)*Fs/n-Fs/2;
%hold on;
lenf = length(f);
leny2 = length(y2);
if (lenf > leny2)
    f = resample(f,leny2,lenf);
end
if(lenf < leny2)
    y2 = resample(y2,lenf,leny2);
end
if (isplot == 1)
figure('NumberTitle', 'off', 'Name', 'Freq_Domain');
plot(f,abs(y2),'b');
end



end

