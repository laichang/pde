%P260 1(2)
clc
clear all
%�ڶ���
f = 2;
%�˴�h��x_num���ɸ�����Ŀ����
%P225����ֵ����������
% h = [1/4,1/4,1/4,1/4];%4������
% h = [0,h];%ǰ��Ӷ�0��������
% x_num = [0,1/4,1/2,3/4,1];%����5����
h = [1/8-0,1/4-1/8,1/2-1/4,1-1/2];%4������
h = [0,h];%ǰ��Ӷ�0��������
x_num = [0,1/8,1/4,1/2,1];%����5����
n = length(x_num)-1;%n������
K_count = zeros(n+1,n+1);
F_count = zeros(n+1,1);
K_last = zeros(n+1,n+1);
F_last = zeros(n+1,1);
syms x;
for i=2:n+1
    N(i-1,1) = (1/h(i))*(x_num(i)-x);
    N(i-1,2) = (1/h(i))*(x-x_num(i-1));
    B(i-1,1) = -1/h(i);
    B(i-1,2) = 1/h(i);
end
for i=2:n+1
    K = int(B(i-1,:)'*B(i-1,:),x,x_num(i-1),x_num(i));
    F = int(N(i-1,:)'*f,x,x_num(i-1),x_num(i));
    K_count(i-1,i-1) = K(1,1);
    K_count(i-1,i) = K(1,2);
    K_count(i,i-1) = K(2,1);
    K_count(i,i) = K(2,2);
    K_last = K_last+K_count;
    K_count = zeros(n+1,n+1);%���³�ʼ����ʱ����
    F_count(i-1,1) = F(1,1);
    F_count(i,1) = F(2,1);
    F_last = F_last+F_count;
    F_count = zeros(n+1,1);%���³�ʼ����ʱ����
end
K_last(1,:) = [];%ɾ����һ��
K_last(:,1) = [];%ɾ����һ��
F_last(1,:) = [];%ɾ����һ��
disp('��ֵ��Ϊ��');
u = K_last\F_last