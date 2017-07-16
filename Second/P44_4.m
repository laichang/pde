clc
clear all
N = 10;%迭代次数
tao = 0.01;
h = 0.1;
a = 1;
lamda = 0.5*tao/h/h;
x = linspace(0,1,11)';
u(1:11,1) = sin(2*pi.*x);
u(1,1)=0;
u(11,1)=0;
A = sparse(11,11);
B = sparse(11,11);
A(1,1) = 1;
A(11,11) = 1;
B(1,1) = 1;
B(11,11) = 1;
for i=2:10
    A(i,i-1) = -lamda;
    A(i,i) = 1+2*lamda;
    A(i,i+1) = -lamda;
    B(i,i-1) = lamda;
    B(i,i) = 1-2*lamda;
    B(i,i+1) = lamda;
end
for k=1:N
    u(1:11,2) = (A\B)*u(1:11,1);%此处不用追赶法
    u(1,2) = 0;
    u(11,2) = 0;
    u(1:11,1) = u(1:11,2);
end
plot(x,u(1:11,1),'linewidth',3);
xlabel('x')
ylabel('u')
title('lamda=1/2,N=10,t=0.1')
hold on
t = tao*N;%t=0.1
plot(x,exp(-4*pi*pi*t)*sin(2*pi.*x),'linewidth',2);
legend('近似解','精确解');