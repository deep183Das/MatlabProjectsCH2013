%% Root for 4 degree polynomial : Question_4_a

% defiing the parameters
tolerance = 1e-4;
error = 1;  % initial approximated relative error
x0 = 0; % initial guess value
max_iteration = 1000;

roots = [0, 0]; % initialisation

for iter = 1: max_iteration
    x = x0;
    % x0 = x - ((x^4 - 6*x^3 + 12*x^2 - 10*x + 3)/(4*x^3 - 18*x^2 + 24*x - 10));
    %% using modified Newton-Raphson method
    x0 = x - 3*((x^4 - 6*x^3 + 12*x^2 - 10*x + 3)/(4*x^3 - 18*x^2 + 24*x - 10));

    error = abs(x0 - x);
    if(error < tolerance)
        roots(1) = x0;
        break;
    end
end

%% new initial guess value
x1 = 4;
for iter = 1: max_iteration
    x = x1;
    x1 = x - ((x^4 - 6*x^3 + 12*x^2 - 10*x + 3)/(4*x^3 - 18*x^2 + 24*x - 10));
 
    error = abs(x1 - x);
    if(error < tolerance)
        roots(2) = x1;
        break;
    end
end

%% using two different guess values, we got all the roots of this function
%% from the plot it's clear that x = 1 has multiplicity = 3

%% plot for y vs x
x = linspace(0,6,500);
y = x.^4 - 6.*(x.^3) + 12.*(x.^2) - 10.*x + 3;
plot(x,y,LineStyle="-",Color='r',LineWidth=1);
hold on;
grid on;
hold off;
