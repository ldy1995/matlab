%ȥ��Shepp-loganͼ��αӰ
load('Shepp_Logan_Phantom.mat');
figure,imshow(img,[]),title('Shepp Logan Phatom')
kpart=fftshift(fft2(img));
kpart(1:64,:)=0;
kpart(194:end,:)=0;
abs_kpart=rot90(abs(fft2(kpart)),2);
figure,imshow(abs_kpart,[]),title('Gibbs Artifact')
henceim=cutGibbs1(abs_kpart,3);
%ȥ��ͷ��ɨ��ͼ��αӰ
load('DWIB0.mat');
img=b0imfinal(:,:,5);%ȡ��5֡ͼ��
figure,imshow(img,[]),title('image')
kpart1=fftshift(fft2(img));
kpart1(1:55,:)=0;
kpart1(167:end,:)=0;
abs_kpart1=rot90(abs(fft2(kpart1)),2);
figure,imshow(abs_kpart1,[]),title('Gibbs Artifact')
henceim1=cutGibbs1(abs_kpart1,3.5);