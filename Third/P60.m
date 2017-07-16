%P60
%f(x)=1,g(x)=0
clc 
clear all
h=0.1;
tao=0.1;
lamda=tao/h;
x=0:h:1;
u(1:11,1)=ones(11,1);
u(1:11,2)=ones(11,1)*(0.5*lamda*lamda*2+(1-lamda*lamda)*1+0);
u(2:10,3)=2*u(2:10,2)-u(2:10,1)+lamda*lamda*(u(3:11,2)-2*u(2:10,2)+u(1:9,2));
for k=4:104
    u(2:10,k)=2*u(2:10,k-1)-u(2:10,k-2)+lamda*lamda*(u(3:11,k-1)-2*u(2:10,k-1)+u(1:9,k-1));
    u(2:10,k-1)=2*u(2:10,k-2)-u(2:10,k-3)+lamda*lamda*(u(3:11,k-2)-2*u(2:10,k-2)+u(1:9,k-2));
end
plot(x,u(1:11,104)','LineWidth',2);
xlabel('x');ylabel('y');