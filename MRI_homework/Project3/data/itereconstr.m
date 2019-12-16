function [ Mpk ] = itereconstr( data,fraction1,fraction2,loop1 )
%POSC k-Space Reconstruction 算法实现及仿真
%   输入四个参数，「data」为全空间数据，「fraction1」为部分k空间数据分数
%                「fraction2」为k空间对称低频部分，「loop1」为迭代次数
%   返回迭代后的k空间数据「Mpk」
%   输出四张图像，「full」为输入数据的2IDFT，
%                「pre errors」为迭代前全空间和部分k空间的误差图像
%                「iterative Mpk of loop1」为迭代后的重建图像，
%                「errors of iterative Mpk of loop1」为迭代后的误差图像
%   *******************************************************************
%                           李丹阳 2017/5/2
%   *******************************************************************

shadowdata=data;
[x,y]=size(shadowdata);
figure,imshow(fftshift(abs(ifft2(shadowdata))),[]),title('full')

%初值设置
%部分k空间 Mpk1
n=fraction1;
k_fra=ceil(n*y);%向大取整
Mpk1=zeros(x,y);
Mpk1(1:k_fra,:)=shadowdata(1:k_fra,:);
figure,imshow(fftshift(abs(ifft2(Mpk1)-ifft2(shadowdata))),[]),title('pre errors')

%替换数据Replacdata初次迭代设为0
ReplacData=zeros(x-k_fra,y);

%对称低频数据Symmdata,及其相位校正函数p
n1=fraction2;
[x1,y1]=size(Mpk1);
k_fra1=ceil(n1*y1);
x_small=y1/2-(k_fra1/2-1);
x_big=y1/2+1+(k_fra1/2-1);
SymmData=zeros(x1,y1);
SymmData(x_small:x_big,:)=Mpk1(x_small:x_big,:);
p=exp(1i*angle(ifft2(SymmData)));

%Mi
Mi=zeros(x,y);
Mi(1:k_fra,:)=Mpk1(1:k_fra,:);

%迭代过程
for count=1:loop1
    Mi(k_fra+1:x,:)=ReplacData;
    mi=abs(ifft2(Mi));
    PhaseConstrainData=p.*abs(mi);
    IterationData=fft2(PhaseConstrainData);
    ReplacData=IterationData(x-k_fra,y);
end

Mpk=Mi;
% mpk1=abs(ifft2(Mpk));
figure,imshow(fftshift(abs(ifft2(Mpk))),[]),title(['iterative Mpk of ',num2str(count)])
figure,imshow(fftshift(abs(ifft2(Mpk)-ifft2(shadowdata))),[])
title(['errors of iterative Mpk of ',num2str(count)])
end