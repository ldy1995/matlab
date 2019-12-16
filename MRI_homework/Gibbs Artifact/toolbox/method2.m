load('Shepp_Logan_Phantom.mat');
kpart=fftshift(fft2(img));
kpart(1:64,:)=0;
kpart(194:end,:)=0;
% imshow(kpart,[])


N=128;
m=30;
x=linspace(-1,1,size(kpart,1))';
gm=linspace(0,0,size(kpart,1))';
%最终图像
gmxy=zeros(size(kpart));
for i=1:256
    f=kpart(:,i);
    for l=1:m
        gmc=countg(f,l,N)*Chebyshev(x,l);
        gm=gm+gmc;
    end%m次叠加
    gmxy(:,i)=gm;
end %256列执行完毕
for i=1:256
    f=kpart(i,:)';%转成列向量
    for l=1:m
        gmc=countg(f,1,N)*Chebyshev(x,l);
        gm=gm+gmc;
    end
    gmxy(i,:)=gm';
end

