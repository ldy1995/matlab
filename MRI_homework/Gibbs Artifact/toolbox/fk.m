function [ fk ] = fk(x,f,k)
%   2017/6/4  by Danyang Li
%   E-mail: lidanyang1995@smu.edu.cn

che=f.*exp(1i*k*pi*x);
fk=(1/2)*sum(che);

end

