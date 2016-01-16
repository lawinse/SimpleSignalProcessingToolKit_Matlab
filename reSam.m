function [ y,k ] = reSam( y1,k1,k2 )
%RESAMPLE1 Summary of this function goes here
%   Detailed explanation goes here
k = k2;
y = 0*k2;

for i = 1:length(k)
    if k(i) == k1(1)
        break;
    end
end
j = 1;
for ii = i:length(k)
    y(ii) = y1(j);
    j = j +1;
    if j > length(y1)
        break;
    end
end

        
end

