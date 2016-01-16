function [ tmp,nn] = ct_Sym_plot( f,xl,xr,isplot,varargin )

if nargin < 4
        isplot= 1;
end

syms t;

Sym = sym(f);
tmp = double(subs(Sym,t,xl:0.01:xr));
if (isplot == 1)
    figure('NumberTitle', 'off', 'Name', 'CT-Function');
   
    maxx = max(tmp)* 1.25;
    minx = min(tmp)* 1.25;
    %ezplot(X)
    plot(xl:0.01:xr,tmp,'LineWidth',2);
    
    xlabel('t');
    ylabel('f(t)');
    axis([xl xr minx maxx]);
    grid on;
end
nn = xl:0.01:xr;
end