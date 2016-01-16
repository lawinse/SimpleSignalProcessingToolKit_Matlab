function [ ya,xa ] = reSample( y,x,p,q )
%RESAMPLE Summary of this function goes here
%   Detailed explanation goes here
ya = resample(y,p,q);
xa = resample(x,p,q);

end

