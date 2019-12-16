function [ Wkl ] = transWkl(x,k,l)
%UNTITLED3 Summary of this function goes here
%   变换矩阵Wkl
qu=Chebyshev(x,l).*exp(-1i*k*pi*x);
Wkl=1/2*sum(qu);%积分在-1到1上
end

