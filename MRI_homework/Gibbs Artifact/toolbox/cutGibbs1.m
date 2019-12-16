function [ henceim ] = cutGibbs1( partKspace,n )
%   �ռ��˲�+����΢��ͼ����ǿ
%   ���벿��k�ռ����ݣ�������ǿϸ��Ȩ��n
%   2017/6/4  by Danyang Li
%   E-mail: lidanyang1995@smu.edu.cn

abs_kpart=partKspace;

%ƽ���˲�
w1=fspecial('average',3);
filim=imfilter(abs_kpart,w1,'replicate');
figure,imshow(filim,[]),title('unifom filter')

%��
%�����˲�
wl=fspecial('laplacian');%�Գ�
% lap_filim=imfilter(filim,wl,'replicate');
lap_filim=imfilter(abs_kpart,wl,'replicate');
figure,imshow(lap_filim,[]),title('Laplacian')
% һ�ױ�Ե���
ws=fspecial('sobel');%���Գ�
ws=rot90(ws,2);
sob_filim=imfilter(filim,ws,'replicate');
figure,imshow(sob_filim,[]),title('sobel')
med_sob_filim=medfilt2(sob_filim);
figure,imshow(med_sob_filim,[]),title('sobel to median')
figure,imshow(med_sob_filim-sob_filim,[]),title('errors between sobel and median')

% ���ͼ��
lapmulmedsob=lap_filim.*med_sob_filim;
tab_lapmul=imadjust(lapmulmedsob,[0.5,1],[0,1],0.8);
figure,imshow(tab_lapmul),title('detial image')

% ��ǿͼ��
henceim=tab_lapmul*10^n+filim;
figure,imshow(henceim,[]),title('hence image')

end

