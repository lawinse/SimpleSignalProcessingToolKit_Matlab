function [ Lx ] = Laplace_( x )
%LAPLACE_ Summary of this function goes here
%   Detailed explanation goes here
syms t s;
x = sym(x);
Lx = laplace(x,t,s);

end

