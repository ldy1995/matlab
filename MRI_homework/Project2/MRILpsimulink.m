% MRI仿真_李丹阳_2017/4/15
% 作业要求：
% 对磁化矢量M在「旋转坐标系」和「实验室坐标系」下的
%             「射频共振激发」和「弛豫过程」进行仿真

M0_z=10;
w=pi/9;
t=0:0.01:10;
%旋转坐标系
M_x1=zeros(1,length(t));
M_y1=M0_z.*sin(w*t);
M_z1=M0_z.*cos(w*t);
figure,comet3(M_x1,M_y1,M_z1),title('旋转坐标系'),grid on;
figure,plot3(M_x1,M_y1,M_z1),title('旋转坐标系'),grid on;
% 实验室坐标系
M_x=M0_z*sin(w*t).*cos(10*t);
M_y=M0_z*sin(w*t).*sin(10*t);
M_z=M0_z*cos(w*t);
figure,comet3(M_x,M_y,M_z),title('实验室坐标系'),grid on;
figure,plot3(M_x,M_y,M_z),title('实验室坐标系'),grid on;

%弛豫现象
T1=200;
T2=20;
t1=0:0.01:100;
M_z1=0.01;
Mxy1=15;
%弛豫_旋转坐标系
M1_z1=M0_z*(1-exp(-t1./T1));
M_xy1=Mxy1*exp(-t1/T2);
figure,plot(t1,M1_z1),title('旋转坐标系-弛豫z')
% figure,comet(t1,M1_z1),title('旋转坐标系-弛豫z')
grid on;
figure,plot(t1,M_xy1),title('旋转坐标系-弛豫xy')
figure,comet(t1,M_xy1),title('旋转坐标系-弛豫xy')
grid on;

%弛豫_实验室坐标系
M1_z=M0_z*(1-exp(-t1./T1));
M1_x=Mxy1*exp(-t1./T2).*cos(w*t1);
M1_y=Mxy1*exp(-t1./T2).*sin(-w*t1);
figure,plot3(M1_x,M1_y,M1_z),title('实验室坐标系-弛豫'),grid on;
figure,comet3(M1_x,M1_y,M1_z),title('实验室坐标系-弛豫'),grid on;
figure,comet(M1_x,M1_y),title('实验室坐标系-xOy面弛豫'),grid on;
figure,comet(M1_x,M1_z),title('实验室坐标系-xOz面弛豫'),grid on,xlabel('x'),ylabel('z');
figure,comet(M1_y,M1_z),title('实验室坐标系-yOz面弛豫'),grid on;xlabel('y'),ylabel('z');




