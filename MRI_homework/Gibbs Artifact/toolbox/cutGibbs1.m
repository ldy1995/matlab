function [ henceim ] = cutGibbs1( partKspace,n )
%   空间滤波+二阶微分图像增强
%   输入部分k空间数据，输入增强细节权重n
%   2017/6/4  by Danyang Li
%   E-mail: lidanyang1995@smu.edu.cn

abs_kpart=partKspace;

%平滑滤波
w1=fspecial('average',3);
filim=imfilter(abs_kpart,w1,'replicate');
figure,imshow(filim,[]),title('unifom filter')

%锐化
%二阶滤波
wl=fspecial('laplacian');%对称
% lap_filim=imfilter(filim,wl,'replicate');
lap_filim=imfilter(abs_kpart,wl,'replicate');
figure,imshow(lap_filim,[]),title('Laplacian')
% 一阶边缘检测
ws=fspecial('sobel');%不对称
ws=rot90(ws,2);
sob_filim=imfilter(filim,ws,'replicate');
figure,imshow(sob_filim,[]),title('sobel')
med_sob_filim=medfilt2(sob_filim);
figure,imshow(med_sob_filim,[]),title('sobel to median')
figure,imshow(med_sob_filim-sob_filim,[]),title('errors between sobel and median')

% 相乘图像
lapmulmedsob=lap_filim.*med_sob_filim;
tab_lapmul=imadjust(lapmulmedsob,[0.5,1],[0,1],0.8);
figure,imshow(tab_lapmul),title('detial image')

% 增强图像
henceim=tab_lapmul*10^n+filim;
figure,imshow(henceim,[]),title('hence image')

end

