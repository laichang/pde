%P209 4.1
clc
clear all
syms x
N = input('Please input N:')%������N�����������м��㣬��˴�ע�Ϳ�ȥ��
%Ϊ������ʾ���˴�ȡN=2
%N = 2;
fi = x.^(1:N)*(1-x);
d_fi = diff(fi,x);
x_fi = x.^2*fi;
D = int(d_fi'*d_fi,x,0,1);%�õ�N*N����
F = int(x_fi,x,0,1);
F = F';%N*1����
c = D\F;
u_evaluate = c'*fi';  %���ƽ�
u_accurate(x) = x/12*(1-x^3);
disp('��ȷ��ֵ�⣺')
accurate = subs(u_accurate,x,[0 0.25 0.5 0.75 1]);
vpa(accurate,4)
disp('������ֵ�⣺')
evaluate = subs(u_evaluate,x,[0 0.25 0.5 0.75 1]);
vpa(evaluate,4)