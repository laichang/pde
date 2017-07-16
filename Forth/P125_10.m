%P125 10
clc
clear all
h = 0.1;
lamda1 = 0.1;
lamda2 = 0.5;
tao = lamda1*h*h;
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
N = 0.1/tao;
figure
%向前差分
for k=1:N
    u_forward(2:10,2) = u_forward(2:10,1)+lamda1*(u_forward(3:11,1)-2*u_forward(2:10,1)+u_forward(1:9,1));
    u_forward(2:10,1) = u_forward(2:10,2);
end
plot(x,u_forward(1:11,1),'-*','LineWidth',2);
hold on
%向后差分
A_backward = sparse(11,11);%向后差分格式，利用矩阵
A_backward(1,1) = 1;
A_backward(11,11) = 1;
for i=2:10
    A_backward(i,i) = 1+2*lamda1;
    A_backward(i,i-1) = -1*lamda1;
    A_backward(i,i+1) = -1*lamda1;
end
for k=1:N
     u_backward(1:11,2) = A_backward\u_backward(1:11,1);
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
    A_crank(i,i) = 1+2*lamda1;
    A_crank(i,i-1) = -1*lamda1;
    A_crank(i,i+1) = -1*lamda1;
    B_crank(i,i) = 1-2*lamda1;
    B_crank(i,i-1) = lamda1;
    B_crank(i,i+1) = lamda1;
end
N_crank = 0.1/tao/2;
for k=1:N_crank
    u_crank(1:11,2) = (A_crank\B_crank)*u_crank(1:11,1);
    u_crank(1:11,1) = u_crank(1:11,2);
end
plot(x,u_crank(1:11,1),'-o','LineWidth',2);
hold on
plot(x,exp(-pi.^2*0.1)*sin(pi.*x),'LineWidth',2);%t = 0.1
title('lamda=0.1,t=0.1');
legend('向前差分','向后差分','Crank-Nicolson','精确解');