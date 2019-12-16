function [ g ] = countg( f,l,N )
%计算Chebyshev系数 g 
%  原始数据f在此函数中已归一化到在-1到1间，如此才能使用Chebyshev重建
%  输入的f必须转换成列向量，N表示所采的部分傅立叶空间中的行数
%  k为-N到N，l为chebyshev的逼近阶数
% f=mapminmax(f);%归一化到（-1,1）
%   2017/6/4  by Danyang Li
%   E-mail: lidanyang1995@smu.edu.cn

x=linspace(-1,1,size(f,1))';
for k=-N:N
    g=(transWkl(x,k,l)).^(-1)*fk(x,f,k);
end
% gn=((1-x.^2).^(1/2)).*f.*Chebyshev(x,l);
% g=2/pi*sum(gn);
end

