%% Temperature of a well mixed reactor (2_a & 2_b)

x = linspace(1, 7);
% The given function : f(x) = x - (del)*exp(x/(1 + epsilon*x))
% (del) -> heat of the reaction
figure(1);

del = 0.53;
epsilon = 0.245;
y = (x - ((del).*exp(x./(1 + epsilon.*x))));

plot(x,y, Color='r', LineStyle='-', LineWidth=1);
hold on;
legend('y = x - (0.53)*exp(x/(1 + 0.245*x)');
hold off;

%% This function f(x) has 3 roots
noofroots = 3;