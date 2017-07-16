%P43 4.17 4.18
clc 
clear all
N = 10;%��������
tao = 0.09;
h = 0.1;
a = 1;
lamda = tao/h;
x = linspace(-1,2,31)';%Ҫ���������[0,2],�˴��������䣬��֤[0,2]ÿ����ɢ�㶼�ܼ���
u(1:31,1) = exp(x);%g(x)=exp(x)
%��ʼ����
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
%��ȷ�� u=exp(x-t),t=0.9
plot(x,exp(x-0.9),'linewidth',2);
legend('���ƽ�','��ȷ��');