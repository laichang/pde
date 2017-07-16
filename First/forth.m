clc
clear all
%一个周期，取101个离散点
disp('101个离散点为(未加扰动)：')
x0 = linspace(0,2*pi,101)
disp('sin(x0)：')
sin_x0 = sin(x0);
cos_x0 = cos(x0);
disp('101个离散点（加上5%的扰动）为：')
x0_1 = x0 + 0.05 * ones(1,101)
disp('sin(x0)(扰动后)')
sin_x0_1 = sin(x0_1);
cos_x0_1 = cos(x0_1);
disp('h=pi/100为：');
h = pi/100

%求一阶导
for i=2:99
    a1(i) = (sin_x0(i-1)+sin_x0(i+1))/2*h;
end
disp('一阶导为：')
a1(2:99)
for i=2:99
    a1_1(i) = (sin_x0_1(i-1)+sin_x0_1(i+1))/2*h;
end
disp('一阶导为（扰动后）：')
a1_1(2:99)

%求二阶导
for i=2:99
    a2(i) = (sin_x0(i-1)-2*sin_x0(i)+sin_x0(i+1))/h*h;
end
disp('二阶导为：')
a2(2:99)
for i=2:99
    a2_2(i) = (sin_x0_1(i-1)-2*sin_x0_1(i)+sin_x0_1(i+1))/h*h;
end
disp('二阶导为（扰动后）：')
a2_2(2:99)

%求三阶导
for i=2:99
    a3(i) = (cos_x0(i-1)-2*cos_x0(i)+cos_x0(i+1))/h*h;
end
disp('三阶导为：')
a3(2:99)
for i=2:99
    a3_3(i) = (cos_x0_1(i-1)-2*cos_x0_1(i)+cos_x0_1(i+1))/h*h;
end
disp('三阶导为（扰动后）：')
a3_3(2:99)

%求四阶导
for i=2:99
    a4(i) = (-sin_x0(i-1)+2*sin_x0(i)-sin_x0(i+1))/h*h;
end
disp('四阶导为：')
a4(2:99)
for i=2:99
    a4_4(i) = (-sin_x0_1(i-1)+2*sin_x0_1(i)-sin_x0_1(i+1))/h*h;
end
disp('四阶导为（扰动后）：')
a4_4(2:99)