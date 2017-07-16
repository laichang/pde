%P209 4.1
clc
clear all
syms x
N = input('Please input N:')%若根据N的输入来进行计算，则此处注释可去掉
%为方便演示，此处取N=2
%N = 2;
fi = x.^(1:N)*(1-x);
d_fi = diff(fi,x);
x_fi = x.^2*fi;
D = int(d_fi'*d_fi,x,0,1);%得到N*N矩阵
F = int(x_fi,x,0,1);
F = F';%N*1矩阵
c = D\F;
u_evaluate = c'*fi';  %近似解
u_accurate(x) = x/12*(1-x^3);
disp('精确数值解：')
accurate = subs(u_accurate,x,[0 0.25 0.5 0.75 1]);
vpa(accurate,4)
disp('近似数值解：')
evaluate = subs(u_evaluate,x,[0 0.25 0.5 0.75 1]);
vpa(evaluate,4)