%% Temperature of a well mixed reactor (1_c)

x = linspace(-5, 4);
% The given function : x = (delta)*e^x
% (delta) -> heat of the reaction
figure(1);

del1 = 0.1;
y = x;
y_1 = (del1)*exp(x);
subplot(1,2,1);
plot(x,y, Color='r', LineStyle='-', LineWidth=1);
hold on;
plot(x,y_1, Color='b', LineStyle='-', LineWidth=1);
legend('y = x', 'y = (0.1)*exp(x)');
hold off;


del2 = 2;
y_2 = (del2)*exp(x);
subplot(1,2,2);
plot(x,y, Color='r', LineStyle='-', LineWidth=1);
hold on;
plot(x,y_2, Color='b', LineStyle='-', LineWidth=1);
legend('y = x', 'y = (2)*exp(x)');
hold off;


%% when delta = 0.1 , the function f(x) = x - (delta)*exp(x) will have 2 roots
%% when delta = 2 , the function f(x) = x - (delta)*exp(x) will have no root as y = x and y = (delta)*exp(x) will not intersect each other