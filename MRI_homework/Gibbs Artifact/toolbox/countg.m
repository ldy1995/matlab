function [ g ] = countg( f,l,N )
%����Chebyshevϵ�� g 
%  ԭʼ����f�ڴ˺������ѹ�һ������-1��1�䣬��˲���ʹ��Chebyshev�ؽ�
%  �����f����ת������������N��ʾ���ɵĲ��ָ���Ҷ�ռ��е�����
%  kΪ-N��N��lΪchebyshev�ıƽ�����
% f=mapminmax(f);%��һ������-1,1��
%   2017/6/4  by Danyang Li
%   E-mail: lidanyang1995@smu.edu.cn

x=linspace(-1,1,size(f,1))';
for k=-N:N
    g=(transWkl(x,k,l)).^(-1)*fk(x,f,k);
end
% gn=((1-x.^2).^(1/2)).*f.*Chebyshev(x,l);
% g=2/pi*sum(gn);
end

