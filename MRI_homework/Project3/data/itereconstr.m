function [ Mpk ] = itereconstr( data,fraction1,fraction2,loop1 )
%POSC k-Space Reconstruction �㷨ʵ�ּ�����
%   �����ĸ���������data��Ϊȫ�ռ����ݣ���fraction1��Ϊ����k�ռ����ݷ���
%                ��fraction2��Ϊk�ռ�ԳƵ�Ƶ���֣���loop1��Ϊ��������
%   ���ص������k�ռ����ݡ�Mpk��
%   �������ͼ�񣬡�full��Ϊ�������ݵ�2IDFT��
%                ��pre errors��Ϊ����ǰȫ�ռ�Ͳ���k�ռ�����ͼ��
%                ��iterative Mpk of loop1��Ϊ��������ؽ�ͼ��
%                ��errors of iterative Mpk of loop1��Ϊ����������ͼ��
%   *******************************************************************
%                           ��� 2017/5/2
%   *******************************************************************

shadowdata=data;
[x,y]=size(shadowdata);
figure,imshow(fftshift(abs(ifft2(shadowdata))),[]),title('full')

%��ֵ����
%����k�ռ� Mpk1
n=fraction1;
k_fra=ceil(n*y);%���ȡ��
Mpk1=zeros(x,y);
Mpk1(1:k_fra,:)=shadowdata(1:k_fra,:);
figure,imshow(fftshift(abs(ifft2(Mpk1)-ifft2(shadowdata))),[]),title('pre errors')

%�滻����Replacdata���ε�����Ϊ0
ReplacData=zeros(x-k_fra,y);

%�ԳƵ�Ƶ����Symmdata,������λУ������p
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

%��������
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