%% ProblemSheet4 _ question 1

%% defining the variables :
P = 10*10^5; % N/m^2 => (10 * 10^5)
R = 8.314; % J/mol.K
T = 473.15; % Kelvin => (200 + 273.15)

Pc = 34*10^5; % N/m^2
Tc = 126.2; % K

% defining Van Der Waals constants "a" & "b"
a = ((0.4278*(R^2)*(Tc^2))/Pc);
b = (0.0867*R*Tc)/(Pc);

%% solving for molar volume using "Redlich-Kwong equation of state" : Newton-Raphson method
% initial guess value 
molar_volume0 = 0.003; % m^3/mol
ea = 100;

tol = 10^-6; % tolerance value
max_iterations = 100;
iter = 0;

while(iter <= max_iterations)
    iter = iter + 1;

    molar_volume = molar_volume0;
    % applying Newton-Raphson Method
    func = (R*T)/(molar_volume - b) - a/((molar_volume)*((molar_volume + b)^2)*(T^(0.5))) - P;
    func_derivative = -(R*T)/((molar_volume - b)^2) + a/((molar_volume^2)*((molar_volume + b)^2)*(T^(0.5))) + (2*a)/((molar_volume)*((molar_volume + b)^3)*(T^(0.5)));
    
    molar_volume0 = molar_volume - (func/func_derivative);
    ea = abs((molar_volume0 - molar_volume)/(molar_volume));
    array2(iter) = ea;

    if(ea < tol || iter == max_iterations)
        break;
    end
end

%% Display the answer : 
disp('Using "Redlich-Kwong equation of state" : via Newton-Raphson method : ');
disp(['The molar volume is ' num2str(molar_volume0) ' m^3/mol.']);
a = size(array2);
disp(['Number of iterations needed : ', num2str(a(2))]);

%% Plot for the relative error vs iterations
figure(2);
x = 1:a(2);
y = array2.*100;     % converting relative error to % error

plot(x,y,LineStyle="-",Color='cyan',Marker='o',MarkerFaceColor=[1, 0.5, 0],LineWidth=1);
hold on;
grid on;
title('"Redlich-Kwong equation of state" : Newton-Raphson method');
xlabel('Iterations');
ylabel('Approximate % relative error');
hold off;
