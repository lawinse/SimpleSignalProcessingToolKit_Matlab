function [ x ] = iLaplace_( X )
%ILAPLACE_ Summary of this function goes here
%   Detailed explanation goes here
syms s t;
X = sym(X);
x = ilaplace(X,s,t);
end

