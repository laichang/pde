clc
clear all
%һ�����ڣ�ȡ101����ɢ��
disp('101����ɢ��Ϊ(δ���Ŷ�)��')
x0 = linspace(0,2*pi,101)
disp('sin(x0)��')
sin_x0 = sin(x0);
cos_x0 = cos(x0);
disp('101����ɢ�㣨����5%���Ŷ���Ϊ��')
x0_1 = x0 + 0.05 * ones(1,101)
disp('sin(x0)(�Ŷ���)')
sin_x0_1 = sin(x0_1);
cos_x0_1 = cos(x0_1);
disp('h=pi/100Ϊ��');
h = pi/100

%��һ�׵�
for i=2:99
    a1(i) = (sin_x0(i-1)+sin_x0(i+1))/2*h;
end
disp('һ�׵�Ϊ��')
a1(2:99)
for i=2:99
    a1_1(i) = (sin_x0_1(i-1)+sin_x0_1(i+1))/2*h;
end
disp('һ�׵�Ϊ���Ŷ��󣩣�')
a1_1(2:99)

%����׵�
for i=2:99
    a2(i) = (sin_x0(i-1)-2*sin_x0(i)+sin_x0(i+1))/h*h;
end
disp('���׵�Ϊ��')
a2(2:99)
for i=2:99
    a2_2(i) = (sin_x0_1(i-1)-2*sin_x0_1(i)+sin_x0_1(i+1))/h*h;
end
disp('���׵�Ϊ���Ŷ��󣩣�')
a2_2(2:99)

%�����׵�
for i=2:99
    a3(i) = (cos_x0(i-1)-2*cos_x0(i)+cos_x0(i+1))/h*h;
end
disp('���׵�Ϊ��')
a3(2:99)
for i=2:99
    a3_3(i) = (cos_x0_1(i-1)-2*cos_x0_1(i)+cos_x0_1(i+1))/h*h;
end
disp('���׵�Ϊ���Ŷ��󣩣�')
a3_3(2:99)

%���Ľ׵�
for i=2:99
    a4(i) = (-sin_x0(i-1)+2*sin_x0(i)-sin_x0(i+1))/h*h;
end
disp('�Ľ׵�Ϊ��')
a4(2:99)
for i=2:99
    a4_4(i) = (-sin_x0_1(i-1)+2*sin_x0_1(i)-sin_x0_1(i+1))/h*h;
end
disp('�Ľ׵�Ϊ���Ŷ��󣩣�')
a4_4(2:99)