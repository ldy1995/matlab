function [ Wkl ] = transWkl(x,k,l)
%   �任����Wkl
%   2017/6/4  by Danyang Li
%   E-mail: lidanyang1995@smu.edu.cn
qu=Chebyshev(x,l).*exp(-1i*k*pi*x);
Wkl=1/2*sum(qu);%������-1��1��
end

