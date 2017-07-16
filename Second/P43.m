%P43 4.17 4.18
clc 
clear all
N = 10;%迭代次数
tao = 0.09;
h = 0.1;
a = 1;
lamda = tao/h;
x = linspace(-1,2,31)';%要求的区间是[0,2],此处扩大区间，保证[0,2]每个离散点都能计算
u(1:31,1) = exp(x);%g(x)=exp(x)
%开始迭代
x1 = 1-lamda;
x2 = lamda;
for k=1:N
    u(2:31,2) = x1*u(2:31,1) + x2*u(1:30,1);
    %u(2:21,2) = u(2:21,1)-a*lamda*(u(2:21,1)-u(1:20,1));
    u(2:31,1) = u(2:31,2);
end
plot(x,u(1:31,1),'linewidth',3);
xlabel('x')
ylabel('u')
title('lamda=0.9  n=10')
grid on
hold on
%精确解 u=exp(x-t),t=0.9
plot(x,exp(x-0.9),'linewidth',2);
legend('近似解','精确解');