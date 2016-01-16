function [ tmp,nn] = dt_Sym_plot( f,xl,xr,isplot,varargin )

if nargin < 4
        isplot= 1;
end

syms n;

Sym = sym(f);
tmp = double(subs(Sym,n,xl:1:xr));
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'DT-Function');
   
    maxx = max(tmp)* 1.25;
    minx = min(tmp)* 1.25;
    %ezplot(X)
    stem(xl:1:xr,tmp,'LineWidth',2);
    
    xlabel('t');
    ylabel('f(t)');
    axis([xl xr minx maxx]);
    grid on;
end
nn=xl:1:xr;
end