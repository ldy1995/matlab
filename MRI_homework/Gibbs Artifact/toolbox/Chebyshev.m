function [ T ] = Chebyshev( x,n )
%用递推公式计算chebyshev多项式
%   第二类切比雪夫多项式
% 2017/5/25    by Danyang Li
% E-mail: lidanyang1995@smu.edu.cn

[X,Y]=size(x);
T0=ones(1,Y);
T1=2*x;

Tn=T1;
Tn1=T0;
if n>=2
    for i=1:n
    T=2*x.*Tn-Tn1;
    Tn1=Tn;
    Tn=T;
    end
elseif n==0
    T=T0;
else
    T=T1;
end

%第一类切比雪夫多项式
% [X,Y]=size(x);
% T0=ones(1,Y);
% T1=x;
% 
% Tn=T1;
% Tn1=T0;
% if n>=2
%     for i=1:n
%     T=2*x.*Tn-Tn1;
%     Tn1=Tn;
%     Tn=T;
%     end
% elseif n==0
%     T=T0;
% else
%     T=T1;
% end
end

