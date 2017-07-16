clc
clear all
disp('A为：');
A = rand(5)
disp('B为：');
B = rand(5)
%求和
disp('和A+B为：');
C = A + B
%求积
disp('积A*B为：');
D = A * B
%左除
disp('左除A/B：');
E = A / B
%右除
disp('右除A\B：');
F = A \ B

disp('A的逆：');
inv(A)
disp('A的范数（2范数）：');
norm(A)
disp('A的特征值：');
eig(A)
disp('A的行列式：');
det(A)