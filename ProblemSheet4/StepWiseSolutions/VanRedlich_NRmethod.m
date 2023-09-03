clear;  clc;
close all;

%% This file calls the two .m files having N-R methods and plots a graph which compares for both the equations' approximated relative errors

VanDerWaals_NR;
close;
a1 = size(array1);
x1 = 1:a1(2);
y1 = array1.*100;

RedlichKwong_NR;
close;
a2 = size(array2);
x2 = 1:a2(2);
y2 = array2.*100;

figure;
plot(x1,y1,LineStyle="-",Color='b',Marker='o',MarkerFaceColor=[1, 1, 0.5],LineWidth=1);
hold on;
grid on;

title('Comparing approximate %relative errors : Newton Raphson Method');
xlabel('Iterations');
ylabel('Approximate % relative error');

plot(x2,y2,LineStyle="-",Color='g',Marker='o',MarkerFaceColor=[1, 0.5, 0.5],LineWidth=1);
legend('"Van Der Waals equation of state"', '"Redlich-Kwong equation of state"');

hold off;