% %2017/4/8 MRI�ؽ�ͼ��_���
% ��ҵҪ��
% �C	����Ҷ��任�ؽ�ͼ�� �۲�ͼ���ģ,��λ,ʵ��,�鲿
% �C	�����ݵ�1��64��������0��Ȼ���ؽ� 
% �C	������1��64����193��256����0����
% �C	��������������0�� ��
% �C	������ż������0�� ��
% �C	��������������0����������0�� ��
% �C	�����ݷŵ�512*512��С�ľ������ģ�����λ�ô�Ϊ0�� ��

%��ԭʼ����headraw.mat����Matlab��ǰ����Ŀ¼��
load('headraw.mat');
%�۲�ԭʼ���ݵ�ʵ�����鲿��ģ
Real_H=real(headraw);
Imag_H=imag(headraw);
Abs_H=abs(headraw);
Angle_H=angle(headraw);
subplot(2,2,1),image(Real_H),axis off,title('Real');
subplot(2,2,2),image(Imag_H),axis off,title('Imag');
subplot(2,2,3),image(Abs_H),axis off,title('Abs');
subplot(2,2,4),image(Angle_H),axis off,title('Angle');
saveas(gcf,'Real&Imag&Abs&Angle.png');

%�ؽ�ͼ��
ifft2H=ifft2(headraw);
figure,imshow(ifft2H)
title('raw image');
saveas(gcf,'raw image.png');
headraw1=ones(256,256);
headraw1(1:128,1:128)=ifft2H(129:256,129:256);headraw1(129:256,129:256)=ifft2H(1:128,1:128);
headraw1(1:128,129:256)=ifft2H(129:256,1:128);headraw1(129:256,1:128)=ifft2H(1:128,129:256);
%ʵ���������ܵĺ�����fftshift��ifftshift�������ǹ���Բ��λ�Ʋ����ĺ���������λ�ƣ�����ż����������Ч����ͬ
%�ɲο���http://blog.csdn.net/xiaomianzhou/article/details/42124535

figure,imshow(headraw1)
title('image');
saveas(gcf,'image.png');

%1��64��������ؽ�
headraw1_64=headraw;
headraw1_64(1:64,:)=0;
ifft2H1_64=ifft2(headraw1_64);
headraw2(1:128,1:128)=ifft2H1_64(129:256,129:256);headraw2(129:256,129:256)=ifft2H1_64(1:128,1:128);
headraw2(1:128,129:256)=ifft2H1_64(129:256,1:128);headraw2(129:256,1:128)=ifft2H1_64(1:128,129:256);
figure,imshow(headraw2)
title('zero setting(1-64)');
saveas(gcf,'zero setting(1-64).png');

%1��64�У�193��256�������ؽ�
headraw1_64_193_256=headraw;
headraw1_64_193_256(1:64,193:256)=0;
ifft2H1_64_193_256=ifft2(headraw1_64_193_256);
headraw3=zeros(256,256);
headraw3(1:128,1:128)=ifft2H1_64_193_256(129:256,129:256);
headraw3(129:256,129:256)=ifft2H1_64_193_256(1:128,1:128);
headraw3(1:128,129:256)=ifft2H1_64_193_256(129:256,1:128);
headraw3(129:256,1:128)=ifft2H1_64_193_256(1:128,129:256);
figure,imshow(headraw3)
title('zero setting(1-64&193-256)');
saveas(gcf,'zero setting(1-64&193-256).png');

%�����������ؽ�
headrawodd=headraw;
headrawodd(1:2:end,:)=0;
ifft2Hodd=ifft2(headrawodd);
% figure,imshow(ifft2Hodd)
headrawodd1=zeros(256,256);
headrawodd1(1:128,1:128)=ifft2Hodd(129:256,129:256);
headrawodd1(129:256,129:256)=ifft2Hodd(1:128,1:128);
headrawodd1(1:128,129:256)=ifft2Hodd(129:256,1:128);
headrawodd1(129:256,1:128)=ifft2Hodd(1:128,129:256);
figure,imshow(headrawodd1)
title('zero setting(odd row)');
saveas(gcf,'zero setting(odd row).png');

%%ż���������ؽ�
headraweven=headraw;
headraweven(2:2:end,:)=0;
ifft2Heven=ifft2(headraweven);
% figure,imshow(ifft2Heven)
headraweven1=zeros(256,256);
headraweven1(1:128,1:128)=ifft2Heven(129:256,129:256);
headraweven1(129:256,129:256)=ifft2Heven(1:128,1:128);
headraweven1(1:128,129:256)=ifft2Heven(129:256,1:128);
headraweven1(129:256,1:128)=ifft2Heven(1:128,129:256);
figure,imshow(headraweven1)
title('zero setting(even row)');
saveas(gcf,'zero setting(even row).png');

%%�����к������������ؽ�
headrawodd_odd=headraw;
headrawodd_odd(1:2:end,1:2:end)=0;
ifft2Hodd_odd=ifft2(headrawodd_odd);
% figure,imshow(ifft2Hodd_odd)
headrawodd_odd1=zeros(256,256);
headrawodd_odd1(1:128,1:128)=ifft2Hodd_odd(129:256,129:256);
headrawodd_odd1(129:256,129:256)=ifft2Hodd_odd(1:128,1:128);
headrawodd_odd1(1:128,129:256)=ifft2Hodd_odd(129:256,1:128);
headrawodd_odd1(129:256,1:128)=ifft2Hodd_odd(1:128,129:256);
figure,imshow(headrawodd_odd1)
title('zero setting(odd&odd)');
saveas(gcf,'zero setting(odd&odd).png');

%���ݷ�����512*512�У��ؽ�
headraw_512=zeros(512,512);
headraw_512(129:384,129:384)=headraw;
ifft2H_512=ifft2(headraw_512);
% figure,imshow(ifft2H_512)
headraw_512_1=zeros(512,512);
headraw_512_1(1:256,1:256)=ifft2H_512(257:512,257:512);
headraw_512_1(257:512,257:512)=ifft2H_512(1:256,1:256);
headraw_512_1(1:256,257:512)=ifft2H_512(257:512,1:256);
headraw_512_1(257:512,1:256)=ifft2H_512(1:256,257:512);
figure,imshow(headraw_512_1)
title('zeroize(512)');
saveas(gcf,'zeroize(512).png');