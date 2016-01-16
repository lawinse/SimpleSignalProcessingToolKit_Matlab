function [ lt,rt,p,len ] = getFromT( t )
%GETFROMT Summary of this function goes here
%   Detailed explanation goes here

len = length(t);
lt = t(1);
rt = t(len);
p = (rt-lt)./(len-1);

end

