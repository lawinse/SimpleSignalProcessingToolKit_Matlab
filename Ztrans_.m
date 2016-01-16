function [ X ] = Ztrans_( x )
%ZTRANS_ Summary of this function goes here
%   Detailed explanation goes here
syms z n;
x = sym(x);
X = simple(ztrans(x,n,z));

end

