%P91 例2.1
clc
clear all
h = 0.1;
lamda = 0.5;
tao = lamda*h*h;
x = 0:h:1;
u_forward(1:11,1) = sin(pi.*x); 
u_forward(1,1) = 0;
u_forward(11,1) = 0;
u_backward(1:11,1) = sin(pi.*x);
u_backward(1,1) = 0;
u_backward(11,1) = 0;
u_crank(1:11,1) = sin(pi.*x);
u_crank(1,1) = 0;
u_crank(11,1) = 0;
N = 0.4/tao;
figure
%向前差分
for k=1:N
    u_forward(2:10,2) = u_forward(2:10,1)+lamda*(u_forward(3:11,1)-2*u_forward(2:10,1)+u_forward(1:9,1));
    u_forward(1,2) = 0;
    u_forward(11,2) = 0;
    u_forward(2:10,1) = u_forward(2:10,2);
end
plot(x,u_forward(1:11,1),'-*','LineWidth',2);
hold on
%向后差分
A_backward = sparse(11,11);%向后差分格式，利用矩阵
A_backward(1,1) = 1;
A_backward(11,11) = 1;
for i=2:10
    A_backward(i,i) = 1+2*lamda;
    A_backward(i,i-1) = -1*lamda;
    A_backward(i,i+1) = -1*lamda;
end
for k=1:N
     u_backward(1:11,2) = A_backward\u_backward(1:11,1);
     u_backward(1,2) = 0;
     u_backward(11,2) = 0;
     u_backward(1:11,1) = u_backward(1:11,2);
end
plot(x,u_backward(1:11,1),'-.','LineWidth',2);
hold on
%Crank-Nicolson
A_crank = sparse(11,11);
B_crank = sparse(11,11);
A_crank(1,1) = 1;
A_crank(11,11) = 1;
B_crank(1,1) = 1;
B_crank(11,11) = 1;
for i=2:10
    A_crank(i,i) = 1+2*lamda;
    A_crank(i,i-1) = -1*lamda;
    A_crank(i,i+1) = -1*lamda;
    B_crank(i,i) = 1-2*lamda;
    B_crank(i,i-1) = lamda;
    B_crank(i,i+1) = lamda;
end
N_crank = 0.4/tao/2;
for k=1:N_crank
    u_crank(1:11,2) = (A_crank\B_crank)*u_crank(1:11,1);
    u_crank(1:11,1) = u_crank(1:11,2);
end
plot(x,u_crank(1:11,1),'-o','LineWidth',2);
hold on
plot(x,exp(-pi.^2*0.4)*sin(pi.*x),'LineWidth',2);%迭代10次，t = 0.4
title('lamda=0.5,t=0.4');
legend('向前差分','向后差分','Crank-Nicolson','精确解');