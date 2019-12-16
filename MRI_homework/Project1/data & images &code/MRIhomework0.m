% %2017/4/8 MRI重建图像_李丹阳
% 作业要求
% –	傅里叶逆变换重建图像， 观察图像的模,相位,实部,虚部
% –	将数据第1到64行数据置0，然后重建 
% –	将数据1到64行与193到256行置0，…
% –	将数据奇数行置0， …
% –	将数据偶数行置0， …
% –	将数据奇数行置0，奇数列置0， …
% –	将数据放到512*512大小的矩阵中心，其他位置处为0， …

%将原始数据headraw.mat至于Matlab当前工作目录下
load('headraw.mat');
%观察原始数据的实部，虚部和模
Real_H=real(headraw);
Imag_H=imag(headraw);
Abs_H=abs(headraw);
Angle_H=angle(headraw);
subplot(2,2,1),image(Real_H),axis off,title('Real');
subplot(2,2,2),image(Imag_H),axis off,title('Imag');
subplot(2,2,3),image(Abs_H),axis off,title('Abs');
subplot(2,2,4),image(Angle_H),axis off,title('Angle');
saveas(gcf,'Real&Imag&Abs&Angle.png');

%重建图像
ifft2H=ifft2(headraw);
figure,imshow(ifft2H)
title('raw image');
saveas(gcf,'raw image.png');
headraw1=ones(256,256);
headraw1(1:128,1:128)=ifft2H(129:256,129:256);headraw1(129:256,129:256)=ifft2H(1:128,1:128);
headraw1(1:128,129:256)=ifft2H(129:256,1:128);headraw1(129:256,1:128)=ifft2H(1:128,129:256);
%实现上述功能的函数有fftshift和ifftshift，两者是关于圆周位移操作的函数，正反位移，对于偶数矩阵，两者效果相同
%可参看：http://blog.csdn.net/xiaomianzhou/article/details/42124535

figure,imshow(headraw1)
title('image');
saveas(gcf,'image.png');

%1到64行置零后重建
headraw1_64=headraw;
headraw1_64(1:64,:)=0;
ifft2H1_64=ifft2(headraw1_64);
headraw2(1:128,1:128)=ifft2H1_64(129:256,129:256);headraw2(129:256,129:256)=ifft2H1_64(1:128,1:128);
headraw2(1:128,129:256)=ifft2H1_64(129:256,1:128);headraw2(129:256,1:128)=ifft2H1_64(1:128,129:256);
figure,imshow(headraw2)
title('zero setting(1-64)');
saveas(gcf,'zero setting(1-64).png');

%1到64行，193到256行置零重建
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

%奇数行置零重建
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

%%偶数行置零重建
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

%%奇数行和奇数列置零重建
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

%数据放置在512*512中，重建
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