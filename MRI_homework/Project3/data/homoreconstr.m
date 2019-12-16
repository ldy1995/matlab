function [ m ] = homoreconstr( data,fraction1,fraction2 )
%Homodyne Reconstruction  算法实现和仿真

%   输入3个参数，「data」为全空间数据，
%               「 fraction1」，部分k空间所占比例
%                「fraction2」，低频对称k空间所占比例
%   函数返回「m」，利用homodyne 重建算法所得校正图像的实部
%   函数过程中会生成3幅图像，「full」为输入的全空间图像
%                          「desired image」为算法校正图像
%                          「errors」为误差图像
%   *******************************************************************
%                           李丹阳 2017/5/2
%   *******************************************************************                           

shadowdata=data;
[or_x,or_y]=size(shadowdata);
figure,imshow(fftshift(abs(ifft2(shadowdata))),[]),title('full')
%partial k-space data
n=fraction1;
ky_boundry=ceil(or_x*n);
Mpk=zeros(or_x,or_y);
Mpk(1:ky_boundry,:)=shadowdata(1:ky_boundry,:);
%symmetric data
n1=fraction2;
ky_low=or_x*(1-n1)/2+1;
ky_hig=or_x*((1-n1)/2+n1);
symmData=zeros(or_x,or_y);
symmData(ky_low:ky_hig,:)=Mpk(ky_low:ky_hig,:);
%data of phase corraction
ph=exp(-1i*angle(ifft2(symmData)));

%linear ramp weighting 线性斜坡加权函数
%rampdata
ramp_x=1:1:ky_hig-ky_low+1;
ramp_y=(2/((ky_hig-ky_low+1))).*ramp_x;
ramp_y=fliplr(ramp_y);
% Wky(:,ky_low:ky_hig)=ramp_y;
% Wky(:,1:ky_low-1)=0;
Wky=2*ones(1,or_x);
Wky(1,ky_low:ky_hig)=ramp_y;
Wky(1,ky_hig+1:end)=0;
Wky=Wky';
%转成2D
[Mx,My]=size(Mpk);
Wmatrix=zeros(Mx,My);
 for number=1:My
    Wmatrix(:,number)=Wky;
 end
Wky=Wmatrix;

% mpk_w of Mpk_M of weighting partial k-space
Mpk_W=Mpk.*Wky;
mpk_w=ifft2(Mpk_W);

%phase corraction and real part in image domin
phascorr_mpk=mpk_w.*ph;
m=real(phascorr_mpk);
figure,imshow(fftshift(m),[]),title('desired image')
figure,imshow(fftshift(abs(ifft2(shadowdata))-m),[]),title('errors')
end

