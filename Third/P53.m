%P53
 clc 
 clear all
 h=0.01;
 tao=0.005;
 lamda=0.5;
 %Lax-Friedrichs
 x=-1:h:1;
 u(1:101,1)=ones(101,1);
 u(102:201,1)=zeros(100,1);
 for k=1:100
     u(2:200,2)=0.5*(u(3:201,1)+u(1:199,1))-0.5*lamda*(u(3:201,1)-u(1:199,1));
     u(2:200,1)=u(2:200,2);
 end
 subplot(2,2,1);
 plot(x,u(1:201,1)','LineWidth',2);
 xlabel('x');ylabel('y');
 title('Lax-Friedrichs');
 
 %迎风格式
 x=-1:h:1;
 u(1:101,1)=ones(101,1);
 u(102:201,1)=zeros(100,1);
 for k=1:100
     u(2:201,2)=u(2:201,1)-lamda*(u(2:201,1)-u(1:200,1));
     u(2:201,1)=u(2:201,2);
 end
 subplot(2,2,2);
 plot(x,u(1:201,1)','LineWidth',2);
 xlabel('x');ylabel('y');
 title('迎风');
 
 %Lax-Wendroff
 x=-1:h:1;
 u(1:101,1)=ones(101,1);
 u(102:201,1)=zeros(100,1);
 for k=1:100
     u(2:200,2)=u(2:200,1)-0.5*lamda*(u(3:201,1)-u(1:199,1))+0.5*lamda*lamda*(u(3:201,1)-2*u(2:200,1)+u(1:199,1));
     u(2:200,1)=u(2:200,2);
 end
 subplot(2,2,3);
 plot(x,u(1:201,1)','LineWidth',2);
 xlabel('x');ylabel('y');
 title('Lax-Wendroff');
 
 %Beam-Warming
 x=-1:h:1;
 u(1:101,1)=ones(101,1);
 u(102:201,1)=zeros(100,1);
 for k=1:100
     u(3:201,2)=u(3:201,1)-lamda*(u(3:201,1)-u(2:200,1))-0.5*lamda*(1-0.5*lamda)*(u(3:201,1)-2*u(2:200,1)+u(1:199,1));
     u(3:201,1)=u(3:201,2);
 end
 subplot(2,2,4);
 plot(x,u(1:201,1)','LineWidth',2);
 xlabel('x');ylabel('y');
 title('Beam-Warming');