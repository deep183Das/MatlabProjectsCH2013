%% Question 3

% parameters
C0 = 0.0005; % initial concentration
k = 0.1;   % reaction rate constant
t = 0 : 0.1 : 10; % time from 0 to 10 insteps of 0.1

% generating data
C_exact = C0 .* (exp(-k .* t)); % exact solutions
i = 1;
while(i <= 101)
    if i <= 99
        C_data(i) = C_exact(i) + (rand(1, 1) / 10)*(C_exact(i));
        C_data(i+1) = C_exact(i+1) - (rand(1, 1) / 10)*(C_exact(i+1));
        i = i+2;
    else
        C_data(i) = C_exact(i) + (rand(1, 1) / 10)*(C_exact(i));
        i = i+1;
    end
end

% computing finite difference derivative
dCdt1 = diff(C_data) ./ diff(t);
dCdt2 = diff(C_exact) ./ diff(t);

point = 1; % choosing a point

% plotting derivative vs C at a point
figure(1);
plot(C_data(1:end-1),dCdt1,'ro');
xlabel('C values');
ylabel('dC/dt (finite difference)');
title('dC/dt vs C');
grid on;
hold on;
plot(C_exact(1:end-1),dCdt2,'bo');
legend('with C_data values','with C_exact values');
hold off;

figure(2)
plot(t,C_data,'r-');
xlabel('t values');
ylabel('C values');
title('C vs t');
grid on;
hold on;
plot(t,C_exact,'g-');
legend('C_data vs t','C_exact vs t');
hold off;

k = dCdt2(point) / C_exact(point);
slope = dCdt1(point) / C_data(point);