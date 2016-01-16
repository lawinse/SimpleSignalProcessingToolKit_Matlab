function [ x ] = iZtrans( X )
%IZTRANS Summary of this function goes here
%   Detailed explanation goes here
syms z n;
X = sym(X);
x = iztrans(X,z,n);

end

