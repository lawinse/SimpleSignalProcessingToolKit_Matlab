function [  ] = ZT_zp_plot( num,den )
%ZT Summary of this function goes here
%   Detailed explanation goes here
figure('NumberTitle', 'off', 'Name', 'Zplane');
zplane(num,den);
end

