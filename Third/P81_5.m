%P81 5
clc
clear all
h=0.1;
tao=0.05;
lamda=0.5;
x=0:h:1;
u(1:3,1)=zeros(3,1);
u(8:11,1)=zeros(4,1);
u(4:7,1)=ones(4,1);
%t=0.5
figure('name','t=0.5');
%迎风格式
for k=1:10
    u(2:11,2)=u(2:11,1)-lamda*(u(2:11,1)-u(1:10,1));
    u(2:11,1)=u(2:11,2);
end
subplot(3,1,1);
plot(x,u(1:11,1)','LineWidth',2);
xlabel('x');ylabel('y');
title('迎风,t=0.5');
%Lax-Friedrichs
x=0:h:1;
u(1:3,1)=zeros(3,1);
u(8:11,1)=zeros(4,1);
u(4:7,1)=ones(4,1);
for k=1:10
    u(2:10,2)=0.5*(u(3:11,1)+u(1:9,1))-0.5*lamda*(u(3:11,1)-u(1:9,1));
    u(2:10,1)=u(2:10,2);
end
subplot(3,1,2);
plot(x,u(1:11,1)','LineWidth',2);
xlabel('x');ylabel('y');
title('Lax-Friedrichs,t=0.5');
%Lax-Wendroff
x=0:h:1;
u(1:3,1)=zeros(3,1);
u(8:11,1)=zeros(4,1);
u(4:7,1)=ones(4,1);
for k=1:10
     u(2:10,2)=u(2:10,1)-0.5*lamda*(u(3:11,1)-u(1:9,1))+0.5*lamda*lamda*(u(3:11,1)-2*u(2:10,1)+u(1:9,1));
     u(2:10,1)=u(2:10,2);
end
subplot(3,1,3);
plot(x,u(1:11,1)','LineWidth',2);
xlabel('x');ylabel('y');
title('Lax-Wendroff,t=0.5');

%t=1
figure('name','t=1');
%迎风格式
for k=1:20
    u(2:11,2)=u(2:11,1)-lamda*(u(2:11,1)-u(1:10,1));
    u(2:11,1)=u(2:11,2);
end
subplot(3,1,1);
plot(x,u(1:11,1)','LineWidth',2);
xlabel('x');ylabel('y');
title('迎风,t=1');
%Lax-Friedrichs
x=0:h:1;
u(1:3,1)=zeros(3,1);
u(8:11,1)=zeros(4,1);
u(4:7,1)=ones(4,1);
for k=1:20
    u(2:10,2)=0.5*(u(3:11,1)+u(1:9,1))-0.5*lamda*(u(3:11,1)-u(1:9,1));
    u(2:10,1)=u(2:10,2);
end
subplot(3,1,2);
plot(x,u(1:11,1)','LineWidth',2);
xlabel('x');ylabel('y');
title('Lax-Friedrichs,t=1');
%Lax-Wendroff
x=0:h:1;
u(1:3,1)=zeros(3,1);
u(8:11,1)=zeros(4,1);
u(4:7,1)=ones(4,1);
for k=1:20
     u(2:10,2)=u(2:10,1)-0.5*lamda*(u(3:11,1)-u(1:9,1))+0.5*lamda*lamda*(u(3:11,1)-2*u(2:10,1)+u(1:9,1));
     u(2:10,1)=u(2:10,2);
end
subplot(3,1,3);
plot(x,u(1:11,1)','LineWidth',2);
xlabel('x');ylabel('y');
title('Lax-Wendroff,t=1');