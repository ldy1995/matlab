load('Shepp_Logan_Phantom.mat');
kpart=fftshift(fft2(img));
kpart(1:64,:)=0;
kpart(194:end,:)=0;
% imshow(kpart,[])


N=128;
m=30;
x=linspace(-1,1,size(kpart,1))';
gm=linspace(0,0,size(kpart,1))';
%����ͼ��
gmxy=zeros(size(kpart));
for i=1:256
    f=kpart(:,i);
    for l=1:m
        gmc=countg(f,l,N)*Chebyshev(x,l);
        gm=gm+gmc;
    end%m�ε���
    gmxy(:,i)=gm;
end %256��ִ�����
for i=1:256
    f=kpart(i,:)';%ת��������
    for l=1:m
        gmc=countg(f,1,N)*Chebyshev(x,l);
        gm=gm+gmc;
    end
    gmxy(i,:)=gm';
end

