%P260 1(1)
clc
clear all
%参照P225的数值求解过程
%第一问
f = 2;
h = 1/5;%五个长度相等的单元
e = 0:h:1;
n = length(e)-1;%n个区域
K_count = zeros(n+1,n+1);%临时变量
F_count = zeros(n+1,1);%临时变量
K_last = zeros(n+1,n+1);
F_last = zeros(n+1,1);
K = (1/h)*[1 -1;-1 1];
F = h*[1;1];
for i=1:n
    K_count(i,i) = K(1,1);
    K_count(i,i+1) = K(1,2);
    K_count(i+1,i) = K(2,1);
    K_count(i+1,i+1) = K(2,2);
    K_last = K_last+K_count;
    K_count = zeros(n+1,n+1);%重新初始化临时变量
    F_count(i,1) = F(1,1);
    F_count(i+1,1) = F(2,1);
    F_last = F_last+F_count;
    F_count = zeros(n+1,1);%重新初始化临时变量
end
K_last(1,:) = [];%删除第一行
K_last(:,1) = [];%删除第一列
F_last(1,:) = [];%删除第一行
disp('数值解为：');
u = K_last\F_last