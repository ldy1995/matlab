function [ Wkl ] = transWkl(x,k,l)
%UNTITLED3 Summary of this function goes here
%   �任����Wkl
qu=Chebyshev(x,l).*exp(-1i*k*pi*x);
Wkl=1/2*sum(qu);%������-1��1��
end

