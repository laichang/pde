clc
clear all
disp('AΪ��');
A = rand(5)
disp('BΪ��');
B = rand(5)
%���
disp('��A+BΪ��');
C = A + B
%���
disp('��A*BΪ��');
D = A * B
%���
disp('���A/B��');
E = A / B
%�ҳ�
disp('�ҳ�A\B��');
F = A \ B

disp('A���棺');
inv(A)
disp('A�ķ�����2��������');
norm(A)
disp('A������ֵ��');
eig(A)
disp('A������ʽ��');
det(A)