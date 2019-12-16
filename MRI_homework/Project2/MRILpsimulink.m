% MRI����_���_2017/4/15
% ��ҵҪ��
% �ԴŻ�ʸ��M�ڡ���ת����ϵ���͡�ʵ��������ϵ���µ�
%             ����Ƶ���񼤷����͡���ԥ���̡����з���

M0_z=10;
w=pi/9;
t=0:0.01:10;
%��ת����ϵ
M_x1=zeros(1,length(t));
M_y1=M0_z.*sin(w*t);
M_z1=M0_z.*cos(w*t);
figure,comet3(M_x1,M_y1,M_z1),title('��ת����ϵ'),grid on;
figure,plot3(M_x1,M_y1,M_z1),title('��ת����ϵ'),grid on;
% ʵ��������ϵ
M_x=M0_z*sin(w*t).*cos(10*t);
M_y=M0_z*sin(w*t).*sin(10*t);
M_z=M0_z*cos(w*t);
figure,comet3(M_x,M_y,M_z),title('ʵ��������ϵ'),grid on;
figure,plot3(M_x,M_y,M_z),title('ʵ��������ϵ'),grid on;

%��ԥ����
T1=200;
T2=20;
t1=0:0.01:100;
M_z1=0.01;
Mxy1=15;
%��ԥ_��ת����ϵ
M1_z1=M0_z*(1-exp(-t1./T1));
M_xy1=Mxy1*exp(-t1/T2);
figure,plot(t1,M1_z1),title('��ת����ϵ-��ԥz')
% figure,comet(t1,M1_z1),title('��ת����ϵ-��ԥz')
grid on;
figure,plot(t1,M_xy1),title('��ת����ϵ-��ԥxy')
figure,comet(t1,M_xy1),title('��ת����ϵ-��ԥxy')
grid on;

%��ԥ_ʵ��������ϵ
M1_z=M0_z*(1-exp(-t1./T1));
M1_x=Mxy1*exp(-t1./T2).*cos(w*t1);
M1_y=Mxy1*exp(-t1./T2).*sin(-w*t1);
figure,plot3(M1_x,M1_y,M1_z),title('ʵ��������ϵ-��ԥ'),grid on;
figure,comet3(M1_x,M1_y,M1_z),title('ʵ��������ϵ-��ԥ'),grid on;
figure,comet(M1_x,M1_y),title('ʵ��������ϵ-xOy���ԥ'),grid on;
figure,comet(M1_x,M1_z),title('ʵ��������ϵ-xOz���ԥ'),grid on,xlabel('x'),ylabel('z');
figure,comet(M1_y,M1_z),title('ʵ��������ϵ-yOz���ԥ'),grid on;xlabel('y'),ylabel('z');




