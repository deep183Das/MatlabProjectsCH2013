%% PS3 - question 2a & 2b

x = linspace(1, 8);
% The given function : f(x) = x - (del)*exp(x/(1 + epsilon*x))
% (del) -> heat of the reaction
figure(1);

del = 0.525;
epsilon = 0.243;
y = (x - ((del).*exp(x./(1 + epsilon.*x))));

plot(x,y, Color='r', LineStyle='-', LineWidth=1);
hold on;
legend('y = x - (0.525)*exp(x/(1 + 0.243*x)');
hold off;

%% This function f(x) has 3 roots 
noofroots = 3;