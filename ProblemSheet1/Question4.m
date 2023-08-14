%% ProblemSheet#1a _ qustion 4

%% a>
x = [0:(pi/10):pi];
% [(starting point) : (interval/gap) : (ending point)]

%% b>
y = cos(x);
z = exp(-x);

figure(1);
plot(x,y,LineStyle='-', Color='g', Marker='+', LineWidth=1);  
% '-' is for solid line
grid on;
hold on;
plot(x, z,LineStyle=':', Color='c', Marker='+', LineWidth=1);
% ':' is for dotted line
legend('y = cos(x)','z = exp(-x)');

hold off;

%% c>
figure(2);
subplot( 1 , 2 , 1);
plot(x, y);
title("y = cos(x)");
subplot( 1 , 2 , 2);
plot(x, z);
title("z = exp(-x)");

%% d>
figure(3);
semilogx(x, z, LineStyle="-", Color='r', Marker='o', LineWidth=1);
title("semilog plot of z vs x");
