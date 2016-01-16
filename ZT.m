function [ ht_n,Hz ,zz] = ZT( zero,pole,roc,nl,nr,scal,varargin )
%ZT Summary of this function goes here
%   Detailed explanation goes here
if nargin <6
    scal = 1;
end


nu = num2str(scal);
de = '1';   
syms z n;
for i = 1:length(pole)
    de = strcat(de,'*(z-',num2str(pole(i)),')');
end

for j = 1:length(zero)
    nu = strcat(nu,'*(z-',num2str(zero(j)),')');
end



zz = strcat('(',nu,')/(',de,')');
num = sym2poly(simple(sym(nu)));
den = sym2poly(simple(sym(de)));
ZT_zp_plot(num,den);
ht = iztrans(sym(zz));
ht_n = subs(ht,n,nl:nr);
y1 = dt_step_plot(0,nl,nr,1,1,0);
y2 = dt_step_plot(1,nl,nr,1,-1,0);
if (roc == 1)
    ht_n = ht_n .* y1;
else
    ht_n = -ht_n.* y2;
end

figure('NumberTitle', 'off', 'Name', 'Result');
subplot(2,1,1);
stem(nl:nr,ht_n);
Hz = tf(num,den,1);
grid on;
subplot(2,1,2);
bode(Hz);
grid on;



end

