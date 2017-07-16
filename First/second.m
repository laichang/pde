clc
clear all
figure
subplot(2,2,1)
ezplot('sin(x)')
title('Subplot 1: sin(x)')

subplot(2,2,2)
ezplot('cos(x)')
title('Subplot 2: cos(x)')

subplot(2,2,3)
ezplot('exp(x)')
title('Subplot 3: exp(x)')

subplot(2,2,4)
ezplot('x^2')
title('Subplot 4: x^2')