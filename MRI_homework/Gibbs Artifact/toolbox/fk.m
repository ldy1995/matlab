function [ fk ] = fk(x,f,k)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

che=f.*exp(1i*k*pi*x);
fk=(1/2)*sum(che);

end

