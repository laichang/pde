%P260 1(1)
clc
clear all
%����P225����ֵ������
%��һ��
f = 2;
h = 1/5;%���������ȵĵ�Ԫ
e = 0:h:1;
n = length(e)-1;%n������
K_count = zeros(n+1,n+1);%��ʱ����
F_count = zeros(n+1,1);%��ʱ����
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
    K_count = zeros(n+1,n+1);%���³�ʼ����ʱ����
    F_count(i,1) = F(1,1);
    F_count(i+1,1) = F(2,1);
    F_last = F_last+F_count;
    F_count = zeros(n+1,1);%���³�ʼ����ʱ����
end
K_last(1,:) = [];%ɾ����һ��
K_last(:,1) = [];%ɾ����һ��
F_last(1,:) = [];%ɾ����һ��
disp('��ֵ��Ϊ��');
u = K_last\F_last